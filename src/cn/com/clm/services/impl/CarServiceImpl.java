package cn.com.clm.services.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.clm.beans.Biaozhi;
import cn.com.clm.beans.Car;
import cn.com.clm.beans.CarImage;
import cn.com.clm.beans.CarState;
import cn.com.clm.beans.Page;
import cn.com.clm.beans.Type;
import cn.com.clm.daos.CarMapper;
import cn.com.clm.services.CarService;
@Service
public class CarServiceImpl implements CarService{
	@Autowired
	private CarMapper carMapper;
	private List<Car> list;
	private int pageSize=6;
	
	/*按条件分页的方法*/
	@Override
	public Page pageAllByTj1(int page, String tj) {
		Page pageModel = new Page();
		pageModel.setPage(page);
		pageModel.setSize(pageSize);
		/*获取条件*/
		String str_tj[] = tj.split("!");
		Map<String,Object> Condition = new HashMap<>();
		Condition.put("t_id", str_tj[0]);
		Condition.put("b_code", str_tj[1]);
		Condition.put("b_id", str_tj[2]);
		Condition.put("kuanshi", str_tj[3]);
		Condition.put("ranliao", str_tj[4]);
		Condition.put("biansu", str_tj[5]);
		Condition.put("zuoyi", str_tj[6]);
		Condition.put("isdao", str_tj[7]);
		Condition.put("iswindow", str_tj[8]);
		Condition.put("b_date", str_tj[9]);
		Condition.put("zuowei", str_tj[10]);
		
		Condition.put("chemen", str_tj[11]);
		
		
		System.out.println("CarServiceImpl->Condition:"+Condition);
		
		int total = carMapper.getTotalByTj(Condition);
		System.out.println("CarServiceImpl->total:"+total);
		
		int totalPage=0;
		if(total%pageSize==0){
			totalPage=total/pageSize;
		}else{
			totalPage=total/pageSize+1;
		}
		pageModel.setTotalPage(totalPage);
		
		int first = (page-1)*pageSize;
		
		Map<String,Object> ConditionFz = new HashMap<>();
		ConditionFz.put("t_id", str_tj[0]);
		ConditionFz.put("b_code", str_tj[1]);
		ConditionFz.put("b_id", str_tj[2]);
		ConditionFz.put("kuanshi", str_tj[3]);
		ConditionFz.put("ranliao", str_tj[4]);
		ConditionFz.put("biansu", str_tj[5]);
		ConditionFz.put("zuoyi", str_tj[6]);
		ConditionFz.put("isdao", str_tj[7]);
		ConditionFz.put("iswindow", str_tj[8]);
		ConditionFz.put("b_date", str_tj[9]);
		ConditionFz.put("zuowei", str_tj[10]);
		
		ConditionFz.put("chemen", str_tj[11]);
		
		ConditionFz.put("first", first);
		ConditionFz.put("pageSize", pageSize);
		
		list=carMapper.getPageByTj(ConditionFz);
		
		//存储数据
		pageModel.setDate(list);
		return pageModel;
	}
	
	@Override
	public List<Car> getCarByBcode(String b_codes) {
		// TODO Auto-generated method stub
		return carMapper.getCarByBcode(b_codes);
	}

	@Override
	public Page getCarByState(String state, int page) {
		Page pageModel = new Page();
		pageModel.setPage(page);
		pageModel.setSize(pageSize);
		int total = carMapper.getCarStateCount(state);
		int totalPage=0;
		if(total%pageSize==0){
			totalPage=total/pageSize;
		}else{
			totalPage=total/pageSize+1;
		}
		pageModel.setTotalPage(totalPage);
		
		int frist = (page-1)*pageSize;
		List<Car>list = carMapper.getCarByState(state, frist, page);
		System.out.println("frist:"+frist+"-pageSize:"+pageSize);
		//存储数据
		pageModel.setDate(list);
		return pageModel;	
	}

	@Override
	public int updateCarState(String state, String b_code) {
		// TODO Auto-generated method stub
		return carMapper.updateCarState(state, b_code);
	}

	@Override
	public List<CarState> getCarState() {
		// TODO Auto-generated method stub
		return carMapper.getCarState();
	}

	@Override
	public List<Map> getTypeCount() {
		return carMapper.getTypeCount();
	}
	
	@Override
	public List<Map> getTypeCountByDate(String start_date,String end_date) {
		return carMapper.getTypeCountBydate(start_date, end_date);
	}
	
	@Override
	public int updateBiaozhi(Biaozhi biaozhi) {
		// TODO Auto-generated method stub
		return carMapper.updateBiaozhi(biaozhi);
	}
	
	@Override
	public int insertCar(Car car) {
		// TODO Auto-generated method stub
		return carMapper.insertCar(car);
	}
	

