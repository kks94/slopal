package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Receive;

public interface ReceiveMapper {

	@Select("select nvl((sum(incnt)),0) from receive where itemName=#{itemName} and itemQuality=#{itemQuality}")
	int getIncnt(Map<String, Object> param);

	@Select("select * from receive where itemName=#{itemName} and itemQuality=#{itemQuality} order by id desc")
	List<Receive> getReceiveListSameItem(Map<String, Object> param);

	@Select("select nvl(max(id),0) from receive")
	int maxId();

	@Select("select count(*) from receive where itemName=#{itemName} and itemQuality=#{itemQuality}")
	int itemcnt(Map<String, Object> param);

	@Insert("insert into receive (id,incnt,itemName,itemQuality,indate) values (#{id},#{incnt},#{itemName},#{itemQuality},sysdate)")
	void insert(Receive receive);

	@Select("select * from receive where id=#{id}")
	Receive getReceive(Integer id);

	@Update("update receive set incnt=#{incnt} where id=#{id}")
	void update(Receive receive);

	@Delete("delete from receive where id=#{id}")
	void delete(Integer id);
}
