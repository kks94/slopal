package controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.ShopService;
import logic.User;
/*
 * AdminController의 모든 메서드들은 반드시 관리자로 로그인 해야 실행되도록
 * AOP 설정해야함 => AdminLoginAspect 클래스 생성.
 *   1. 로그아웃 : 로그인하세요. login 페이지로 이동
 *   2. 관리자 아닌 경우 : 관리자만 거래 가능합니다. mypage 페이지로 이동
 */
@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private ShopService service;
	
	//http://localhost:8088/springmvc1/admin/list
	@RequestMapping("list")
	public ModelAndView list(Integer sort, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<User> list = service.userlist();
		if(sort == null) sort=0; //정렬 안함
		switch(sort) {
		case 1 : //아이디의 오름차순
			Collections.sort(list, (u1,u2) -> u1.getUserid().compareTo(u2.getUserid()));
			break;
		case 2 : //아이디의 내림차순
			Collections.sort(list, (u1,u2) -> u2.getUserid().compareTo(u1.getUserid()));
			break;
		case 3 : //이름의 오름차순
			Collections.sort(list, (u1,u2) -> u1.getUsername().compareTo(u2.getUsername()));
			break;
		case 4 : //이름의 내림차순
			Collections.sort(list, (u1,u2) -> u2.getUsername().compareTo(u1.getUsername()));
			break;
		case 5 : //이메일의 오름차순
			Collections.sort(list, (u1,u2) -> u1.getEmail().compareTo(u2.getEmail()));
			break;
		case 6 : //이메일의 내림차순
			Collections.sort(list, (u1,u2) -> u2.getEmail().compareTo(u1.getEmail()));
			break;
		}
		mav.addObject("list", list);
		return mav;
	}
}
