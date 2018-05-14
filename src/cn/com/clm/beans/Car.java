package cn.com.clm.beans;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class Car {
	private Integer c_id;//汽车ID
	private Integer t_id;//类型ID
	private Integer b_id;//标志ID
	private String b_code;//车牌号
	private String b_kuanshi;//配置款式
	private String b_buydate;//购车年份
	private Integer b_zuowei;//座位数
	private Integer b_chemen;//车门数
	private String b_ranliao;//燃料类型
	private String b_biansu;//变速箱类型
	private String b_zuoyi;//座椅材质
	private String b_isdao;//有无导航
	private String b_iswindow;//有无天窗
	private String b_introduce;//简介
	private double b_price;//日租价
	private String state;//当前状态     （Y：可租用，N：已租出，Z：已预约，L：已下架，X：修理中）
	private int cost;//汽车成本价
	
	private Type type;
	private Biaozhi biaozhi; 
	private CarImage carImage;
	private Order order;
	private CarState carState;
	
	public CarState getCarState() {
		return carState;
	}
	public void setCarState(CarState carState) {
		this.carState = carState;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Integer getC_id() {
		return c_id;
	}
	public void setC_id(Integer c_id) {
		this.c_id = c_id;
	}
	public Integer getT_id() {
		return t_id;
	}
	public void setT_id(Integer t_id) {
		this.t_id = t_id;
	}
	public Integer getB_id() {
		return b_id;
	}
	public void setB_id(Integer b_id) {
		this.b_id = b_id;
	}
	public String getB_code() {
		return b_code;
	}
	public void setB_code(String b_code) {
		this.b_code = b_code;
	}
	public String getB_kuanshi() {
		return b_kuanshi;
	}
	public void setB_kuanshi(String b_kuanshi) {
		this.b_kuanshi = b_kuanshi;
	}
	
	public String getB_buydate() {
		return b_buydate;
	}
	public void setB_buydate(String b_buydate) {
		this.b_buydate = b_buydate;
	}
	public Integer getB_zuowei() {
		return b_zuowei;
	}
	public void setB_zuowei(Integer b_zuowei) {
		this.b_zuowei = b_zuowei;
	}
	public Integer getB_chemen() {
		return b_chemen;
	}
	public void setB_chemen(Integer b_chemen) {
		this.b_chemen = b_chemen;
	}
	public String getB_ranliao() {
		return b_ranliao;
	}
	public void setB_ranliao(String b_ranliao) {
		this.b_ranliao = b_ranliao;
	}
	public String getB_biansu() {
		return b_biansu;
	}
	public void setB_biansu(String b_biansu) {
		this.b_biansu = b_biansu;
	}
	public String getB_zuoyi() {
		return b_zuoyi;
	}
	public void setB_zuoyi(String b_zuoyi) {
		this.b_zuoyi = b_zuoyi;
	}
	public String getB_isdao() {
		return b_isdao;
	}
	public void setB_isdao(String b_isdao) {
		this.b_isdao = b_isdao;
	}
	public String getB_iswindow() {
		return b_iswindow;
	}
	public void setB_iswindow(String b_iswindow) {
		this.b_iswindow = b_iswindow;
	}
	public String getB_introduce() {
		return b_introduce;
	}
	public void setB_introduce(String b_introduce) {
		this.b_introduce = b_introduce;
	}
	public double getB_price() {
		return b_price;
	}
	public void setB_price(double b_price) {
		this.b_price = b_price;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public Biaozhi getBiaozhi() {
		return biaozhi;
	}
	public void setBiaozhi(Biaozhi biaozhi) {
		this.biaozhi = biaozhi;
	}
	public CarImage getCarImage() {
		return carImage;
	}
	public void setCarImage(CarImage carImage) {
		this.carImage = carImage;
	}
	@Override
	public String toString() {
		return "Car [c_id=" + c_id + ", t_id=" + t_id + ", b_id=" + b_id + ", b_code=" + b_code + ", b_kuanshi="
				+ b_kuanshi + ", b_buydate=" + b_buydate + ", b_zuowei=" + b_zuowei + ", b_chemen=" + b_chemen
				+ ", b_ranliao=" + b_ranliao + ", b_biansu=" + b_biansu + ", b_zuoyi=" + b_zuoyi + ", b_isdao="
				+ b_isdao + ", b_iswindow=" + b_iswindow + ", b_introduce=" + b_introduce + ", b_price=" + b_price
				+ ", state=" + state + ", type=" + type + ", biaozhi=" + biaozhi + ", carImage=" + carImage + "]";
	}
	public Car(Integer c_id, Integer t_id, Integer b_id, String b_code, String b_kuanshi, String b_buydate,
			Integer b_zuowei, Integer b_chemen, String b_ranliao, String b_biansu, String b_zuoyi, String b_isdao,
			String b_iswindow, String b_introduce, double b_price, String state, Type type, Biaozhi biaozhi,
			CarImage carImage) {
		super();
		this.c_id = c_id;
		this.t_id = t_id;
		this.b_id = b_id;
		this.b_code = b_code;
		this.b_kuanshi = b_kuanshi;
		this.b_buydate = b_buydate;
		this.b_zuowei = b_zuowei;
		this.b_chemen = b_chemen;
		this.b_ranliao = b_ranliao;
		this.b_biansu = b_biansu;
		this.b_zuoyi = b_zuoyi;
		this.b_isdao = b_isdao;
		this.b_iswindow = b_iswindow;
		this.b_introduce = b_introduce;
		this.b_price = b_price;
		this.state = state;
		this.type = type;
		this.biaozhi = biaozhi;
		this.carImage = carImage;
	}
	public Car() {
		// TODO Auto-generated constructor stub
	}
	
	
	

}
