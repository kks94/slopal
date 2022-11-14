package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import exception.LoginException;
import logic.ShopService;
import logic.Wish;

@Controller
@RequestMapping("wish")
public class WishController {
	@Autowired
	private ShopService service;
	@GetMapping("*") //* : 그외 모든 get방식 요청 
	public ModelAndView getUser() {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new Wish());
		return mav;
	}
	@PostMapping("itemWished")
	public ModelAndView itemWished
	             (@Valid Wish wish,BindingResult bresult) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) { //입력값 오류 발생
			mav.getModel().putAll(bresult.getModel());
			//전체적인 오류코드 등록
			bresult.reject("error.input.user");
			return mav;
		}
		//db에 찜정보 등록
		try {
			service.wishInsert(wish);
			mav.addObject("wish",wish);
		
		} catch(DataIntegrityViolationException e) {
			e.printStackTrace();
			bresult.reject("error.duplicate.wish");
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		mav.setViewName("redirect:itemWished");
		return mav;
	}
}