package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Board;
import logic.ShopService;

@Controller
@RequestMapping("board")
public class BoardController {

	@Autowired
	private ShopService service;
	
	@RequestMapping("list")
	public ModelAndView list
	    (Integer pageNum, String boardid,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(pageNum == null || pageNum.toString().equals("")) {
			   pageNum = 1;  //pageNum 파라미터가 없는 경우 1로 설정
		}
		if(boardid == null || boardid.equals("")) {
			boardid = "1"; //boardid 파라미터가 없는 경우 1로 설정
		}
		session.setAttribute("boardid", boardid); //게시판 종류 세션에 등록
		String boardName=null; //게시판이름 저장
		switch(boardid) {
			case "1" : boardName = "공지사항"; break;
			case "2" : boardName = "자유게시판"; break;
			case "3" : boardName = "QNA"; break;
		}
		int limit = 10; //한페이지에 출력될 게시물 갯수. 한페이지10개씩 출력
		//게시판종류별 등록된 게시글 갯수
		int listcount = service.boardcount(boardid); 
		//boardlist : 한페이지에 출력될 게시물 목록
		List<Board> boardlist = service.boardlist
				(pageNum,limit,boardid);

		//페이징처리를 위한 데이터
		//최대 페이지 
		/* listcount   maxpage
		 *    1           1
		 *    (int)((double)1/10 + 0.95) => 0.1+0.95 = 1.05 => 1
		 *   10           1
		 *    (int)((double)10/10 + 0.95) => 1.0+0.95 = 1.95 =>1
		 *   11           2 
		 *    (int)((double)11/10 + 0.95) => 1.1+0.95 = 2.05 =>2
		 *   500          50 
		 *    (int)((double)500/10 + 0.95) => 50.0+0.95 = 50.95 =>50
		 *   501          51 
		 *    (int)((double)501/10 + 0.95) => 50.1+0.95 = 51.05 =>51
		 */
		int maxpage = (int)((double)listcount/limit + 0.95);
		//화면에 표시될 페이지의 시작번호
		/*   pageNum   startpage
		 *      1          1
		 *      (int)((1/10.0 + 0.9) - 1) * 10 + 1 =>
		 *            ((0.1+0.9)-1) * 10 + 1 => 1
		 *      5          1
		 *      (int)((5/10.0 + 0.9) - 1) * 10 + 1 =>
		 *            ((0.5+0.9)-1) * 10 + 1 => 1
		 *      10         1
		 *      (int)((10/10.0 + 0.9) - 1) * 10 + 1 =>
		 *            ((1.0+0.9)-1) * 10 + 1 => 1
		 *      11         11
		 *      (int)((11/10.0 + 0.9) - 1) * 10 + 1 =>
		 *            ((1.1+0.9)-1) * 10 + 1 => 11
		 *      20         11
		 *      (int)((20/10.0 + 0.9) - 1) * 10 + 1 =>
		 *            ((2.0+0.9)-1) * 10 + 1 => 11
		 */
		int startpage = (int)((pageNum/10.0 + 0.9) - 1) * 10 + 1;
		//화면에 표시될 페이지의 끝번호, 시작번호부터 10개
		int endpage = startpage + 9;
		//endpage는 maxpage를 넘으면 안됨.
		if(endpage > maxpage) endpage = maxpage;
		//화면에 표시될 순차적인 게시물번호
		/*
		 * listcount pageNum boardno
		 *    1         1        1
		 *    1 - (1 - 1) * 10 =>1
		 *    11        1        11 
		 *    11 - (1 - 1) * 10 =>11
		 *    11        2        1 
		 *    11 - (2 - 1) * 10 =>1
		 */
		int boardno = listcount - (pageNum - 1) * limit;
		//list.jsp 뷰에 전달할 데이터 설정
		mav.addObject("boardid",boardid);  
		mav.addObject("boardName", boardName); 
		mav.addObject("pageNum", pageNum); 
		mav.addObject("maxpage", maxpage); 
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage); 
		mav.addObject("listcount", listcount);
		mav.addObject("boardlist", boardlist);
		mav.addObject("boardno", boardno); 
		return mav;		
	}
	@GetMapping("write")
	public ModelAndView getBoard(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String boardid = (String)session.getAttribute("boardid");
		if(boardid == null) boardid="1";
		String boardName = null;
		switch(boardid) {
		case "1" :  boardName="공지사항"; break;
		case "2" :  boardName="자유게시판"; break;
		case "3" :  boardName="QNA"; break;
		}
		mav.addObject("board",new Board()); 
		mav.addObject("boardName",boardName); 		
		return mav;
	}
	
}
