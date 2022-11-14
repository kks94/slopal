package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Item;

public interface ItemMapper {

	@Select("select nvl(max(id),0) from item")
	int maxId();

	@Insert("insert into item (id,name,price,pictureUrl,description,tag,grp,quality)"
			+" values (#{id},#{name},#{price},#{pictureUrl},#{description},#{tag},#{grp},#{quality})")
	void insert(Item item);
	
	@Select("select * from item where id=#{id}")
	Item getItem(Map<String, Object> param);

	@Update("update item set name=#{name}, price=#{price}, description=#{description}, pictureUrl=#{pictureUrl}, tag=#{tag},"
			+ "quality=#{quality} where id=#{id}")
	void update(Item item);

	@Delete("delete from item where id=#{id}")
	void delete(Map<String, Object> param);

	@Select("select * from item where name=#{name}")
	List<Item> sameNamelist(Map<String, Object> param);

	@Select("select nvl(max(grp),0) from item")
	int maxGrp();

	@Select("select * from item where name=#{name} and quality=#{quality}")
	Item getItemNQ(Map<String, Object> param);
	
	@Select({ "<script>",
		"select * from item ",
		"<trim prefix='where' prefixOverrides='AND||OR'>",
		"<if test='tag != null'> and tag=#{tag}</if>",
		"<if test='find != null'> and name like '%${find}%' </if>",
		"</trim>",
		" order by grp asc, to_number(quality) asc",
		"</script>"	})
	List<Item> select(Map<String, Object> param);
}	