	@Override
	public int insertCarImg(CarImage carImg) {
		// TODO Auto-generated method stub
		return carMapper.insertCarImg(carImg);
	}

	@Override
	public int deleteCar(int id) {
		// TODO Auto-generated method stub
		return carMapper.deleteCar(id);
	}

	@Override
	public int updateCar(Car car) {
		// TODO Auto-generated method stub
		return carMapper.updateCar(car);
	}

	@Override
	public int deleteBiaozhi(int id) {
		// TODO Auto-generated method stub
		return carMapper.deleteBiaozhi(id);
	}

	@Override
	public int getBiaozhiIdByBiaozhiName(String name) {
		// TODO Auto-generated method stub
		return carMapper.getBiaozhiIdByBiaozhiName(name);
	}

	@Override
	public int insertBiaozhi(Biaozhi biaozhi) {
		// TODO Auto-generated method stub
		return carMapper.insertBiaozhi(biaozhi);
	}

	@Override
	public Integer getTypeIdByTypeName(String typeName) {
		return carMapper.getTypeIdByTypeName(typeName);
	}


	@Override
	public int insertType(Type type) {
		// TODO Auto-generated method stub
		return carMapper.insertType(type);
	}
	
	@Override
	public int updateType(Type type) {
		// TODO Auto-generated method stub
		return carMapper.updateType(type);
	}

	@Override
	public int deleteType(int id) {
		// TODO Auto-generated method stub
		return carMapper.deleteType(id);
	}

	@Override
	public Page queryMarkPage(int page){
		Page pageModel = new Page();
		pageModel.setPage(page);
		pageModel.setSize(pageSize);
		int total = carMapper.getMarkTotal();
		int totalPage=0;
		if(total%pageSize==0){
			totalPage=total/pageSize;
		}else{
			totalPage=total/pageSize+1;
		}
		pageModel.setTotalPage(totalPage);
		
		int frist = (page-1)*pageSize;
		List<Biaozhi>list = carMapper.queryMarkPage(frist,pageSize);
		System.out.println("frist:"+frist+"-pageSize:"+pageSize);
		//存储数据
		pageModel.setBiaozhi(list);
		return pageModel;		
	}
	
	@Override
	public Page getCarsPage(int page){
		Page pageModel = new Page();
		pageModel.setPage(page);
		pageModel.setSize(pageSize);
		int total = carMapper.getTotal();
		int totalPage=0;
		if(total%pageSize==0){
			totalPage=total/pageSize;
		}else{
			totalPage=total/pageSize+1;
		}
		pageModel.setTotalPage(totalPage);
		
		int frist = (page-1)*pageSize;
		List<Car>list = carMapper.getCarsPage(frist,pageSize);
		System.out.println("frist:"+frist+"-pageSize:"+pageSize);
		//存储数据
		pageModel.setDate(list);
		return pageModel;
				
	}
	
	@Override
	public Page queryTypePage(int page){
		Page pageModel = new Page();
		pageModel.setPage(page);
		pageModel.setSize(pageSize);
		int total = carMapper.getTypeTotal();
		int totalPage=0;
		if(total%pageSize==0){
			totalPage=total/pageSize;
		}else{
			totalPage=total/pageSize+1;
		}
		pageModel.setTotalPage(totalPage);
		
		int frist = (page-1)*pageSize;
		List<Type>list = carMapper.queryTypePage(frist,pageSize);
		System.out.println("frist:"+frist+"-pageSize:"+pageSize);
		//存储数据
		pageModel.setType(list);
		return pageModel;
		
	}
	
	@Override
	public Page getCarCountByDate(int page,String start_date,String end_date) {
		Page pageModel = new Page();
		pageModel.setPage(page);
		pageModel.setSize(pageSize);
		int total = carMapper.getTotal();
		int totalPage=0;
		if(total%pageSize==0){
			totalPage=total/pageSize;
		}else{
			totalPage=total/pageSize+1;
		}
		pageModel.setTotalPage(totalPage);
		
		int frist = (page-1)*pageSize;
		List <Map>list=carMapper.getCarCountBydate( start_date, end_date, frist, pageSize);
		System.out.println("frist:"+frist+"-pageSize:"+pageSize);
		//存储数据
		pageModel.setList(list);
		return pageModel;
	}
	
	@Override
	public Page getCarCount(int page) {
		Page pageModel = new Page();
		pageModel.setPage(page);
		pageModel.setSize(pageSize);
		int total = carMapper.getTotal();
		int totalPage=0;
		if(total%pageSize==0){
			totalPage=total/pageSize;
		}else{
			totalPage=total/pageSize+1;
		}
		pageModel.setTotalPage(totalPage);
		
		int frist = (page-1)*pageSize;
		List <Map>list=carMapper.getCarCount(frist,pageSize);
		System.out.println("frist:"+frist+"-pageSize:"+pageSize);
		//存储数据
		pageModel.setList(list);
		return pageModel;
	}

