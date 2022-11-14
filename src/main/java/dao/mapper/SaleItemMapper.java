package dao.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Select;

public interface SaleItemMapper {

	@Select("select nvl((sum(quantity)),0) from saleitem where itemName=#{itemName} and itemQuality=#{itemQuality}")
	int getSalequantity(Map<String, Object> param);

}
