package cn.com.clm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import cn.com.clm.beans.Biaozhi;
import cn.com.clm.beans.Car;
import cn.com.clm.beans.CarImage;
import cn.com.clm.beans.CarState;
import cn.com.clm.beans.CarTypeList;
import cn.com.clm.beans.Manager;
import cn.com.clm.beans.Page;
import cn.com.clm.beans.Type;
import cn.com.clm.beans.User;
import cn.com.clm.services.CarService;
import cn.com.clm.services.ManagerService;
import cn.com.clm.services.UserService;
import cn.com.clm.utils.Result;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@SessionAttributes("user")
@Scope("prototype")
@RequestMapping("/car")
public class CarController {
	@Autowired
	private CarService carService;
	@Autowired
	private UserService userService;
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping("/addCar")
	@ResponseBody
	public Result addCar(Car car,HttpServletRequest request){
		car.setB_buydate(new Date().toLocaleString().toString().substring(0, 9));
		car.setState("Y");
		carService.insertCar(car);
		CarImage carImage = new CarImage();
		String[] img1 = car.getCarImage().getImg1().split("\\\\");
		String[] img2 = car.getCarImage().getImg2().split("\\\\");
		String[] img3 = car.getCarImage().getImg3().split("\\\\");
		String[] img4 = car.getCarImage().getImg4().split("\\\\");
		carImage.setImg1(img1[img1.length-1]);
		carImage.setImg2(img2[img2.length-1]);
		carImage.setImg3(img3[img3.length-1]);
		carImage.setImg4(img4[img4.length-1]);
		carImage.setB_code(car.getB_code());
		carService.insertCarImg(carImage);
		Result result = new Result();
		result.setStatus("success");
		return result;
	}
	
	@RequestMapping("/deleteCar")
	@ResponseBody
	public Result deleteCar(Car car,HttpServletRequest request){
		
		Car car1 = carService.getOneCar(car.getB_code());
		
		Result result = new Result();
		
		if(car1 != null){
			carService.deleteCar(car1.getC_id());
			result.setStatus("success");
			return result;
		}
		result.setStatus("fail");
		return result;
	}
	
	@RequestMapping("/modifyCarState")
	@ResponseBody
	public Result modifyCarState(HttpServletRequest request){
		String b_code = request.getParameter("b_code");
		String state = request.getParameter("state");
		
		int i = carService.updateCarState(state,b_code);
		
		Result result = new Result();
		
		if(i != 0){
			result.setStatus("success");
			return result;
		}
		result.setStatus("fail");
		return result;
	}
	
	@RequestMapping("/modifyCar")
	@ResponseBody
	public Result modifyCar(Car car,HttpServletRequest request){
		Car car1 = carService.getOneCar(car.getB_code());
		
		int i = carService.updateCar(car);
		
		Result result = new Result();
		
		if(i != 0){
			result.setStatus("success");
			return result;
		}
		result.setStatus("fail");
		return result;
	}
	
	
	@RequestMapping("/addBiaozhi")
	@ResponseBody
	public Result addBiaozhi(Biaozhi biaozhi,HttpServletRequest request){
		Result result = new Result();
		String[] img = biaozhi.getB_img().split("\\\\");
		biaozhi.setB_img(img[img.length-1]);
		biaozhi.setB_date(new Date().toLocaleString().toString().substring(0, 9));
		carService.insertBiaozhi(biaozhi);
		result.setStatus("success");
		return result;
	
	}
	
	@RequestMapping("/deleteBiaozhi")
	@ResponseBody
	public Result deleteBiaozhi(Biaozhi biaozhi,HttpServletRequest request){
		
		int t_id = carService.getBiaozhiIdByBiaozhiName(biaozhi.getB_name());
		Result result = new Result();
		if(t_id == 0){
			carService.deleteBiaozhi(t_id);
			result.setStatus("success");
		}
		result.setStatus("fail");
		return result;
	}
	
	@RequestMapping("/modifyBiaozhi")
	@ResponseBody
	public Result modifyBiaozhi(Biaozhi biaozhi,HttpServletRequest request){
		int b_id = carService.getBiaozhiIdByBiaozhiName(biaozhi.getB_name());
		biaozhi.setB_id(b_id);
		String[] img = biaozhi.getB_img().split("\\\\");
		biaozhi.setB_img(img[img.length-1]);
		biaozhi.setB_date(new Date().toLocaleString().toString().substring(0, 9));
		int i = carService.updateBiaozhi(biaozhi);
		Result result = new Result();
		if(i != 0){
			result.setStatus("success");
			return result;
		}
		result.setStatus("fail");
		return result;
	}
	
