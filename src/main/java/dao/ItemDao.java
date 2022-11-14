package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.ItemMapper;
import logic.Item;
/*
 *  @Component : 해당 클래스를 객체화
 *   model 기능 : db와 연결된 클래스
 */
@Repository //@Component + Model 기능
public class ItemDao {
	@Autowired //SqlSessionTemplate 객체 주입
	private SqlSessionTemplate template;
	private Map<String,Object> param = new HashMap<>();
	
	//item 테이블의 id값 중 최대값 리턴
	public int maxId() {
		return template.getMapper(ItemMapper.class).maxId();
	}

	public void insert(Item item) {
		template.getMapper(ItemMapper.class).insert(item);		
	}

	public Item getItem(Integer id) {
		param.clear();
		param.put("id", id);
		return template.getMapper(ItemMapper.class).getItem(param);
	}

	public void update(Item item) {
		template.getMapper(ItemMapper.class).update(item);
	}

	public void delete(Integer id) {
		param.clear();
		param.put("id", id);
		template.getMapper(ItemMapper.class).delete(param);
	}

	public List<Item> sameNamelist(String name) {
		param.clear();
		param.put("name", name);
		return template.getMapper(ItemMapper.class).sameNamelist(param);
	}

	public int maxGrp() {
		return template.getMapper(ItemMapper.class).maxGrp();
	}

	public Item getItemNQ(String itemName, String itemQuality) {
		param.clear();
		param.put("name", itemName);
		param.put("quality", itemQuality);
		return template.getMapper(ItemMapper.class).getItemNQ(param);
	}	
	
	public List<Item> list(String tag, String find) {
		param.clear();
		param.put("tag",tag);
		param.put("find",find);
		return template.getMapper(ItemMapper.class).select(param);
	}
	
}
