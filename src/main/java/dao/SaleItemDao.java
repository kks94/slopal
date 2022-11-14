package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.SaleItemMapper;

@Repository //@Component + Model 기능
public class SaleItemDao {
	@Autowired //SqlSessionTemplate 객체 주입
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();
	private Class<SaleItemMapper> cls = SaleItemMapper.class;
	
	public int getSalequantity(String name, String quality) {
		param.clear();
		param.put("itemName", name);
		param.put("itemQuality", quality);
		return template.getMapper(cls).getSalequantity(param);
	}
}
