package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.ReceiveMapper;
import logic.Receive;

@Repository //@Component + Model 기능
public class ReceiveDao {
	@Autowired //SqlSessionTemplate 객체 주입
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();
	private Class<ReceiveMapper> cls = ReceiveMapper.class;
	public int getIncnt(String name, String quality) {
		param.clear();
		param.put("itemName", name);
		param.put("itemQuality", quality);
		return template.getMapper(cls).getIncnt(param);
	}
	public List<Receive> getReceiveListSameItem(String itemName, String itemQuality) {
		param.clear();
		param.put("itemName", itemName);
		param.put("itemQuality", itemQuality);
		return template.getMapper(cls).getReceiveListSameItem(param);
	}
	public int maxId() {
		return template.getMapper(cls).maxId();
	}

	public int itemcnt(String itemName, String itemQuality) {
		param.clear();
		param.put("itemName", itemName);
		param.put("itemQuality", itemQuality);
		return template.getMapper(cls).itemcnt(param);
	}
	public void insert(Receive receive) {
		template.getMapper(cls).insert(receive);
	}
	public Receive getReceive(Integer id) {
		return template.getMapper(cls).getReceive(id);
	}
	public void update(Receive receive) {
		template.getMapper(cls).update(receive);
	}
	public void delete(Integer id) {
		template.getMapper(cls).delete(id);
	}
	
}
