package logic;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.ItemDao;
import dao.ReceiveDao;
import dao.SaleItemDao;
import dao.UserDao;
import dao.WishDao;
/*
 * @Component : 해당 클래스를 객체화
 * Service 기능 : Controller와 Model 사이의 중간 역할의 클래스
 */
@Service //@Component + Service 기능
public class ShopService {
	@Autowired //ItemDao객체를 주입.
	private ItemDao itemDao;
	@Autowired 
	private UserDao userDao;
	@Autowired
	private ReceiveDao receiveDao;
	@Autowired
	private SaleItemDao saleItemDao;
	@Autowired
	private WishDao wishDao;
	
	public void wishInsert(Wish wish) {
		wishDao.insert(wish);
	}

	/////////////////////////user//////////////////////////////////////////////////////////////////////////////////
	public void userInsert(User user) {
		userDao.insert(user);
	}

	public User getUser(String userid) {
		return userDao.selectOne(userid);
	}

	public void userUpdate(User user) {
		userDao.update(user);
	}

	public void userDelete(String userid) {
		userDao.delete(userid);
	}

	public void userChgpass(String userid, String chgpass) {
		userDao.chgpass(userid, chgpass);
	}

	public String getSearch(User user, String url) {
		return userDao.search(user, url);
	}

	public List<User> userlist() { //admin 관리페이지
		return userDao.list();
	}

	//////////////////////////item///////////////////////////////////////////////////////////////////////////////////
	//db에 내용 저장 & 파일 업로드
	//item : 저장정보. 입력된 파라미터값 + 업로드된 파일의 내용
	public void itemCreate(Item item, HttpServletRequest request) {
		//item.getFile() : 업로드된 파일의 내용
		if (item.getPicture() != null && !item.getPicture().isEmpty()) { // 업로드된 파일이 존재한다면
			//request.getServletContext().getRealPath("/") : 웹어플리케이션 위치 webapp/
			String uploadPath = request.getServletContext().getRealPath("/")+"img/";
			uploadFileCreate(item.getPicture(), uploadPath); //업로드 구현
			item.setPictureUrl(item.getPicture().getOriginalFilename()); //파일의 이름 설정
		}
		//maxId: item 테이블 중 최대 id 값
		int maxid = itemDao.maxId();
		
		//이름 같은 제품(품질은 다른)이 있다면 grp같게, 없다면 maxGrp+1
		List<Item> itemList = getsameNamelist(item.getName());
		if(!itemList.isEmpty()) {
			item.setGrp(itemList.get(0).getGrp());
		} else {
			int maxGrp = itemDao.maxGrp();
			item.setGrp(maxGrp+1);
		}
		
		item.setId(maxid+1);
		itemDao.insert(item); 
	}
	
	public List<Item> getsameNamelist(String name) {
		return itemDao.sameNamelist(name);
	}
	
	private void uploadFileCreate(MultipartFile file, String uploadPath) {
		//uploadPath : 파일이 업로드되는 폴더
		String orgFile = file.getOriginalFilename(); //파일 이름
		File fpath = new File(uploadPath);
		if(!fpath.exists()) fpath.mkdirs(); //업로드 폴더 없으면 생성
		try {
			//파일의 내용 => uploadPath + orgFile 로 파일 저장
			file.transferTo(new File(uploadPath + orgFile)); //파일업로드
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Item getItem(Integer id) {
		return itemDao.getItem(id);
	}

	public void itemUpdate(Item item, HttpServletRequest request) {
		if(item.getPicture() != null && !item.getPicture().isEmpty()) { // 업로드된 파일이 존재한다면
			String uploadPath = request.getServletContext().getRealPath("/")+"img/";
			//파일 업로드 : 업로드된 내용을 서버에 파일 저장
			uploadFileCreate(item.getPicture(), uploadPath);
			item.setPictureUrl(item.getPicture().getOriginalFilename()); //파일이름을 db에 등록하기 위해 설정
		}
		itemDao.update(item);
		
	}

	public void itemDelete(Integer id) {
		itemDao.delete(id);
	}
	
	public List<Item> itemList(String tag, String find) {
		if(tag.equals("ALL")) tag=null;
		return itemDao.list(tag, find);
	}
	//입고db의 입고수량 합(itemController의 detail에서 사용)
	public int getIncnt(String name, String quality) {
		return receiveDao.getIncnt(name, quality);
	}

	public int getSalequantity(String name, String quality) {
		return saleItemDao.getSalequantity(name, quality);
	}

	// itemName,itemQuality가 이 아이템과 같은 것의 입고기록들 입고DB에서 list 조회해야함
	public List<Receive> getReceiveListSameItem(String itemName, String itemQuality) {
		return receiveDao.getReceiveListSameItem(itemName,itemQuality);
	}
	
	//같은 item에 대한 입고기록 갯수
	public int receiveItemcnt(String itemName, String itemQuality) {
		return receiveDao.itemcnt(itemName,itemQuality);
	}

	//입고 등록
	public void receiveCreate(Receive receive) {
		int maxid = receiveDao.maxId();
		receive.setId(maxid+1);
		receiveDao.insert(receive);
		
	}

	public Item getItemNQ(String itemName, String itemQuality) {
		return itemDao.getItemNQ(itemName, itemQuality);
	}

	public Receive getReceive(Integer id) {
		return receiveDao.getReceive(id);
	}

	public void receiveUpdate(Receive receive) {
		receiveDao.update(receive);
	}

	public void receiveDelete(Integer id) {
		receiveDao.delete(id);
	}

	

	
}
