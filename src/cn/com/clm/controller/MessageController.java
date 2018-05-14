package cn.com.clm.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import cn.com.clm.beans.Manager;
import cn.com.clm.beans.Message;
import cn.com.clm.beans.Order;
import cn.com.clm.beans.OrderInfo;
import cn.com.clm.beans.User;
import cn.com.clm.services.ManagerService;
import cn.com.clm.services.MessageService;
import cn.com.clm.services.OrderService;
import cn.com.clm.services.UserService;
import cn.com.clm.utils.ExportExcelUtil;
import cn.com.clm.utils.ToWordUtil;

@Controller
@SessionAttributes("user")
@Scope("prototype")
@RequestMapping("/message")
public class MessageController {
	@Autowired
	private UserService userService;
	@Autowired
	private ManagerService managerService;
	@Autowired
	private MessageService messageService;
	
	
	@RequestMapping(value="/queryUserMessageCount")  
	public ModelAndView queryUserMessageCount(HttpServletRequest request) throws Exception { 
		
		String mcard = request.getParameter("m_card");
		String ucard = request.getParameter("u_card");
		Manager manager = managerService.getManagerCore(mcard);
		List<Map> map = messageService.selectUserMessageCount();
		String viewName="userMessageList";
		List<Map> list1 = messageService.selectUserMessage(ucard);
		
		ModelAndView modelAndView = new ModelAndView(viewName);
		
		modelAndView.addObject("user",manager);
		modelAndView.addObject("messageCount",map);
		modelAndView.addObject("message1",list1);
		return modelAndView;
	}  
	
	@RequestMapping(value="/queryUserMessage", method=RequestMethod.POST)  
	public ModelAndView queryUserMessage(HttpServletRequest request) throws Exception {
		String card = request.getParameter("u_card");
		String viewName="userMessageList";
		List<Map> list = messageService.selectUserMessage(card);
		
		ModelAndView modelAndView = new ModelAndView(viewName);
		return modelAndView;
	}

}
