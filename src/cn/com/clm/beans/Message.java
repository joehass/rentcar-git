package cn.com.clm.beans;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class Message {
	private int m_id;
	private String u_card;
	private String m_info;
	private String m_date;
	private String m_return;
	private User user;
	
	
	public String getM_date() {
		return m_date;
	}
	public void setM_date(String m_date) {
		this.m_date = m_date;
	}
	public String getM_return() {
		return m_return;
	}
	public void setM_return(String m_return) {
		this.m_return = m_return;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getU_card() {
		return u_card;
	}
	public void setU_card(String u_card) {
		this.u_card = u_card;
	}
	public String getM_info() {
		return m_info;
	}
	public void setM_info(String m_info) {
		this.m_info = m_info;
	}
	
	@Override
	public String toString() {
		return "Message [m_id=" + m_id + ", u_card=" + u_card + ", m_info=" + m_info + ", m_date=" + m_date + "]";
	}
	public Message(int m_id, String u_card, String m_info, String m_date) {
		super();
		this.m_id = m_id;
		this.u_card = u_card;
		this.m_info = m_info;
		this.m_date = m_date;
	}
	
	public Message(String u_card, String m_info, String m_date) {
		super();
		this.u_card = u_card;
		this.m_info = m_info;
		this.m_date = m_date;
	}
	public Message() {
		// TODO Auto-generated constructor stub
	}

}
