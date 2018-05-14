package cn.com.clm.services;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.com.clm.beans.Manager;
import cn.com.clm.beans.Message;
import cn.com.clm.beans.User;
import cn.com.clm.beans.UserPb;
import cn.com.clm.beans.UserRecode;

@Repository
public interface ManagerService {
	
	// 通过用户名及密码核查用户登录
    public Manager checkLogin(String username, String password);
    
    public Manager getManagerCore(String m_card);
    
    public void updateUserPass(String newPs, String u_card);


}
