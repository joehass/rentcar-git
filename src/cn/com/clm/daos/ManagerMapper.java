package cn.com.clm.daos;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.com.clm.beans.Manager;
import cn.com.clm.beans.Message;
import cn.com.clm.beans.User;
import cn.com.clm.beans.UserPb;
import cn.com.clm.beans.UserRecode;

public interface ManagerMapper {
	public Manager getManagerByName(String username);//登录
	
	public Manager getManagerCore(String u_card);//获得用户详情
	
	@Update("UPDATE manager SET m_psw=#{0} WHERE m_card=#{1}")
	public void updateUserPass(String newPs, String u_card);

}
