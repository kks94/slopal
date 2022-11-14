package logic;

import java.util.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

public class Receive {
	private int id;   //입고id
	@Min(value=1, message="최소 1개이상 가능합니다.") //최소값
	@Max(value=99999, message="99999개 이하만 가능합니다.") //최대값
	private int incnt;  //입고수량
	private Date indate; //입고날짜
	private String itemName;  //상품이름
	private String itemQuality;  //상품품질
	
	//setter,getter, toString
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIncnt() {
		return incnt;
	}
	public void setIncnt(int incnt) {
		this.incnt = incnt;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemQuality() {
		return itemQuality;
	}
	public void setItemQuality(String itemQuality) {
		this.itemQuality = itemQuality;
	}
	@Override
	public String toString() {
		return "Receive [id=" + id + ", incnt=" + incnt + ", indate=" + indate + ", itemName=" + itemName
				+ ", itemQuality=" + itemQuality + "]";
	}

	

}
