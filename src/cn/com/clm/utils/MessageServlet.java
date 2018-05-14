package cn.com.clm.utils;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/getSmscodeServlet")
public class MessageServlet extends HttpServlet{

	private static String operation = "/industrySMS/sendSMS";

	private static String accountSid = Config.ACCOUNT_SID;
	private static String to;
	private static String smsContent = "【夜夜科技】您的验证码为1321，请于2分钟内正确输入，如非本人操作，请忽略此短信。";

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	to = request.getParameter("u_phone");
        execute();
    }
    
    /**
	 * 验证码通知短信
	 */
	public void execute()
	{
		String tmpSmsContent = null;
	    try{
	      tmpSmsContent = URLEncoder.encode(smsContent, "UTF-8");
	    }catch(Exception e){
	      
	    }
	    String url = Config.BASE_URL + operation;
	    String body = "accountSid=" + accountSid + "&to=" + to + "&smsContent=" + tmpSmsContent
	        + HttpUtil.createCommonParam();

	    // 提交请求
	    String result = HttpUtil.post(url, body);
	    System.out.println("result:" + System.lineSeparator() + result);
	}
}
