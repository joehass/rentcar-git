package cn.com.clm.services;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import cn.com.clm.beans.Biaozhi;
import cn.com.clm.beans.Car;
import cn.com.clm.beans.CarImage;
import cn.com.clm.beans.CarState;
import cn.com.clm.beans.Page;
import cn.com.clm.beans.Type;

@Repository
public interface CarService {
	
	public List<Map> getTypeCountByDate(String start_date,String end_date);
	
	public Page getCarCountByDate(int page,String start_date,String end_date);
	
	public Page pageAllByTj1(int page, String tj);
	
	public int insertCarImg(CarImage carImg);
	
	public List<Car> getCarByBcode(String b_codes);
	
	public List<CarState> getCarState();
	
	public Page getCarByState(String state,int page);
	
	public int updateCarState(String state,String b_code);
	
	public int updateCar(Car car);
	
	public int insertCar(Car car);
	
	public int deleteCar(int id);
	
	public int deleteBiaozhi(int id);
	
	public int getBiaozhiIdByBiaozhiName(String name);
	
	public int insertBiaozhi(Biaozhi biaozhi);
	
	public int updateBiaozhi(Biaozhi biaozhi);
	
	public Integer getTypeIdByTypeName(String typeName);
	
	public int insertType(Type type);
	
	public int deleteType(int id);
	
	public int updateType(Type type);
	
	public Page queryMarkPage(int page);
	
	public Page queryTypePage(int page);
	
	public Page getCarsPage(int page);
	
	public List<Map>getTypeCount();
	
	public List<Car> getNewCar();
	
	public List<Car> getLowCar();
	
	public Car getOneCar(String b_code);
	
	public Page getCarCount(int page);
	
	public void setCarState(String o_state,String b_code);
	
	public Page pageAll(int page);
	
	public List<Biaozhi> queryMark();
	
	public List<Type> queryType();

	public Page pageAllByTj(int page, String tj);

	public String getMarkImg(String b_id);

	public String getTypeImg(String t_id);

	public List<Car> getCars();

	public String getVideoName();

	public String getLogoImg();

}
