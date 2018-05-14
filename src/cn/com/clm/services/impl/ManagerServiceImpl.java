package cn.com.clm.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.clm.beans.Manager;
import cn.com.clm.beans.Message;
import cn.com.clm.beans.User;
import cn.com.clm.beans.UserPb;
import cn.com.clm.beans.UserRecode;
import cn.com.clm.daos.ManagerMapper;
import cn.com.clm.daos.UserMapper;
import cn.com.clm.services.ManagerService;


@Service
public class ManagerServiceImpl implements ManagerService{
	
	@Autowired
	private ManagerMapper mangerMapper;
	
	
	 @Override
	public void updateUserPass(String newPs, String u_card) {
		 mangerMapper.updateUserPass(newPs, u_card);
		
	}
	/* 登陆验证 */
    public Manager checkLogin(String username, String password) {
        //根据用户名实例化用户对象
    	System.out.println("username:"+username);
        Manager manager = mangerMapper.getManagerByName(username);
        if (manager != null && manager.getM_psw().equals(password)) {
            return manager;
        }
        return null;
    }
	@Override
	public Manager getManagerCore(String u_card) {
		Manager user = mangerMapper.getManagerCore(u_card);
		return user;
	}
//	@Override
//	public List<UserRecode> getUserRecode(String u_card) {
//		List<UserRecode> userRecode = mangerMapper.getUserRecode(u_card);
//		return userRecode;
//	}
//	@Override
//	public void sendNote(Message message) {
//		mangerMapper.sendNote(message);
//	}
//	@Override
//	public void addPb( String u_card) {
//		mangerMapper.addPb( u_card);
//	}
//	@Override
//	public int registerUser(User user) {
//		return mangerMapper.registerUser(user);
//	}
//	@Override
//	public int registerUserPb(UserPb userPb) {
//		return mangerMapper.registerUserPb(userPb);
//	}
//	@Override
//	public void updateUserPass(String newPs, String u_card) {
//		mangerMapper.updateUserPass(newPs,u_card);
//	}
//	@Override
//	public void updateUserMoney(int addMon, String u_card) {
//		mangerMapper.updateUserMoney(addMon,u_card);
//	}
//	@Override
//	public void addMoneyRecode(String u_card, int addMon, String r_date) {
//		mangerMapper.addMoneyRecode(u_card,addMon ,r_date);
//	}
//	@Override
//	public void updateUserPb(int p_pd, String u_card) {
//		mangerMapper.updateUserPb(p_pd ,u_card);
//	}

}
