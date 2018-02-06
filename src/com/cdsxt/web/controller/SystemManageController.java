package com.cdsxt.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import java.util.Properties;

@Controller
@RequestMapping("system")
public class SystemManageController {
	
	
	@RequestMapping("")
	public String system() {
		return "welcome";
	}

	@RequestMapping("company")
	public String company(){
		return "company/company";
	}

	@RequestMapping("forgetP")
	public String forgetPwd(){
		return "forgetPwd";
	}

	@RequestMapping("getEmailCode")
	@ResponseBody
	public String getEmailCode(@RequestParam("email") String email, HttpServletRequest request){

		//生成验证码
		StringBuilder sb = new StringBuilder();

		Character[] characters = new Character[]{1,2,3,4,5,6,7,8,9,0};

		for(int i=0;i<6;i++){
			sb.append(characters[(int)Math.random()*characters.length]);
		}

		String to = email;

		String from = "1195453895@qq.com";

		String host = "smtp.qq.com";

		Properties properties = System.getProperties();

		properties.setProperty("mail.smtp.host", host);

		Session session = Session.getDefaultInstance(properties);

		try{
			// 创建默认的 MimeMessage 对象
			MimeMessage message = new MimeMessage(session);

			// Set From: 头部头字段
			message.setFrom(new InternetAddress(from));

			// Set To: 头部头字段
			message.addRecipient(Message.RecipientType.TO,
					new InternetAddress(to));

			// Set Subject: 头部头字段
			message.setSubject("验证码：");

			// 设置消息体
			message.setText(sb.toString());

			// 发送消息
			Transport.send(message);
			System.out.println("Sent message successfully....");
		}catch (MessagingException mex) {
			mex.printStackTrace();
		}

		System.out.println(sb.toString());
		request.getServletContext().setAttribute("emailCode",sb.toString());

		return "success";
	}
}
