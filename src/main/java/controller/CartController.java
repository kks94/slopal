package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import logic.ShopService;

@Controller  //@Component + Controller 기능
@RequestMapping("cart") // http://localhost:8088/springmvc1/item
public class CartController {
	@Autowired  //ShopService 객체를 주입
	private ShopService service;
}
