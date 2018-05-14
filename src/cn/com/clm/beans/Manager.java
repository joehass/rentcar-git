package cn.com.clm.beans;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

//管理员
@Component
public class Manager {
	private int id;
	private String m_name;
	private String m_psw;
	private String m_sex;
	private int m_age;
	private String m_card;
	private String m_address;
	private String m_phone;
	private String m_img;
	private String m_date;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_psw() {
		return m_psw;
	}
	public void setM_psw(String m_psw) {
		this.m_psw = m_psw;
	}
	public String getM_sex() {
		return m_sex;
	}
	public void setM_sex(String m_sex) {
		this.m_sex = m_sex;
	}
	public int getM_age() {
		return m_age;
	}
	public void setM_age(int m_age) {
		this.m_age = m_age;
	}
	public String getM_card() {
		return m_card;
	}
	public void setM_card(String m_card) {
		this.m_card = m_card;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_img() {
		return m_img;
	}
	public void setM_img(String m_img) {
		this.m_img = m_img;
	}
	public String getM_date() {
		return m_date;
	}
	public void setM_date(String m_date) {
		this.m_date = m_date;
	}
	
	
	
	

}
