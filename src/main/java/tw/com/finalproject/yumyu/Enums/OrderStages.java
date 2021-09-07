package tw.com.finalproject.yumyu.Enums;

public enum OrderStages {
	PREPARED("準備中"),SHIPPING("已出貨"), COMPLETED("完成");
	
	private String value;
	
	private OrderStages(String value) {
		this.value = value;
	}
	
	public String value() {
		return value;
	}
	
}
