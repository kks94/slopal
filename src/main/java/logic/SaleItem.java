package logic;

public class SaleItem {
	private int saleid;
	private int seq;
	private String itemName;
	private String itemQuality;
	private int quantity;
	private Item item; //DB와 관련없는 애
	public SaleItem() {}
	public SaleItem(int saleid, int seq, ItemSet itemSet) {
		this.saleid = saleid;
		this.seq = seq;
		this.item = itemSet.getItem();
		this.itemName = itemSet.getItem().getName();
		this.itemQuality = itemSet.getItem().getQuality();
		this.quantity = itemSet.getQuantity();
	}
	//getter,setter,. toString
	public int getSaleid() {
		return saleid;
	}
	public void setSaleid(int saleid) {
		this.saleid = saleid;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
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
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	@Override
	public String toString() {
		return "SaleItem [saleid=" + saleid + ", seq=" + seq + ", itemName=" + itemName + ", itemQuality=" + itemQuality
				+ ", quantity=" + quantity + ", item=" + item + "]";
	}
	
}
