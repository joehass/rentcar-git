package cn.com.clm.utils;

import java.io.File;
import java.util.Date;

import cn.com.clm.beans.OrderInfo;
import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.format.UnderlineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class ExportExcelUtil {
	/*定义到处Excel文件的路径*/
	public final static String exportPath="D:\\";
	
	/**
	 * 导出Excel文件订单的方法
	 * @return
	 */
	public static boolean exportExcel(OrderInfo order){
		File file = new File(exportPath+"风行天下租车订单"+new Date().toLocaleString().substring(0, 9)+".xls");
		if(file.exists()){
			file.delete();
		}
		try {
			file.createNewFile();
			WritableWorkbook workbook = Workbook.createWorkbook(file);
			WritableSheet sheet = workbook.createSheet("我的订单", 0);
			
			WritableFont font1 = new WritableFont(WritableFont.ARIAL,20,WritableFont.BOLD,false,UnderlineStyle.NO_UNDERLINE,Colour.GREEN); 
			WritableCellFormat cellFormat1 = new WritableCellFormat(font1);  
	        //设置背景颜色;  
	        cellFormat1.setBackground(Colour.GREY_25_PERCENT);  
	        //设置边框;  
	        cellFormat1.setBorder(Border.ALL, BorderLineStyle.DASH_DOT);  
	        //设置自动换行;  
	        cellFormat1.setWrap(true);  
	        //设置文字居中对齐方式;  
	        cellFormat1.setAlignment(Alignment.CENTRE);  
	        //设置垂直居中;  
	        cellFormat1.setVerticalAlignment(VerticalAlignment.CENTRE); 
	        
	        sheet.setColumnView( 0 , 25 );
	        sheet.setColumnView( 1 , 40 );
	        sheet.setColumnView( 2 , 8 );
	        sheet.setColumnView( 3 , 25 );
	        sheet.setColumnView( 4 , 40 );
			
			sheet.mergeCells(0, 0, 4, 1);
			Label label00 = new Label(0, 0,"汽车租赁专用订单表",cellFormat1);
			sheet.addCell(label00);
			
			WritableFont font2 = new WritableFont(WritableFont.ARIAL,14,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE,Colour.BLACK);  
	        WritableCellFormat cellFormat2 = new WritableCellFormat(font2);  
	        cellFormat2.setAlignment(Alignment.CENTRE);  
	        cellFormat2.setBackground(Colour.WHITE);  
	        cellFormat2.setBorder(Border.ALL, BorderLineStyle.THIN);  
	        cellFormat2.setWrap(true);
			
			/*添加数据*/
	        /*2*/
			Label label02 = new Label(0, 2,"订单号",cellFormat2);
			Label label12 = new Label(1, 2,order.getO_code(),cellFormat2);
			Label label22 = new Label(2, 2,"",cellFormat2);
			Label label32 = new Label(3, 2,"总金额",cellFormat2);
			Label label42 = new Label(4, 2,(order.getAllMoney()+800)+"",cellFormat2);
			sheet.addCell(label02);sheet.addCell(label12);sheet.addCell(label22);sheet.addCell(label32);sheet.addCell(label42);
			/*3*/
			Label label03 = new Label(0, 3,"提车日期",cellFormat2);
			Label label13 = new Label(1, 3,order.getStart_date(),cellFormat2);
			Label label23 = new Label(2, 3,"",cellFormat2);
			Label label33 = new Label(3, 3,"还车日期",cellFormat2);
			Label label43 = new Label(4, 3,order.getEnd_date(),cellFormat2);
			sheet.addCell(label03);sheet.addCell(label13);sheet.addCell(label23);sheet.addCell(label33);sheet.addCell(label43);
			/*4*/
			Label label04 = new Label(0, 4,"35元保险",cellFormat2);
			Label label14 = new Label(1, 4,order.getO_bx(),cellFormat2);
			Label label24 = new Label(2, 4,"",cellFormat2);
			Label label34 = new Label(3, 4,"提车店铺",cellFormat2);
			Label label44 = new Label(4, 4,order.getDiqu().getD_pname(),cellFormat2);
			sheet.addCell(label04);sheet.addCell(label14);sheet.addCell(label24);sheet.addCell(label34);sheet.addCell(label44);
			/*5*/
			Label label05 = new Label(0, 5,"汽车车牌",cellFormat2);
			Label label15 = new Label(1, 5,order.getB_code(),cellFormat2);
			Label label25 = new Label(2, 5,"",cellFormat2);
			Label label35 = new Label(3, 5,"汽车状态",cellFormat2);
			Label label45 = new Label(4, 5,order.getO_state(),cellFormat2);
			sheet.addCell(label05);sheet.addCell(label15);sheet.addCell(label25);sheet.addCell(label35);sheet.addCell(label45);
			/*6*/
			Label label06 = new Label(0, 6,"汽车类型",cellFormat2);
			Label label16 = new Label(1, 6,order.getType().getT_type(),cellFormat2);
			Label label26 = new Label(2, 6,"",cellFormat2);
			Label label36 = new Label(3, 6,"变速品牌",cellFormat2);
			Label label46 = new Label(4, 6,order.getBiaozhi().getB_name(),cellFormat2);
			sheet.addCell(label06);sheet.addCell(label16);sheet.addCell(label26);sheet.addCell(label36);sheet.addCell(label46);
			/*7*/
			Label label07 = new Label(0, 7,"日租价",cellFormat2);
			Label label17 = new Label(1, 7,order.getB_price()+"",cellFormat2);
			Label label27 = new Label(2, 7,"",cellFormat2);
			Label label37 = new Label(3, 7,"总天数",cellFormat2);
			Label label47 = new Label(4, 7,order.getDays()+"",cellFormat2);
			sheet.addCell(label07);sheet.addCell(label17);sheet.addCell(label27);sheet.addCell(label37);sheet.addCell(label47);
			/*8*/
			Label label08 = new Label(0, 8,"身份证号",cellFormat2);
			Label label18 = new Label(1, 8,order.getU_card(),cellFormat2);
			Label label28 = new Label(2, 8,"",cellFormat2);
			Label label38 = new Label(3, 8,"驾驶证号",cellFormat2);
			Label label48 = new Label(4, 8,order.getU_jscard(),cellFormat2);
			sheet.addCell(label08);sheet.addCell(label18);sheet.addCell(label28);sheet.addCell(label38);sheet.addCell(label48);
			
			workbook.write();
			workbook.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}
	
}
