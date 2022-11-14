package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.WishMapper;
import logic.Wish;

@Repository
public class WishDao {
	@Autowired
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();
	public void insert(Wish Wish) {
	    template.getMapper(WishMapper.class).insert(Wish);	
	}

	

	public void delete(String id) {
		param.clear();
		param.put("id", id);
		template.getMapper(WishMapper.class).delete(param);
	}
}