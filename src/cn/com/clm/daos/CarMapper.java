package cn.com.clm.daos;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import cn.com.clm.beans.Biaozhi;
import cn.com.clm.beans.Car;
import cn.com.clm.beans.CarImage;
import cn.com.clm.beans.CarState;
import cn.com.clm.beans.Type;

public interface CarMapper {
	public List<Car> getNewCar();
	
	public List<Car> getLowCar();
	
	public Car getOneCar(String b_code);
	
	public int updateType(Type type);
	
	public int updateBiaozhi(Biaozhi biaozhi);
	
	public int updateCar(Car car);
	
	@Select("select * from car c where state=#{1}")
	public List<Car> selectCarByState(String status);
	
	@Update("update car set state=#{0} where b_code=#{1}")
	public int updateCarState(String state,String b_code);

	@Delete("delete from biaozhi where t_id=#{0}")
	public int deleteBiaozhi(int id);
	
	public List<CarState> getCarState();
	
	@Select("select b_id from biaozhi where b_name=#{0};")
	public int getBiaozhiIdByBiaozhiName(String name);
	
	@Insert("insert into biaozhi (b_name,b_introduce,b_img,b_date)  values(#{b_name},#{b_introduce},#{b_img},#{b_date})")
	public int insertBiaozhi(Biaozhi biaozhi);
	
	@Insert("insert into car (t_id,b_id,b_code,b_kuanshi,b_buydate,b_zuowei,b_chemen,b_ranliao,b_biansu,b_zuoyi,b_isdao,b_iswindow,b_introduce,b_price,state,cost) values(#{t_id},#{b_id},#{b_code},#{b_kuanshi},#{b_buydate},#{b_zuowei},#{b_chemen},#{b_ranliao},#{b_biansu},#{b_zuoyi},#{b_isdao},#{b_iswindow},#{b_introduce},#{b_price},#{state},#{cost})")
	public int insertCar(Car car);
	
	@Insert("insert into car_img (b_code,img1,img2,img3,img4) values(#{b_code},#{img1},#{img2},#{img3},#{img4})")
	public int insertCarImg(CarImage carImg);
	
	@Delete("delete from car where c_id=#{0}")
	public int deleteCar(int id);
	
	@Delete("delete from type where t_id=#{0}")
	public int deleteType(int id);
	
	@Select("select t_id from type where t_type=#{0};")
	public Integer getTypeIdByTypeName(String typeName);
	
	@Insert("insert into type (t_type,t_introduce,t_img,t_date) values(#{t_type},#{t_introduce},#{t_img},#{t_date})")
	public int insertType(Type type);
	
	//汽车使用次数
	@Select("select distinct ord.b_code,(select count(*) from orderlist ord1 where ord.b_code = ord1.b_code group by b_code) as count from orderlist ord order by count desc limit #{0},#{1}")
	public List<Map> getCarCount(int frist,int pageSize);
	
	@Select("SELECT DISTINCT ord.b_code,(SELECT	count(b_code) FROM	orderlist ord1 WHERE ord.b_code = ord1.b_code and ord1.start_date between #{0} and #{1}) as count FROM orderlist ord ORDER BY count DESC LIMIT #{2},#{3}")
	public List<Map> getCarCountBydate(String start_date,String end_date,int frist,int pageSize);
	
	//汽车品牌租用次数
	@Select("select t.t_type,count(*) as count from orderlist ord,car ca ,type t where ord.b_code = ca.b_code and ca.t_id = t.t_id group by t.t_type order by count desc")
	public List<Map> getTypeCount();
	
	@Select("select t.t_type,count(*) as count from orderlist ord,car ca ,type t where ord.b_code = ca.b_code and ca.t_id = t.t_id group by t.t_type and ord.start_date BETWEEN #{0} and #{1} order by count desc")
	public List<Map> getTypeCountBydate(String start_date,String end_date);
	
	/*分页*/
	@Select("SELECT COUNT(*) AS num FROM car c,car_img ci,biaozhi b,TYPE t WHERE c.b_code=ci.b_code AND c.b_id=b.b_id AND c.t_id=t.t_id")
	public int getTotal();
	public List<Car> getPage(int frist,int pageSize);
	
	/*条件分页*/
	public int getTotalByTj(Map<String,Object> condition);
	public List<Car> getPageByTj(Map<String,Object> conditionFz);

	@Select("SELECT * FROM biaozhi limit #{0},#{1}")
	public List<Biaozhi> queryMarkPage(int frist,int pageSize);
	
	@Select("SELECT count(*) FROM biaozhi")
	public int getMarkTotal();
	
	@Select("SELECT * FROM type limit #{0},#{1}")
	public List<Type> queryTypePage(int frist,int pageSize);
	
	@Select("SELECT count(*) FROM type")
	public int getTypeTotal();
	
	@Select("SELECT * FROM biaozhi")
	public List<Biaozhi> queryMark();
	
	@Select("SELECT * FROM type")
	public List<Type> queryType();
	
	@Select("SELECT o_state FROM orderlist")
	public List<Type> queryCarStates();
	
	//设置汽车状态（Y：可租用，N：已租出，Z：已预约）
	@Update("UPDATE car SET state=#{0} WHERE b_code=#{1}")
	public void setCarState(String o_state,String b_code);

	@Select("SELECT * FROM car WHERE b_code=#{0}")
	public List<Car> getCarByBcode(String b_codes);
	
	@Select("SELECT * FROM car WHERE state=#{0} limit #{1},#{2}")
	public List<Car> getCarByState(String state,int frist,int pageSize);
	
	@Select("SELECT count(*) FROM car WHERE state=#{0}")
	public int getCarStateCount(String state);
	
	@Select("SELECT b_img FROM biaozhi WHERE b_id=#{0}")
	public String getMarkImg(String b_id);

	@Select("SELECT t_img FROM TYPE WHERE t_id=#{0}")
	public String getTypeImg(String t_id);

	
	public List<Car> getCars();
	
	public List<Car> getCarsPage(int frist,int pageSize);

	@Select("SELECT s_video FROM systemset WHERE s_id=1")
	public String getVideoName();

	@Select("SELECT s_logo FROM systemset WHERE s_id=1")
	public String getLogoImg();
}
