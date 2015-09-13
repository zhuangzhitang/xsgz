package cn.gdou.xsgz.domain;



public class ComboBoxConduct {
	private Integer id;   //id值用于远程提交
	private String text;  //显示文本
	public ComboBoxConduct(){}
	public ComboBoxConduct(Integer id, String text) {
		super();
		this.id = id;
		this.text = text;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	
	
}
