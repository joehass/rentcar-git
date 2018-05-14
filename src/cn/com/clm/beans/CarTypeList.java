package cn.com.clm.beans;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class CarTypeList {
	public List<Car> car;
	public List<Type> type;
	public List<Biaozhi> biaozhi;
	public List<Car> getCar() {
		return car;
	}
	public void setCar(List<Car> car) {
		this.car = car;
	}
	public List<Type> getType() {
		return type;
	}
	public void setType(List<Type> type) {
		this.type = type;
	}
	public List<Biaozhi> getBiaozhi() {
		return biaozhi;
	}
	public void setBiaozhi(List<Biaozhi> biaozhi) {
		this.biaozhi = biaozhi;
	}
	
	

}
