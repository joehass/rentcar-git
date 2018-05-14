package cn.com.clm.utils;

import java.util.Date;
import java.util.Random;
import java.util.UUID;

public class  RandomUtils{
	public  static String genRandomNum(){
		StringBuffer pwd = new StringBuffer("");
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		pwd.append(uuid);
		
		return pwd.toString();
	}	

}