	@RequestMapping("/addType")
	@ResponseBody
	public Result addType(Type type,HttpServletRequest request) throws JsonParseException, JsonMappingException, IOException{
		
		Result result = new Result();
		int i = 0;
			
		String[] img = type.getT_img().split("\\\\");
		type.setT_img(img[img.length-1]);
		type.setT_date(new Date().toLocaleString().toString().substring(0, 9));
		carService.insertType(type);
       
    	result.setStatus("success");
       
    	return result;
    	 
	}
	
	@RequestMapping("/deleteType")
	@ResponseBody
	public Result deleteType(Type type,HttpServletRequest request){
		Result result = new Result();
		int t_id = carService.getTypeIdByTypeName(type.getT_type());
		carService.deleteType(t_id);
		result.setStatus("success");
		return result;
		
	}
	
	@RequestMapping("/modifyType")
	@ResponseBody
	public Result modifyType(Type type,HttpServletRequest request){
		
		int t_id = carService.getTypeIdByTypeName(type.getT_type());
		type.setT_id(t_id);
		type.setT_date(new Date().toLocaleString().toString().substring(0, 9));
		String[] img = type.getT_img().split("\\\\");
		type.setT_img(img[img.length-1]);
		int i = carService.updateType(type);
		Result result = new Result();
		if(i != 0){
			result.setStatus("success");
			return result;
		}
		result.setStatus("fail");
		return result;
	}
	
	@RequestMapping("/queryCar")
	public ModelAndView queryType(HttpServletRequest request){
		String viewName = "carManager";
		
		String card = request.getParameter("m_card");
		String page=request.getParameter("page");
		
		if(page == null){
			page="1";
		}
		
		ModelAndView modelAndView = new ModelAndView(viewName);
		
		Manager manager = managerService.getManagerCore(card);
		Page list1 = carService.queryMarkPage(Integer.parseInt(page));
		Page list = carService.queryTypePage(Integer.parseInt(page));
		Page list2 = carService.getCarsPage(Integer.parseInt(page));
		Page list4 = carService.getCarsPage(Integer.parseInt(page));
		List<Type> list5 = carService.queryType();
		List<Biaozhi> list6 = carService.queryMark();
		List<CarState>list3 = carService.getCarState();
		
		modelAndView.addObject("user",manager);
		modelAndView.addObject("Type",list);
		modelAndView.addObject("type",list5);
		modelAndView.addObject("biaozhi",list6);
		modelAndView.addObject("Biaozhi",list1);
		modelAndView.addObject("Car",list2);
		modelAndView.addObject("CarState",list3);
		modelAndView.addObject("Car1",list4);
		
		
		return modelAndView;
	}
	
	@RequestMapping("/carRanking")
	public ModelAndView getCarCount(HttpServletRequest request){
		
		String viewName = "rankingList";
		
		String card = (String)request.getParameter("m_card");
		String page=request.getParameter("page");
		
		Manager manager = managerService.getManagerCore(card);
		
		if(page == null){
			page="1";
		}
		
		Page page1 = carService.getCarCount(Integer.parseInt(page));
		List<Map> list1 = carService.getTypeCount();
		
		ModelAndView modelAndView = new ModelAndView(viewName);
		
		modelAndView.addObject("pageDate",page1);
		modelAndView.addObject("type",list1);
		modelAndView.addObject("user",manager);
		
		return modelAndView;
	}
	
	@RequestMapping("/carRankingBydate")
	public ModelAndView carRankingBydate(HttpServletRequest request){
		
		String viewName = "rankingList";
		
		String card = (String)request.getParameter("m_card");
		String page=request.getParameter("page");
		
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		
		Manager manager = managerService.getManagerCore(card);
		
		if(page == null){
			page="1";
		}
		
		Page page1 = carService.getCarCountByDate(Integer.parseInt(page),start_date,end_date);
		List<Map> list1 = carService.getTypeCount();
		
		ModelAndView modelAndView = new ModelAndView(viewName);
		
		modelAndView.addObject("pageDate",page1);
		modelAndView.addObject("type",list1);
		modelAndView.addObject("user",manager);
		
		return modelAndView;
	}
	
	
	@RequestMapping("/carRankingQpBydate")
	public ModelAndView carRankingQpBydate(HttpServletRequest request){
		
		String viewName = "rankingList";
		
		String card = (String)request.getParameter("m_card");
		String page=request.getParameter("page");
		
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		
		Manager manager = managerService.getManagerCore(card);
		
		if(page == null){
			page="1";
		}
		
		Page page1 = carService.getCarCount(Integer.parseInt(page));
		List<Map> list1 = carService.getTypeCountByDate(start_date, end_date);
		
		ModelAndView modelAndView = new ModelAndView(viewName);
		
		modelAndView.addObject("pageDate",page1);
		modelAndView.addObject("type",list1);
		modelAndView.addObject("user",manager);
		
		return modelAndView;
	}
	
