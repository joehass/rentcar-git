package cn.com.clm.services.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.clm.beans.Manager;
import cn.com.clm.beans.Message;
import cn.com.clm.beans.User;
import cn.com.clm.beans.UserPb;
import cn.com.clm.beans.UserRecode;
import cn.com.clm.daos.ManagerMapper;
import cn.com.clm.daos.MessageMapper;
import cn.com.clm.daos.UserMapper;
import cn.com.clm.services.ManagerService;
import cn.com.clm.services.MessageService;


@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private MessageMapper messageMapper;

	@Override
	public List<Map> selectUserMessageCount() {
		return messageMapper.selectUserMessageCount();
	}

	@Override
	public List<Map> selectUserMessage(String card) {
		return messageMapper.selectUserMessage(card);
	}
	
	
	
}
