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
import cn.com.clm.beans.Order;
import cn.com.clm.beans.OrderInfo;
import cn.com.clm.beans.User;
import cn.com.clm.beans.UserPb;
import cn.com.clm.services.CarService;
import cn.com.clm.services.ManagerService;
import cn.com.clm.services.OrderService;
import cn.com.clm.services.ProvinceService;
import cn.com.clm.services.UserService;
import cn.com.clm.utils.ExportExcelUtil;
import cn.com.clm.utils.Result;
import cn.com.clm.utils.ToWordUtil;

@Controller
@SessionAttributes("user")
@Scope("prototype")
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private UserService userService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ManagerService managerService;
	@Autowired
	private CarService carService;
	@Autowired
	private ProvinceService provinceServince;
	
	
	/*依据o_code将订单状态修改为已支付*/
	@ResponseBody  
	@RequestMapping(value="/orderResult", method=RequestMethod.POST)  
	public void updateOrderResult(HttpServletRequest request) throws Exception { 
		String o_code = request.getParameter("o_code");
		orderService.setOrderState("已支付", o_code);
	}  

	
	/*跳转到支付页面*/
	@ResponseBody  
	@RequestMapping(value="/pay", method=RequestMethod.GET)  
	public ModelAndView PayOrder(HttpServletRequest request) throws Exception { 
		String viewName="payOrder";
		ModelAndView modelAndView = new ModelAndView(viewName);
		
		String o_code = request.getParameter("o_code");
		String u_card = request.getParameter("u_card");
		OrderInfo orderInfo = orderService.getOrderInfo(o_code);
		UserPb userPb = userService.getUserPb(u_card);
	    
	    modelAndView.addObject("user", userService.getUserCore(u_card));
	    modelAndView.addObject("orderInfo", orderInfo);
	    modelAndView.addObject("userPb", userPb);

		return modelAndView;
	}  
	
	/*支付*/
	@RequestMapping(value="/PayOrderByYuE", method=RequestMethod.POST)  
	@ResponseBody
	public Result PayOrderByYuE(HttpServletRequest request) throws Exception { 
		String u_card = request.getParameter("u_card");
		String o_code = request.getParameter("orderId");
		String amount = request.getParameter("amount");
		String p_money = request.getParameter("p_money");
		ModelAndView modelAndView = new ModelAndView();
		String viewName = null;
		Result result = new Result();
		Double money = Double.parseDouble(p_money)-Double.parseDouble(amount);
		List<Order> orders = orderService.getOwnOrders(o_code,u_card);
		if(money > 0){
			viewName="orderList";
			String status = "已支付";
			orderService.setOrderState(status,o_code);
			userService.updateUserMoneyPay((new Double(money)).intValue(), u_card);
			modelAndView.setViewName(viewName);
			
			modelAndView.addObject("user", userService.getUserCore(u_card));
			modelAndView.addObject("orders", orders);
			result.setStatus("success");
			/*订单统计*/
			modelAndView.addObject("PayOrders", orderService.getPayOrder(u_card));
			modelAndView.addObject("NoPayOrders", orderService.getNoPayOrder(u_card));
			modelAndView.addObject("NoBXOrders", orderService.getNoBXOrder(u_card));
			modelAndView.addObject("BXOrders", orderService.getBXOrder(u_card));
		}
		else {
			modelAndView.addObject("user", userService.getUserCore(u_card));
			modelAndView.addObject("orders", orders);
			result.setStatus("fail");
		}
		return result;
	}
	
	
	
	/*依据o_code 取消订单（已取消）,并设置汽车状态（Y：可租用）*/
	@ResponseBody  
	@RequestMapping(value="/qxOrder", method=RequestMethod.GET)  
	public ModelAndView qxOrder(HttpServletRequest request) throws Exception { 
		String o_code = request.getParameter("o_code");
		String u_card = request.getParameter("u_card");
		
		orderService.setOrderState("已取消",o_code);
		
		String viewName="orderList";
	    ModelAndView modelAndView = new ModelAndView(viewName);
	    
	    List<Order> orders = orderService.getOrders(u_card);
	    modelAndView.addObject("user", userService.getUserCore(u_card));
	    modelAndView.addObject("orders", orders);
	    
	    /*订单统计*/
		modelAndView.addObject("PayOrders", orderService.getPayOrder(u_card));
		modelAndView.addObject("NoPayOrders", orderService.getNoPayOrder(u_card));
		modelAndView.addObject("NoBXOrders", orderService.getNoBXOrder(u_card));
		modelAndView.addObject("BXOrders", orderService.getBXOrder(u_card));
		 
		return modelAndView;
	}  
	
	/*依据订单号查询订单*/
	@ResponseBody  
	@RequestMapping(value="/cxOrder", method=RequestMethod.GET)  
	public ModelAndView cxOrder(HttpServletRequest request) throws Exception { 
		String o_code = request.getParameter("o_code");
		String u_card = request.getParameter("u_card");
		
		String viewName="orderList";
		ModelAndView modelAndView = new ModelAndView(viewName);
		
		List<Order> orders = orderService.getOwnOrders(o_code,u_card);
		modelAndView.addObject("user", userService.getUserCore(u_card));
		modelAndView.addObject("orders", orders);
		
		/*订单统计*/
		modelAndView.addObject("PayOrders", orderService.getPayOrder(u_card));
		modelAndView.addObject("NoPayOrders", orderService.getNoPayOrder(u_card));
		modelAndView.addObject("NoBXOrders", orderService.getNoBXOrder(u_card));
		modelAndView.addObject("BXOrders", orderService.getBXOrder(u_card));
		
		return modelAndView;
	}  
	
	/*依据订单状态查询订单*/
	@ResponseBody  
	@RequestMapping(value="/grtOrderByTj", method=RequestMethod.GET)  
	public ModelAndView grtOrderByTj(HttpServletRequest request) throws Exception { 
		String o_state = request.getParameter("o_state");
		String u_card = request.getParameter("u_card");
		
		String viewName="orderList";
		ModelAndView modelAndView = new ModelAndView(viewName);
		
		List<Order> orders = orderService.getOrdersByTj(o_state,u_card);
		modelAndView.addObject("user", userService.getUserCore(u_card));
		modelAndView.addObject("orders", orders);
		
		/*订单统计*/
		modelAndView.addObject("PayOrders", orderService.getPayOrder(u_card));
		modelAndView.addObject("NoPayOrders", orderService.getNoPayOrder(u_card));
		modelAndView.addObject("NoBXOrders", orderService.getNoBXOrder(u_card));
		modelAndView.addObject("BXOrders", orderService.getBXOrder(u_card));
		
		return modelAndView;
	}  
	
	/*依据o_code查询订单详情*/
	@ResponseBody  
	@RequestMapping(value="/orderInfo", method=RequestMethod.POST)  
	public OrderInfo getOrderInfo(HttpServletRequest request) throws Exception { 
		String o_code = request.getParameter("o_code");
		OrderInfo oi = orderService.getOrderInfo(o_code);
		System.out.println("OrderController->oi:"+oi);
		return oi;
	}  
	
	/*依据o_code打印合同*/
	@ResponseBody  
	@RequestMapping(value="/dyOrderInfo", method=RequestMethod.POST)  
	public String dyOrderInfo(HttpServletRequest request) throws Exception { 
		String o_code = request.getParameter("o_code");
		OrderInfo o = orderService.getOrderInfo(o_code);
		
		Map<String,String> map=new HashedMap<String, String>();
		map.put("o_code",o.getO_code() );
		map.put("u_card",o.getU_card() );
		map.put("u_jscard",o.getU_jscard() );
		map.put("b_code",o.getB_code() );
		map.put("start_date",o.getStart_date() );
		map.put("end_date",o.getEnd_date() );
		map.put("days",o.getDays()+"" );
		map.put("b_price",o.getB_price()+"" );
		map.put("allMoney",(o.getAllMoney()+800)+"" );
		map.put("o_bx",o.getO_bx() );
		map.put("d_pname",o.getDiqu().getD_pname() );
		map.put("date",new Date().toLocaleString());
		System.out.println("map:"+map);
		
		
		ToWordUtil.readwriteWord("D:\\hetong\\fxtxzcht.doc", map);
		boolean result = ExportExcelUtil.exportExcel(o);
		if(result){
			return "1";
		}else{
			return "0";
		}
	}  
	
	@ResponseBody
	@RequestMapping(value="/makeOrderList",method=RequestMethod.GET)
    public ModelAndView makeOrderList(HttpServletRequest request) throws Exception {
		String viewName="orderList";
		/*生成订单并依据u_card查询所有的订单*/
		String u_card = request.getParameter("u_card");
		String orderList = request.getParameter("orderList");
		/*添加订单*/
		orderService.makeOrder(orderList, u_card);
		/*获取所有的订单*/
		List<Order> orders = orderService.getOrders(u_card);
		System.out.println("orders:"+orders);
		
        ModelAndView modelAndView = new ModelAndView(viewName);
        modelAndView.addObject("user", userService.getUserCore(u_card));
        modelAndView.addObject("orders", orders);
        
        /*订单统计*/
		modelAndView.addObject("PayOrders", orderService.getPayOrder(u_card));
		modelAndView.addObject("NoPayOrders", orderService.getNoPayOrder(u_card));
		modelAndView.addObject("NoBXOrders", orderService.getNoBXOrder(u_card));
		modelAndView.addObject("BXOrders", orderService.getBXOrder(u_card));
        
        return modelAndView;
	}
	
	
	/*获取所有的管理员车辆及订单*/
	@ResponseBody
	@RequestMapping(value="/getManageOrders",method=RequestMethod.GET)
	public ModelAndView getManagerOrders(HttpServletRequest request,@ModelAttribute("user") Manager user) throws Exception {
		String viewName="managerCarInfo";
		String u_card = user.getM_card();
		List<Order> orders = orderService.getAllOrder();
		System.out.println("orders:"+orders);
		
		ModelAndView modelAndView = new ModelAndView(viewName);
		modelAndView.addObject("manager", managerService.getManagerCore(u_card));
		//modelAndView.addObject("user", userService.getUserOrderCore(orde));
		modelAndView.addObject("orders", orders);
		
		/*订单统计*/
		modelAndView.addObject("PayOrders", orderService.getPayOrder(null));
		modelAndView.addObject("NoPayOrders", orderService.getNoPayOrder(null));
		modelAndView.addObject("NoBXOrders", orderService.getNoBXOrder(null));
		modelAndView.addObject("BXOrders", orderService.getBXOrder(null));
		
		return modelAndView;
	}
	
	/*获取所有的订单*/
	@ResponseBody
	@RequestMapping(value="/getOrders",method=RequestMethod.GET)
	public ModelAndView getOrders(HttpServletRequest request,@ModelAttribute("user") User user) throws Exception {
		String viewName="orderList";
		String u_card = user.getU_card();
		List<Order> orders = orderService.getOrders(u_card);
		System.out.println("orders:"+orders);
		
		ModelAndView modelAndView = new ModelAndView(viewName);
		modelAndView.addObject("user", userService.getUserCore(u_card));
		modelAndView.addObject("orders", orders);
		
		/*订单统计*/
		modelAndView.addObject("PayOrders", orderService.getPayOrder(u_card));
		modelAndView.addObject("NoPayOrders", orderService.getNoPayOrder(u_card));
		modelAndView.addObject("NoBXOrders", orderService.getNoBXOrder(u_card));
		modelAndView.addObject("BXOrders", orderService.getBXOrder(u_card));
		
		return modelAndView;
	}
	
	/*还车*/
	@ResponseBody  
	@RequestMapping(value="/returnCar1", method=RequestMethod.POST)  
	public Result returnCar1(HttpServletRequest request) throws Exception { 

		String u_card = request.getParameter("u_card");
		String orderList = request.getParameter("orderList");
		String []order = orderList.split("!");
		String b_code = order[0];
		String o_code = order[5];
		String tcdd = order[3];
		System.out.println("tcdd:"+tcdd);
		int d_id = provinceServince.getD_id(tcdd);
		
		orderService.setOrderState("已还车",o_code);
		carService.setCarState("Y", b_code);
		orderService.setOrderRid(d_id,o_code);
		Result result = new Result("success");
		return result;
		
	} 
	
	@RequestMapping(value="/returnCar",method=RequestMethod.GET)
    public ModelAndView returnCar(HttpServletRequest request) throws Exception {
		String u_card = request.getParameter("u_card");
		String b_code=request.getParameter("b_code");
		String o_code=request.getParameter("o_code");
		String viewName="returnCar";
        ModelAndView modelAndView = new ModelAndView(viewName);
        modelAndView.addObject("user", userService.getUserCore(u_card));
        modelAndView.addObject("car", carService.getOneCar(b_code));
        modelAndView.addObject("o_code", o_code);
        //orderService.setOrderState("已还车",b_code);
        //carService.setCarState("Y", b_code);
        return modelAndView;
	}
	
	@RequestMapping(value="/baoxiu",method=RequestMethod.GET)
    public ModelAndView baoxiu(HttpServletRequest request) throws Exception {
		String u_card = request.getParameter("u_card");
		String b_code=request.getParameter("b_code");
		String o_code=request.getParameter("o_code");
		String viewName="baoxiuCar";
        ModelAndView modelAndView = new ModelAndView(viewName);
        modelAndView.addObject("user", userService.getUserCore(u_card));
        modelAndView.addObject("car", carService.getOneCar(b_code));
        modelAndView.addObject("o_code", o_code);
        
        return modelAndView;
	}
	
	
	/*还车*/
	@ResponseBody  
	@RequestMapping(value="/baoxiu1", method=RequestMethod.POST)  
	public String baoxiu1(HttpServletRequest request) throws Exception { 

		String u_card = request.getParameter("u_card");
		String orderList = request.getParameter("orderList");
		String []order = orderList.split("!");
		String b_code = order[0];
		String o_code = order[5];
		String tcdd = order[3];
		System.out.println("tcdd:"+tcdd);
		int d_id = provinceServince.getD_id(tcdd);
		
		orderService.setOrderState1("已报修",o_code);
		orderService.setOrderRid(d_id,o_code);
		
		return "1";
		
	} 
	
	/*获取所有的订单*/
	@ResponseBody
	@RequestMapping(value="/baoxiu2",method=RequestMethod.GET)
	public ModelAndView baoxiu2(HttpServletRequest request,@ModelAttribute("user") User user) throws Exception {
		String viewName="baoxiu";
		String u_card = user.getU_card();
		List<Order> orders = orderService.getOrdersPay(u_card);
		System.out.println("orders:"+orders);
		
		ModelAndView modelAndView = new ModelAndView(viewName);
		modelAndView.addObject("user", userService.getUserCore(u_card));
		modelAndView.addObject("orders", orders);
		
		/*订单统计*/
		modelAndView.addObject("PayOrders", orderService.getPayOrder(u_card));
		modelAndView.addObject("NoPayOrders", orderService.getNoPayOrder(u_card));
		modelAndView.addObject("NoBXOrders", orderService.getNoBXOrder(u_card));
		modelAndView.addObject("BXOrders", orderService.getBXOrder(u_card));
		
		return modelAndView;
	}
	
	@ResponseBody  
	@RequestMapping(value="/grtBaoxiuByTj", method=RequestMethod.GET)  
	public ModelAndView grtBaoxiuByTj(HttpServletRequest request) throws Exception { 
		String o_state = request.getParameter("o_state");
		String u_card = request.getParameter("u_card");
		
		String viewName="baoxiu";
		ModelAndView modelAndView = new ModelAndView(viewName);
		
		List<Order> orders = orderService.getOrdersByTj(o_state,u_card);
		modelAndView.addObject("user", userService.getUserCore(u_card));
		modelAndView.addObject("orders", orders);
		
		/*订单统计*/
		modelAndView.addObject("PayOrders", orderService.getPayOrder(u_card));
		modelAndView.addObject("NoPayOrders", orderService.getNoPayOrder(u_card));
		modelAndView.addObject("NoBXOrders", orderService.getNoBXOrder(u_card));
		modelAndView.addObject("BXOrders", orderService.getBXOrder(u_card));
		
		return modelAndView;
	}  
	
	/*依据订单状态查询订单*/
	@ResponseBody  
	@RequestMapping(value="/grtCarByTj", method=RequestMethod.GET)  
	public ModelAndView grtCarByTj(HttpServletRequest request) throws Exception { 
		String o_state = request.getParameter("o_state");
		String u_card = request.getParameter("u_card");
		
		String viewName="carManager";
		ModelAndView modelAndView = new ModelAndView(viewName);
		
		List<Order> orders = orderService.getOrdersByTj(o_state,u_card);
		modelAndView.addObject("user", userService.getUserCore(u_card));
		modelAndView.addObject("orders", orders);
		
		/*订单统计*/
		modelAndView.addObject("PayOrders", orderService.getPayOrder(u_card));
		modelAndView.addObject("NoPayOrders", orderService.getNoPayOrder(u_card));
		modelAndView.addObject("NoBXOrders", orderService.getNoBXOrder(u_card));
		modelAndView.addObject("BXOrders", orderService.getBXOrder(u_card));
		
		return modelAndView;
	}  
}