	@RequestMapping("/carManager")
	public ModelAndView carManage(HttpServletRequest request){
		String card = (String)request.getParameter("m_card");
		Manager manager = managerService.getManagerCore(card);
		List<Car> car = carService.getCars();
		String viewName = "managerCarManage";
		ModelAndView modelAndView = new ModelAndView(viewName);
		modelAndView.addObject("car",car);
		modelAndView.addObject("user",manager);
		return modelAndView;
	}
	
	@RequestMapping(value="/getCarInfo/{b_code}")
	public String getCarInfo(@PathVariable("b_code") String b_code,@ModelAttribute("user") User user,Map<String,Object> map){
		System.out.println("你所查询的汽车的车牌："+b_code);
		map.put("car", carService.getOneCar(b_code));
		map.put("user", user);
		return "carInfo";
	}
	
	@RequestMapping(value="/getManagerCarInfo/{b_code}")
	public String getManagerCarInfo(@PathVariable("b_code") String b_code,@ModelAttribute("user") Manager user,Map<String,Object> map){
		System.out.println("你所查询的汽车的车牌："+b_code);
		map.put("car", carService.getOneCar(b_code));
		map.put("user", user);
		return "managerCarInfo";
	}
	
	@RequestMapping(value="/index/{u_card}",method=RequestMethod.GET)
    public ModelAndView getIndex(@PathVariable("u_card") String u_card) throws Exception {
        String viewName="index";
        ModelAndView modelAndView = new ModelAndView(viewName); 
		modelAndView.addObject("newCars", carService.getNewCar());
		modelAndView.addObject("lowCars", carService.getLowCar());
		modelAndView.addObject("user", userService.getUserCore(u_card));
		return modelAndView;
    }
	
	@ResponseBody
	@RequestMapping(value="/makeOrder",method=RequestMethod.GET)
    public ModelAndView makeOrder(HttpServletRequest request) throws Exception {
		String u_card = request.getParameter("u_card");
		String b_code=request.getParameter("b_code");
		String viewName="makeOrder";
        ModelAndView modelAndView = new ModelAndView(viewName);
        modelAndView.addObject("user", userService.getUserCore(u_card));
        modelAndView.addObject("car", carService.getOneCar(b_code));
        return modelAndView;
	}
	
	//分页
	@ResponseBody
	@RequestMapping(value="/getPageCar",method=RequestMethod.GET)
    public ModelAndView getPageCar(HttpServletRequest request) throws Exception {
		String u_card = request.getParameter("u_card");
		String page=request.getParameter("page");
        if(page == null){
			page="1";
		}
        User user1 = userService.getUserCore(u_card);
		Manager manager1 = managerService.getManagerCore(u_card);
		ModelAndView modelAndView = new ModelAndView();
		String viewName = null;
		if(user1 != null){
			viewName="queryCar";
			modelAndView.addObject("user", user1);
		}
		if(manager1 != null){
			viewName="managerIndex";
			modelAndView.addObject("user", manager1);
		}
		modelAndView.setViewName(viewName);
        //查询汽车的类型和品牌遍历在option上
        modelAndView.addObject("types", carService.queryType());
        modelAndView.addObject("marks", carService.queryMark());
        
		modelAndView.addObject("pageDate", carService.pageAll(Integer.parseInt(page)));
		
		return modelAndView;
    }
	
	/*查看车图*/
	@ResponseBody
	@RequestMapping(value="/getImg",method=RequestMethod.GET)
    public ModelAndView getImg(HttpServletRequest request) throws Exception {
		String u_card = request.getParameter("u_card");
		String viewName="carImg";
        ModelAndView modelAndView = new ModelAndView(viewName); 
        
        //查询汽车的类型和品牌遍历在option上
        modelAndView.addObject("types", carService.queryType());
        modelAndView.addObject("marks", carService.queryMark());
        
        modelAndView.addObject("Cars", carService.getCars());
        
		modelAndView.addObject("user", userService.getUserCore(u_card));
		return modelAndView;
    }
	
	//按条件分页
	@ResponseBody
	@RequestMapping(value="/getPageCarByTj",method=RequestMethod.GET)
	public ModelAndView getPageCarByTj(HttpServletRequest request) throws Exception {
		String u_card = request.getParameter("u_card");
		String page=request.getParameter("page");
		if(page == null){
			page="1";
		}
		String tj=request.getParameter("tj");
		
		String viewName="queryCar";
		ModelAndView modelAndView = new ModelAndView(viewName); 
		
		//查询汽车的类型和品牌遍历在option上
		modelAndView.addObject("types", carService.queryType());
		modelAndView.addObject("marks", carService.queryMark());
		
		Page pageDate = carService.pageAllByTj(Integer.parseInt(page),tj);
		System.out.println("CarController-》按条件分页的pageDate:"+pageDate);
		
		modelAndView.addObject("pageDate",pageDate );
		
		
		modelAndView.addObject("user", userService.getUserCore(u_card));
		return modelAndView;
	}
	
