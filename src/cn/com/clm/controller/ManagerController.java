package cn.com.clm.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import cn.com.clm.beans.Manager;
import cn.com.clm.beans.Message;
import cn.com.clm.beans.User;
import cn.com.clm.beans.UserPb;
import cn.com.clm.services.CarService;
import cn.com.clm.services.ManagerService;
import cn.com.clm.services.UserService;
import cn.com.clm.utils.HttpUtils;
import cn.com.clm.utils.dateUtil;


@Controller
@SessionAttributes("manager")
@Scope("prototype")
@RequestMapping("/manager")
public class ManagerController {
	@Autowired
	private CarService carService;
	@Autowired
	private ManagerService managerService;
	
	
	@RequestMapping(value="/managerLogin",method=RequestMethod.POST)
    public ModelAndView adminLogin(Manager manager,HttpServletRequest request,ModelMap model) throws Exception {
		System.out.println("login->manager:"+manager);
        Manager user1=managerService.checkLogin(manager.getM_name(), manager.getM_psw());
        String viewName="fail";
        ModelAndView modelAndView;
        if(user1!=null){
			viewName="managerIndex";
			String u_card = user1.getM_card();
			String page=request.getParameter("page");
	        if(page == null){
				page="1";
			}
	        modelAndView = new ModelAndView(viewName); 
	        
	        //查询汽车的类型和品牌遍历在option上
	        modelAndView.addObject("types", carService.queryType());
	        modelAndView.addObject("marks", carService.queryMark());
	        
			modelAndView.addObject("pageDate", carService.pageAll(Integer.parseInt(page)));
			modelAndView.addObject("user", managerService.getManagerCore(u_card));
	        
			return modelAndView;
        }
        modelAndView = new ModelAndView(viewName); 
        return modelAndView;
    }
	
	 	@RequestMapping(value="/getManager/{u_card}")
		public ModelAndView getUserInfo(@PathVariable("u_card") String u_card){
		 	String viewName = "managerCore1";
		 	ModelAndView modelAndView = new ModelAndView(viewName);
		 	modelAndView.addObject("user", managerService.getManagerCore(u_card));
			return modelAndView;
		}
	 
	 /*重置密码*/
	 @RequestMapping(value="/updateUserPs")
	 public ModelAndView updateUserPs(HttpServletRequest request){
		 String u_card  =request.getParameter("u_card");
		 String newPs  =request.getParameter("newPs");
		 managerService.updateUserPass(newPs,u_card);
		 ModelAndView modelAndView = new ModelAndView("managerCore1");
		 modelAndView.addObject("user", managerService.getManagerCore(u_card));
		 
		 return modelAndView;
	 }
	
}
