package controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.ItemException;
import logic.Item;
import logic.Receive;
import logic.ShopService;
/*
 * @Component : 객체화 대상이 되는 클래스
 * Controller 기능 : url의 요청시 호출되는 클래스
 */
@Controller  //@Component + Controller 기능
@RequestMapping("item") // http://localhost:8088/springmvc1/item
public class ItemController {
	@Autowired  //ShopService 객체를 주입
	private ShopService service;
	Map<String, String> tags = new HashMap<String, String>() {
		{	put("Phone","Phone"); 
			put("Graphic card","Graphic card");
			put("CPU","CPU");
			put("Memory","Memory");
			put("Main board","Main board");
			put("SSD/HHD","SSD/HHD");
			put("RAM","RAM");
			put("Power","Power");
			put("Keyboard","Keyboard");
			put("Mouse","Mouse");		}
	};
	Map<String, String> qualities = new HashMap<String, String>(){
		{	put("1","S급"); //value:1, label:S
			put("2","A급");
			put("3","B급");   }
	};
	
	// http://localhost:8088/slopal/item/create
	@RequestMapping("create")
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new Item());
		mav.addObject("tags", tags);
		mav.addObject("qualities", qualities);
		return mav;
	}
	
	@RequestMapping("register")
	public ModelAndView register(@Valid Item item, BindingResult bresult, HttpServletRequest request) {
		//"item/create" : 뷰의 이름을 설정. 원래화면은 item의 create이기때문에
		ModelAndView mav = new ModelAndView("item/create");
		if(bresult.hasErrors()) { //유효성 검증에 오류가 존재한다면
			mav.getModel().putAll(bresult.getModel()); //bresult.getModel(): 유효성 검증오류 났던 item객체.
			//유효성 검증오류 났던 item객체.를 create의 modelAttribute item객체에 넘김
			mav.addObject("tags", tags);
			mav.addObject("qualities", qualities);
			return mav;
		}
		//item: 요청 파라미터 내용, 업로드된 파일의 내용을 저장하는 객체
		//request: 요청객체
		try {
			item.setName(request.getParameter("name").trim()); //공백제거
			service.itemCreate(item, request);
		} catch (DuplicateKeyException e) { //이미 등록된 상품(제품이름이 같고 AND 제품품질이 같다면)
			throw new ItemException("이미 등록되어 있는 제품입니다.", "list");//♡
		}
		
		mav.setViewName("redirect:list"); //유효성 검증 성공 -> list로 넘어가도록
		return mav;
	}
	
	@GetMapping({"update", "delete"}) 
	public ModelAndView updateForm(Integer id) { //수정form 화면
		ModelAndView mav = new ModelAndView(); //뷰의 기본 값은 url 설정값
		Item item = service.getItem(id);
		mav.addObject("item",item);
		mav.addObject("tags", tags);
		mav.addObject("qualities", qualities);
		return mav;
	}
	
	@PostMapping("update")
	public ModelAndView update(@Valid Item item, BindingResult bresult, HttpServletRequest request) { //수정등록 버튼 눌렀을때 화면
		ModelAndView mav = new ModelAndView();
		 // 1. 입력값 유효성 검증
		if(bresult.hasErrors()) { //입력값 오류
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		//db 수정 & 파일 업로드 
		service.itemUpdate(item, request); 
		mav.setViewName("redirect:list");
		return mav;
	}
	
	@PostMapping("delete")
	public ModelAndView delete(Integer id) {
		ModelAndView mav = new ModelAndView();
		try {
			service.itemDelete(id);
		} catch(DataIntegrityViolationException e) {
			throw new ItemException("주문된 상품이므로 삭제 불가합니다.", "list");
		}
		mav.setViewName("redirect:list");
		return mav;
	}
	
	@GetMapping("detail")
	public ModelAndView detail(Integer id) {//request.getParameter("name") : name 매개변수명 == 파라미터 이름
		ModelAndView mav = new ModelAndView();
		Item item = service.getItem(id);
		String qualName = null; //품질
		switch(item.getQuality()) {
		case "1": qualName = "S급"; break;
		case "2": qualName = "A급"; break;
		case "3": qualName = "B급"; break;
		}
		// 수량선택 : max는 입고수량-주문상품수량으로 정하기
		int maxcnt = 0;
		try {
			int incnt = service.getIncnt(item.getName(), item.getQuality()); //입고db의 입고수량 합
			int salecnt = service.getSalequantity(item.getName(),item.getQuality()); //주문상품db(saleitem)의 주문수량 합
			maxcnt = incnt-salecnt;
			if (maxcnt <= 0) maxcnt=0;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		//System.out.println(maxcnt); //디버깅
		mav.addObject("item",item);
		mav.addObject("qualName",qualName);
		mav.addObject("maxcnt", maxcnt);
		return mav;
	}
	
	@RequestMapping("list")
	public ModelAndView list(String tag, String find, HttpSession session) {
		//ModelAndView : 데이터+뷰 정보 저장 
		ModelAndView mav = new ModelAndView();
		//itemList : db의 item 테이블의 모든 데이터를 Item 객체들로 저장 객체
		if (tag == null || tag.equals("")) {//boardid 파라미터가 없는 경우 1로 설정
			tag = "ALL";
		}
		session.setAttribute("tag", tag); //게시판 종류 세션에 등록
		
		//검색 관련
		if (find == null || find.trim().equals("")) {
			find = null;
		}
		
		List<Item> itemList = service.itemList(tag, find);
		mav.addObject("itemList",itemList); //데이터 저장.
		mav.addObject("find", find);
		mav.addObject("tags",tags);
		mav.addObject("qualities", qualities);
		return mav;	
	}
	///////////////////////////////////////////////////////
	
	@GetMapping("inCreate")
	public ModelAndView inCreate(Integer id) {
		ModelAndView mav = new ModelAndView();
		Item item = service.getItem(id);
		String qualName = null; //품질
		switch(item.getQuality()) {
		case "1": qualName = "S급"; break;
		case "2": qualName = "A급"; break;
		case "3": qualName = "B급"; break;
		}
		// 수량선택 : max는 입고수량-주문상품수량으로 정하기
		int maxcnt = 0;
		try {
			int incnt = service.getIncnt(item.getName(), item.getQuality()); //입고db의 입고수량 합
			int salecnt = service.getSalequantity(item.getName(),item.getQuality()); //주문상품db(saleitem)의 주문수량 합
			maxcnt = incnt-salecnt;
			if (maxcnt <= 0) maxcnt=0;
		} catch(Exception e) {
			e.printStackTrace();
		}
		///////////입고목록 부분////////////////
		String itemName = item.getName();
		String itemQuality = item.getQuality();
		// itemName,itemQuality가 이 아이템과 같은 것 입고DB에서 list 조회해야함
		List<Receive> inList = service.getReceiveListSameItem(itemName,itemQuality);
		int listcount = service.receiveItemcnt(itemName,itemQuality);
		
		mav.addObject("inNo", listcount);
		mav.addObject("listcount", listcount);
		mav.addObject("inList",inList);
		mav.addObject("item",item);
		mav.addObject("qualName",qualName);
		mav.addObject("maxcnt", maxcnt);
		mav.addObject("receive",new Receive()); //form데이터의 modelAttribute 때문.
		return mav;
	}
	
	@PostMapping("inregister")
	public ModelAndView inregister(@Valid Receive receive, BindingResult bresult) {
		Item item = service.getItemNQ(receive.getItemName(),receive.getItemQuality());
		String url = "item/inCreate?id="+item.getId();
		ModelAndView mav = new ModelAndView(url);
		if(bresult.hasErrors()) { //유효성 검증에 오류가 존재한다면
			mav.getModel().putAll(bresult.getModel());
			mav.setViewName("redirect:inCreate?id="+item.getId());
			return mav;
		}
		try {
			service.receiveCreate(receive);
		} catch (Exception e) { //이미 등록된 상품(제품이름이 같고 AND 제품품질이 같다면)
			e.printStackTrace();
		}
		mav.setViewName("redirect:inCreate?id="+item.getId());
		return mav;
	}
	
	@GetMapping({"inUpdate","inDelete"})
	public ModelAndView inUpdate(Integer id) {
		ModelAndView mav = new ModelAndView();
		Receive receive = service.getReceive(id);
		String qualName = null; //품질
		switch(receive.getItemQuality()) {
		case "1": qualName = "S급"; break;
		case "2": qualName = "A급"; break;
		case "3": qualName = "B급"; break;
		}
		mav.addObject("qualName", qualName);
		mav.addObject("in", receive);
		mav.addObject("receive", new Receive());
		return mav;
	}
	
	@PostMapping("inupdate")
	public ModelAndView inUpdate(@Valid Receive receive, BindingResult bresult) {
		ModelAndView mav = new ModelAndView();
		Item item = service.getItemNQ(receive.getItemName(),receive.getItemQuality());
		String url = "item/inCreate?id="+item.getId();
		
		if(bresult.hasErrors()) { //유효성 검증에 오류가 존재한다면
			mav.getModel().putAll(bresult.getModel());
			mav.setViewName("redirect:inUpdate?id="+item.getId());
			return mav;
		}
		try {
			service.receiveUpdate(receive);
		} catch(Exception e) {
			e.printStackTrace();
			throw new ItemException("입고수량이 변경되지 않았습니다.", "inUpdate?id="+receive.getId());
		}
		mav.setViewName("redirect:inCreate?id="+item.getId());
		return mav;
	}

	@PostMapping("inDelete")
	public ModelAndView inDelete(Integer id) {
		ModelAndView mav = new ModelAndView();
		Receive receive = service.getReceive(id);
		Item item = service.getItemNQ(receive.getItemName(),receive.getItemQuality());
		//db에서 삭제
		try {
			service.receiveDelete(id);
		} catch(Exception e) {
			e.printStackTrace();
			throw new ItemException("입고 기록 삭제 시 오류 발생", "inDelete?id="+id);
		}
		mav.setViewName("redirect:inCreate?id="+item.getId());
		return mav;
	}
	
}
