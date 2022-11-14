package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Wish;

public interface WishMapper {

	@Insert("insert into wish "
     + " (id,userid,itemname,itemquality)"
+ " values (#{id}, #{userid},#{itemName},#{itemQuality})")
	
	void insert(Wish wish);

	@Select("select * from wish where id=#{id}")
	Wish selectOne(Map<String, Object> param);


	@Delete("delete from wish where id=#{id}")
	void delete(Map<String, Object> param);

}

