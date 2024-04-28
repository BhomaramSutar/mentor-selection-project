package com.mail;
import java.io.File;
import java.io.IOException;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.swing.JOptionPane;

public class SendMail {
	public static void SendMeeting(String Email,String Url)
	{
		String to=Email;
	    String subject="Shedule Meeting";
	    String msg="This is the join Meeting URL";
	    final String user="projectinfoieee@gmail.com";
		   final String pass="project@123456@";// send mail qrcode
	   Properties props = new Properties();
	   props.put("mail.smtp.host", "smtp.gmail.com");
	   props.put("mail.smtp.port", "587"); //this is optional
	   props.put("mail.smtp.auth", "true");
	   props.put("mail.smtp.starttls.enable", "true");

	   Session session = Session.getInstance(props,new javax.mail.Authenticator() {    
	   @Override
	   protected PasswordAuthentication getPasswordAuthentication() {
	   return new PasswordAuthentication(user,pass);
	  }
	  });
	   
	   try {
	  MimeMessage message = new MimeMessage(session);
	  message.setFrom(new InternetAddress(user));
	  message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
	  message.setSubject(subject);
			message.setText(Url);
	  
	   Transport.send(message);
	       System.out.println("sending");
	       System.out.println("Send successfully");
	       
	       
	    }
	   catch(Exception e) 
	   {
	       System.out.println(e);
	   }	
	}
		public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
