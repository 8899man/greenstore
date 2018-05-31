package com.oracle.greenstore.modle.been;

public class Wine {
	
	private int wine_id;
	private String wine_name;
	private String kind;
	private float price;
	private String detail;
	private String image;
	private int tuiguang;
	private String tuiguangtu;
	
	
	public int getTuiguang() {
		return tuiguang;
	}
	public void setTuiguang(int tuiguang) {
		this.tuiguang = tuiguang;
	}
	public String getTuiguangtu() {
		return tuiguangtu;
	}
	public void setTuiguangtu(String tuiguangtu) {
		this.tuiguangtu = tuiguangtu;
	}
	public int getWine_id() {
		return wine_id;
	}
	public void setWine_id(int wine_id) {
		this.wine_id = wine_id;
	}
	public String getWine_name() {
		return wine_name;
	}
	public void setWine_name(String wine_name) {
		this.wine_name = wine_name;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	public Wine(int wine_id, String wine_name, String kind, float price, String detail, String image, int tuiguang,
			String tuiguangtu) {
		super();
		this.wine_id = wine_id;
		this.wine_name = wine_name;
		this.kind = kind;
		this.price = price;
		this.detail = detail;
		this.image = image;
		this.tuiguang = tuiguang;
		this.tuiguangtu = tuiguangtu;
	}
	public Wine() {
		super();
	}
	@Override
	public String toString() {
		return "Wine [wine_id=" + wine_id + ", wine_name=" + wine_name + ", kind=" + kind + ", price=" + price
				+ ", detail=" + detail + ", image=" + image + "]";
	}
	
	
}
