package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.SaleItemMapper;
import dao.mapper.SaleMapper;

/*
 *  @Component : 해당 클래스를 객체화
 *   model 기능 : db와 연결된 클래스
 */
@Repository //@Component + Model 기능
public class SaleDao {
	@Autowired //SqlSessionTemplate 객체 주입
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();
	private Class<SaleMapper> cls = SaleMapper.class;
}
