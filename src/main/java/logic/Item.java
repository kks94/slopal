package logic;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

public class Item {
	private int id;
	//값이 입력이 안된 경우 검증
	@NotEmpty(message="제품명을 입력하세요")
	private String name;
	@Min(value=10, message="10원이상 가능합니다.") //최소값
	@Max(value=9999999, message="9,999,999원이하만 가능합니다.") //최대값
	private int price;
	@NotEmpty(message="제품설명을 입력하세요")
	private String description; //item_information 였음
	@NotEmpty(message="제품 분류를 선택하세요")
	private String tag;
	@NotEmpty(message="제품 품질을 선택하세요")
	private String quality;
	private int grp;
	private String pictureUrl; //file_id였음
	
	//name=picture 태그가 선택한 파일의 내용 저장
	//<input type="file" name="picture">
	private MultipartFile picture; //file였음
	//getter,setter, toString

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getQuality() {
		return quality;
	}

	public void setQuality(String quality) {
		this.quality = quality;
	}

	public int getGrp() {
		return grp;
	}

	public void setGrp(int grp) {
		this.grp = grp;
	}

	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}

	public MultipartFile getPicture() {
		return picture;
	}

	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}

	@Override
	public String toString() {
		return "Item [id=" + id + ", name=" + name + ", price=" + price + ", description=" + description + ", tag="
				+ tag + ", quality=" + quality + ", grp=" + grp + ", pictureUrl=" + pictureUrl + ", picture=" + picture
				+ "]";
	}
	
	
	
}
