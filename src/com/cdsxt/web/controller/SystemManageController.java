package com.cdsxt.web.controller;

import com.cdsxt.service.UserService;
import com.cdsxt.util.Authorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import java.util.Properties;

@Controller
@RequestMapping("system")
public class SystemManageController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("")
	public String system() {
		return "welcome";
	}

	@Authorize("SYS_COMPANY_QUERY")
	@RequestMapping("company")
	public String company(){
		return "company/company";
	}

	@Authorize("SYS_RESOURCE_QUERY")
	@RequestMapping("resource")
	public String resource(){
		return "resource/resource";
	}

	@RequestMapping("forgetP")
	public String forgetPwd(){
		return "forgetPwd";
	}

	@RequestMapping("getEmailCode")
	@ResponseBody
	public String getEmailCode(@RequestParam("email") String email, HttpServletRequest request){

		//先验证邮箱是否存在
		boolean isValidEmail = this.userService.valiEmail(email);
		if(!isValidEmail){
			return "不告诉你这个邮箱不在数据库中！";
		}

		//生成验证码
		StringBuilder sb = new StringBuilder();

		String[] strs = new String[] {"1","2","3","4","5","6","7","8","9","0","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};

		for(int i=0;i<6;i++){
			sb.append(strs[(int)(Math.random()*strs.length)]);
		}
		
		//System.out.println(sb);
		
		request.getServletContext().setAttribute("emailCode", sb.toString());
		request.getServletContext().setAttribute("valiEmail", email);
		
		Properties properties = new Properties();
		properties.setProperty("mail.debug","true");
		properties.setProperty("mail.host","smtp.qq.com");
		properties.setProperty("mail.transport.protocol","smtp");
		properties.setProperty("mail.smtp.auth","true");
		properties.setProperty("mail.smtp.ssl.enable", "true");

		Session session = Session.getInstance(properties);

		Transport transport = null;

		try {
			transport = session.getTransport();
			transport.connect("smtp.qq.com","1327994105@qq.com","huslewtyzlboijdf");

			MimeMessage mimeMessage = new MimeMessage(session);

			mimeMessage.setFrom(new InternetAddress("1327994105@qq.com"));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email)); // 邮件的收件人
//			mimeMessage.setRecipient(Message.RecipientType.CC, new InternetAddress(MAIL_CC)); // 邮件的抄送人
//			mimeMessage.setRecipient(Message.RecipientType.BCC, new InternetAddress(MAIL_BCC)); // 邮件的密送人

			mimeMessage.setSubject("SystemManager-ADMIN");
			mimeMessage.setText("密码重置验证码："+sb.toString());

			transport.sendMessage(mimeMessage,mimeMessage.getAllRecipients());
			transport.close();
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		return "success";
	}
}