	/*依据b_id查询标志的图片*/
	@ResponseBody  
	@RequestMapping(value="/getMarkImg", method=RequestMethod.POST)  
	public String getMarkImg(HttpServletRequest request) throws Exception { 
		String b_id = request.getParameter("b_id");
		String b_img = carService.getMarkImg(b_id);
		return b_img;
	} 
	
	/*依据t_id查询类型的图片*/
	@ResponseBody  
	@RequestMapping(value="/getTypeImg", method=RequestMethod.POST)  
	public String getTypeImg(HttpServletRequest request) throws Exception { 
		String t_id = request.getParameter("t_id");
		String t_img = carService.getTypeImg(t_id);
		return t_img;
	} 
	
	/*更新汽车宣传视屏*/
	@ResponseBody  
	@RequestMapping(value="/getVideo", method=RequestMethod.POST)  
	public String getVideo(HttpServletRequest request) throws Exception { 
		String videoName = carService.getVideoName();
		return videoName;
	} 
	
	/*更新汽车宣传LOGO*/
	@ResponseBody  
	@RequestMapping(value="/getLogoImg", method=RequestMethod.POST)  
	public String getLogoImg(HttpServletRequest request) throws Exception { 
		String imgName = carService.getLogoImg();
		return imgName;
	} 
	
	
	@RequestMapping("/getCarByState")
	public ModelAndView getCarByState(HttpServletRequest request){
		String viewName = "carManager";
		
		String card = request.getParameter("m_card");
		String page=request.getParameter("page");
		String state=request.getParameter("o_state");
		
		if(page == null){
			page="1";
		}
		
		ModelAndView modelAndView = new ModelAndView(viewName);

		Manager manager = managerService.getManagerCore(card);
		Page list1 = carService.queryMarkPage(Integer.parseInt(page));
		Page list = carService.queryTypePage(Integer.parseInt(page));
		Page list2 = carService.getCarsPage(Integer.parseInt(page));
		List<CarState>list3 = carService.getCarState();
		Page list4= carService.getCarByState(state, Integer.parseInt(page));
		modelAndView.addObject("types", carService.queryType());
        modelAndView.addObject("marks", carService.queryMark());
		modelAndView.addObject("user",manager);
		modelAndView.addObject("Type",list);
		modelAndView.addObject("Biaozhi",list1);
		modelAndView.addObject("Car",list2);
		modelAndView.addObject("CarState",list3);
		modelAndView.addObject("Car1",list4);
		
		return modelAndView;
	}
	
	@RequestMapping("/queryCarByTj1")
	public ModelAndView queryCarByTj1(HttpServletRequest request){
		String viewName = "carManager";
		
		String card = request.getParameter("m_card");
		String page=request.getParameter("page");
		String tj=request.getParameter("tj");
		
		if(page == null){
			page="1";
		}
		
		ModelAndView modelAndView = new ModelAndView(viewName);
		
		Manager manager = managerService.getManagerCore(card);
		Page list1 = carService.queryMarkPage(Integer.parseInt(page));
		Page list = carService.queryTypePage(Integer.parseInt(page));
		Page list2 = carService.pageAllByTj(Integer.parseInt(page),tj);
		Page list4 = carService.getCarsPage(Integer.parseInt(page));
		List<CarState>list3 = carService.getCarState();
		modelAndView.addObject("types", carService.queryType());
        modelAndView.addObject("marks", carService.queryMark());

		modelAndView.addObject("user",manager);
		modelAndView.addObject("Type",list);
		modelAndView.addObject("Biaozhi",list1);
		modelAndView.addObject("Car",list2);
		modelAndView.addObject("CarState",list3);
		modelAndView.addObject("Car1",list4);
		
		
		return modelAndView;
	}
	
	@RequestMapping(value="/managerIndex")
    public ModelAndView adminLogin(Manager manager,HttpServletRequest request,ModelMap model) throws Exception {
	
        ModelAndView modelAndView;
		String viewName="managerIndex";
		String u_card = request.getParameter("m_card");
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
	
	@RequestMapping(value="/managerIndexXq")
	@ResponseBody
    public Car managerIndexXq(Manager manager,HttpServletRequest request,ModelMap model) throws Exception {
       
		String b_code=request.getParameter("b_code");
	   
	    Car car = carService.getOneCar(b_code);
	   
	        
		return car;
    }
	
}
