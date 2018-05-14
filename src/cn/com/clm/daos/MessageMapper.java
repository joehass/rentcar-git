package cn.com.clm.daos;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import cn.com.clm.beans.Message;


public interface MessageMapper {
	
	@Select("SELECT u.u_name,u.u_card,count(*) as count from message me,user u where me.u_card = u.u_card group by me.u_card order by me.m_date desc")
	public List<Map>selectUserMessageCount();
	
	@Select("select m_info,m_date,m_return from message where u_card=#{0}")
	public List<Map>selectUserMessage(String card);

}
