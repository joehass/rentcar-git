package cn.com.clm.beans;

import org.springframework.stereotype.Component;

@Component
public class CarState {
	
	private int id;
	private String state;
	private String stateName;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getStateName() {
		return stateName;
	}
	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	
	

}