	@Override
	public List<Car> getNewCar() {
		List<Car> newCar = carMapper.getNewCar();
		return newCar;
	}

	@Override
	public List<Car> getLowCar() {
		List<Car> lowCar = carMapper.getLowCar();
		return lowCar;
	}

	@Override
	public Car getOneCar(String b_code) {
		Car car = carMapper.getOneCar(b_code);
		return car;
	}
	
	@Override
	public List<Biaozhi> queryMark() {
		return carMapper.queryMark();
	}
	
	@Override
	public List<Type> queryType() {
		return carMapper.queryType();
	}

	
	@Override
	public Page pageAll(int page) {
		Page pageModel = new Page();
		pageModel.setPage(page);
		pageModel.setSize(pageSize);
		int total = carMapper.getTotal();
		int totalPage=0;
		if(total%pageSize==0){
			totalPage=total/pageSize;
		}else{
			totalPage=total/pageSize+1;
		}
		pageModel.setTotalPage(totalPage);
		
		int frist = (page-1)*pageSize;
		list=carMapper.getPage(frist,pageSize);
		System.out.println("frist:"+frist+"-pageSize:"+pageSize);
		//存储数据
		pageModel.setDate(list);
		return pageModel;
	}

	/*按条件分页的方法*/
	@Override
	public Page pageAllByTj(int page, String tj) {
		Page pageModel = new Page();
		pageModel.setPage(page);
		pageModel.setSize(pageSize);
		/*获取条件*/
		String str_tj[] = tj.split("!");
		Map<String,Object> Condition = new HashMap<>();
		Condition.put("t_id", str_tj[0]);
		Condition.put("b_code", str_tj[1]);
		Condition.put("b_id", str_tj[2]);
		Condition.put("kuanshi", str_tj[3]);
		Condition.put("ranliao", str_tj[4]);
		Condition.put("biansu", str_tj[5]);
		Condition.put("zuoyi", str_tj[6]);
		Condition.put("isdao", str_tj[7]);
		Condition.put("iswindow", str_tj[8]);
		Condition.put("b_date", str_tj[9]);
		Condition.put("zuowei", str_tj[10]);
		Condition.put("price1", str_tj[11]);
		Condition.put("chemen", str_tj[12]);
		Condition.put("price2", str_tj[13]);
		
		System.out.println("CarServiceImpl->Condition:"+Condition);
		
		int total = carMapper.getTotalByTj(Condition);
		System.out.println("CarServiceImpl->total:"+total);
		
		int totalPage=0;
		if(total%pageSize==0){
			totalPage=total/pageSize;
		}else{
			totalPage=total/pageSize+1;
		}
		pageModel.setTotalPage(totalPage);
		
		int first = (page-1)*pageSize;
		
		Map<String,Object> ConditionFz = new HashMap<>();
		ConditionFz.put("t_id", str_tj[0]);
		ConditionFz.put("b_code", str_tj[1]);
		ConditionFz.put("b_id", str_tj[2]);
		ConditionFz.put("kuanshi", str_tj[3]);
		ConditionFz.put("ranliao", str_tj[4]);
		ConditionFz.put("biansu", str_tj[5]);
		ConditionFz.put("zuoyi", str_tj[6]);
		ConditionFz.put("isdao", str_tj[7]);
		ConditionFz.put("iswindow", str_tj[8]);
		ConditionFz.put("b_date", str_tj[9]);
		ConditionFz.put("zuowei", str_tj[10]);
		ConditionFz.put("price1", str_tj[11]);
		ConditionFz.put("chemen", str_tj[12]);
		ConditionFz.put("price2", str_tj[13]);
		ConditionFz.put("first", first);
		ConditionFz.put("pageSize", pageSize);
		
		list=carMapper.getPageByTj(ConditionFz);
		
		//存储数据
		pageModel.setDate(list);
		return pageModel;
	}

	//设置汽车状态为已预约
	@Override
	public void setCarState(String o_state,String b_code) {
		carMapper.setCarState(o_state,b_code);
	}

	@Override
	public String getMarkImg(String b_id) {
		return carMapper.getMarkImg(b_id);
	}

	@Override
	public String getTypeImg(String t_id) {
		return carMapper.getTypeImg(t_id);
	}

	@Override
	public List<Car> getCars() {
		return carMapper.getCars();
	}

	@Override
	public String getVideoName() {
		return carMapper.getVideoName();
	}

	@Override
	public String getLogoImg() {
		return carMapper.getLogoImg();
	}

}
