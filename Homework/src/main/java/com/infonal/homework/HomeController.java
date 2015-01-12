package com.infonal.homework;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.infonal.homework.model.User;
import com.infonal.homework.repository.UserRepository;
import com.infonal.homework.util.Utility;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	 @Autowired
	 private UserRepository repository;
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		List<User> userList = repository.findAll();
		model.addAttribute("users",userList);
		
		return "home";
	}
	
	@RequestMapping(value = "/saveuser.html", method =RequestMethod.POST)
	public String saveUser(Model model,
			@RequestParam(value="firstName",required=true)String firstName,
			@RequestParam(value="lastName",required=true)String lastName,
			@RequestParam(value="username",required=true)String username,
			@RequestParam(value="phone-number",required=true)String phone,
			@RequestParam(value="code",required=true)String code,
			HttpServletRequest request) {
		
		String captchaCode =(String) request.getSession().getAttribute("code");
		String message="";
		String color="";
		String errorType="";
		
		try {
			
		if( !firstName.equalsIgnoreCase("") &&
				!lastName.equalsIgnoreCase("")  &&
				!username.equalsIgnoreCase("")  &&
				!phone.equalsIgnoreCase("")){
			
				if(!captchaCode.equalsIgnoreCase(code)){
					message   = Utility.ERROR_MESSAGE_CODE;
					color     = Utility.COLOR_RED;
					errorType = Utility.CODE_ERROR;
				}
				else {
					User user = new User();
					user.setFirstName(firstName);
					user.setLastName(lastName);
					user.setId(UUID.randomUUID().toString());
					user.setUsername(username);
					user.setPhone(phone);
					repository.save(user);
				
				
					message = Utility.SUCCESS_MESSAGE_SAVE;
					color   = Utility.COLOR_GREEN;
				}
			}
			else {
				message   = Utility.ERROR_MESSAGE_BLANK_FIELD;
				color     = Utility.COLOR_RED;
				errorType = Utility.SAVE_ERROR;
			}
			
			
		}
		catch(Exception ex){
			message   = Utility.ERROR_MESSAGE_SAVE;
			color     = Utility.COLOR_RED;
			errorType = Utility.SAVE_ERROR;
		}
		finally{
			model.addAttribute("message",message);
			model.addAttribute("color",color);
			model.addAttribute("errorType",errorType);
		}
			
		return "insertresult";
	}
	
	
	@RequestMapping(value = "/updateuser.html", method =RequestMethod.POST)
	public String updateUser(Model model,
			@RequestParam(value="firstNameEdit",required=true)String firstName,
			@RequestParam(value="lastNameEdit",required=true)String lastName,
			@RequestParam(value="usernameEdit",required=true)String username,
			@RequestParam(value="phone-numberEdit",required=true)String phone,
			@RequestParam(value="uid",required=true)String id,
			HttpServletRequest request) {
		
		String message="";
		String color="";
		String errorType="";
		
		try {
			
		if( !firstName.equalsIgnoreCase("") &&
				!lastName.equalsIgnoreCase("")  &&
				!username.equalsIgnoreCase("")  &&
				!phone.equalsIgnoreCase("")){
			
					User user = new User();
					user.setFirstName(firstName);
					user.setLastName(lastName);
					user.setId(id);
					user.setUsername(username);
					user.setPhone(phone);
					repository.save(user);
				
				
					message = Utility.SUCCESS_MESSAGE_UPDATE;
					color   = Utility.COLOR_GREEN;
			}
			else {
				message   = Utility.ERROR_MESSAGE_BLANK_FIELD;
				color     = Utility.COLOR_RED;
				errorType = Utility.UPDATE_ERROR;
			}
			
			
		}
		catch(Exception ex){
			message   = Utility.ERROR_MESSAGE_UPDATE;
			color     = Utility.COLOR_RED;
			errorType = Utility.UPDATE_ERROR;
		}
		finally{
			model.addAttribute("message",message);
			model.addAttribute("color",color);
			model.addAttribute("errorType",errorType);
		}
			
		return "updateresult";
	}
	
	
	@RequestMapping(value = "/deleteuser.html", method =RequestMethod.POST)
	public String deleteUser(Model model,
			@RequestParam(value="id",required=true)String id) {
		
		String message="";
		String color="";
		try {
			if(id!=null && !id.equalsIgnoreCase("")){
				repository.delete(repository.findById(id));	
				message = Utility.SUCCESS_MESSAGE_DELETE;
				color =Utility.COLOR_GREEN;
			}
			else{
				message = Utility.ERROR_MESSAGE_DELETE;
				color = Utility.COLOR_RED;
			}
		}
		catch(Exception ex){
			message = Utility.ERROR_MESSAGE_DELETE;
			color = Utility.COLOR_RED;
		}
		finally{
			model.addAttribute("message",message);
			model.addAttribute("color",color);
		}
			
		return "deleteresult";
	}
	
	@RequestMapping(value = "/refreshusers.html", method =RequestMethod.GET)
	public String refreshedUsers(Model model) {
		
		List<User> userList = repository.findAll();
		model.addAttribute("users",userList);
		
		return "refreshedusers";
	}
	
	@RequestMapping(value="/getimage.html",	method = RequestMethod.GET)
	public void getImage(HttpServletResponse response,HttpServletRequest request) throws IOException{
		
		response.setContentType("image/jpg");
	    int iTotalChars = 6;
	    int iHeight = 40;
	    int iWidth = 150;

	    Font fntStyle1 = new Font("Arial", Font.BOLD, 30);
	    Font fntStyle2 = new Font("Verdana", Font.BOLD, 20);

	    Random randChars = new Random();
	    String sImageCode = (Long.toString(Math.abs(randChars.nextLong()), 36)).substring(0, iTotalChars);
	    
	    request.getSession().setAttribute("code", sImageCode);

	    BufferedImage biImage = new BufferedImage(iWidth, iHeight, BufferedImage.TYPE_INT_RGB);
	    Graphics2D g2dImage = (Graphics2D) biImage.getGraphics();
	    
	    int iCircle = 15;
	    
	    g2dImage.setFont(fntStyle2);
	    for (int i = 0; i < iCircle; i++) {
	        g2dImage.setColor(new Color(randChars.nextInt(255), randChars.nextInt(255), randChars.nextInt(255)));
	        int iRadius = (int) (Math.random() * iHeight / 2.0);
	        int iX = (int) (Math.random() * iWidth - iRadius);
	        int iY = (int) (Math.random() * iHeight - iRadius);
	        g2dImage.fillRoundRect(iX, iY, iRadius * 2, iRadius * 2,100,100);
	    }
	    g2dImage.setFont(fntStyle1);
	    for (int i = 0; i < iTotalChars; i++) {
	        g2dImage.setColor(new Color(randChars.nextInt(255), randChars.nextInt(255), randChars.nextInt(255)));
	        if (i % 2 == 0) {
	            g2dImage.drawString(sImageCode.substring(i, i + 1), 25 * i, 24);
	        } else {
	            g2dImage.drawString(sImageCode.substring(i, i + 1), 25 * i, 35);
	        }
	    }

	    OutputStream osImage = response.getOutputStream();
	    ImageIO.write(biImage, "jpeg", osImage);

	    g2dImage.dispose();
	    

	}
	
	@RequestMapping(value = "/refreshcode.html", method =RequestMethod.GET)
	public void refreshedCode(Model model,HttpServletResponse response,HttpServletRequest request) throws IOException {
		
		response.setContentType("image/jpg");
	    int iTotalChars = 6;
	    int iHeight = 40;
	    int iWidth = 150;

	    Font fntStyle1 = new Font("Arial", Font.BOLD, 30);
	    Font fntStyle2 = new Font("Verdana", Font.BOLD, 20);

	    Random randChars = new Random();
	    String sImageCode = (Long.toString(Math.abs(randChars.nextLong()), 36)).substring(0, iTotalChars);
	    
	    request.getSession().setAttribute("code", sImageCode);
	    System.out.println("code:"+sImageCode);
	  
	    
	    BufferedImage biImage = new BufferedImage(iWidth, iHeight, BufferedImage.TYPE_INT_RGB);
	    Graphics2D g2dImage = (Graphics2D) biImage.getGraphics();

	   
	    int iCircle = 15;
	   
	    g2dImage.setFont(fntStyle2);
	    for (int i = 0; i < iCircle; i++) {
	        g2dImage.setColor(new Color(randChars.nextInt(255), randChars.nextInt(255), randChars.nextInt(255)));
	        int iRadius = (int) (Math.random() * iHeight / 2.0);
	        int iX = (int) (Math.random() * iWidth - iRadius);
	        int iY = (int) (Math.random() * iHeight - iRadius);
	        g2dImage.fillRoundRect(iX, iY, iRadius * 2, iRadius * 2,100,100);
	    }
	    g2dImage.setFont(fntStyle1);
	    for (int i = 0; i < iTotalChars; i++) {
	        g2dImage.setColor(new Color(randChars.nextInt(255), randChars.nextInt(255), randChars.nextInt(255)));
	        if (i % 2 == 0) {
	            g2dImage.drawString(sImageCode.substring(i, i + 1), 25 * i, 24);
	        } else {
	            g2dImage.drawString(sImageCode.substring(i, i + 1), 25 * i, 35);
	        }
	    }

	   
	    OutputStream osImage = response.getOutputStream();
	    ImageIO.write(biImage, "jpeg", osImage);
	    

	    
	    g2dImage.dispose();
	    

	}
	
	@RequestMapping(value = "/updateform.html", method =RequestMethod.POST)
	public String updateUserForm(Model model,@RequestParam(value="id",required=true)String id) {
		
	//	if(id!=null && !id.equalsIgnoreCase("")){
			User user = repository.findById(id);
			model.addAttribute("user",user);
		/* }
		else {
			String errorMessage = Utility.ERROR_MESSAGE_EDIT_FORM;
			model.addAttribute("error",errorMessage);
		}
		*/
		return "edituserform";
	}
	
	
	
}
