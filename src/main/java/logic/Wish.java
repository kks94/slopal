package logic;

public class Wish {
	private int id;
	private String userid;
	private String itemName;
	private String itemQuality;
	//getter,setter, toString
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
		return "Wish [id=" + id + ", userid=" + userid + ", itemName=" + itemName + ", itemQuality=" + itemQuality
				+ "]";
	}
	
}
