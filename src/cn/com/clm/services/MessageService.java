package cn.com.clm.services;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import cn.com.clm.beans.Biaozhi;
import cn.com.clm.beans.Car;
import cn.com.clm.beans.Message;
import cn.com.clm.beans.Page;
import cn.com.clm.beans.Type;

@Repository
public interface MessageService {
	
	public List<Map>selectUserMessageCount();
	
	public List<Map>selectUserMessage(String card);

}
