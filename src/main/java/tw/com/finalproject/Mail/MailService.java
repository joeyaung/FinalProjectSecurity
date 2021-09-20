package tw.com.finalproject.Mail;

import java.io.IOException;
import java.io.StringWriter;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import tw.com.finalproject.yumyu.InternalUse.Employee;
import tw.com.finalproject.yumyu.MemberOrder.MemberOrder;

@Service
public class MailService {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private VelocityEngine velocityEngine;
	
//	Send new Employee Email

	public void sendEmployeeRegisterMail(Employee employee, String rawPassword) {
		VelocityContext model = new VelocityContext();
		model.put("empName", employee.getFullName());
		model.put("empUsername", employee.getUsername());
		model.put("rawPassword", rawPassword);
		Resource logoResource = new ClassPathResource("static/images/audi-logo.png");
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
			
			mimeMessageHelper.setSubject("歡迎加入奧迪!");
			mimeMessageHelper.setFrom("carmotorcomp@gmail.com");
			mimeMessageHelper.setTo(employee.getUsername());
			String content = getContentFromTemplateNewEmployee(model);
			mimeMessageHelper.setText(content);
			mimeMessageHelper.addInline("logo", logoResource.getFile());
			mailSender.send(mimeMessageHelper.getMimeMessage());
			System.out.println("New Employee Email Sended!");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	private String getContentFromTemplateNewEmployee(VelocityContext model) {
		StringWriter stringWriter = new StringWriter();

		velocityEngine.mergeTemplate("/templates/newEmployee.vm", "UTF-8", model, stringWriter);
		return stringWriter.toString();

	}

//	Send order status change email.
	public boolean sendOrderStatusChangeMail(String email, MemberOrder order) {
		VelocityContext model = new VelocityContext();
		model.put("orderId", order.getId());
		model.put("memberName", order.getMember().getFullName());
		model.put("orderStatus", order.getStage());
		Resource logoResource = new ClassPathResource("static/images/audi-logo.png");
		Resource iconResource = new ClassPathResource("static/images/order-icon.png");
		MimeMessage mimeMessage = mailSender.createMimeMessage();

		try {
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);

			mimeMessageHelper.setSubject("訂單狀態變更通知");
			mimeMessageHelper.setFrom("carmotorcomp@gmail.com");
			mimeMessageHelper.setTo(email);
			String content = getContentFromTemplateStatusChange(model);
			mimeMessageHelper.setText(content, true);
			mimeMessageHelper.addInline("logo", logoResource.getFile());
			mimeMessageHelper.addInline("icon", iconResource.getFile());

			mailSender.send(mimeMessageHelper.getMimeMessage());
			System.out.println("Change Status Email Sended!");
		} catch (MessagingException | IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;

	}

//	Get template content (Change Status)
	public String getContentFromTemplateStatusChange(VelocityContext model) {
		StringWriter stringWriter = new StringWriter();

		velocityEngine.mergeTemplate("/templates/orderStatusChangeMail.vm", "UTF-8", model, stringWriter);
		return stringWriter.toString();

	}

//	velocity template engine
	public void sendResetPasswordEmail(String recipient, String token, String memberName) {
		VelocityContext model = new VelocityContext();
		model.put("memberName", memberName);
		model.put("token", token);
		Resource logoResource = new ClassPathResource("static/images/audi-logo.png");
		Resource iconResource = new ClassPathResource("static/images/resetpassword-icon.png");
		MimeMessage mimeMessage = mailSender.createMimeMessage();

		try {
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);

			mimeMessageHelper.setSubject("重設密碼驗證信");
			mimeMessageHelper.setFrom("carmotorcomp@gmail.com");
			mimeMessageHelper.setTo(recipient);
			String content = getContentFromTemplate(model);
			mimeMessageHelper.setText(content, true);
			mimeMessageHelper.addInline("logo", logoResource.getFile());
			mimeMessageHelper.addInline("icon", iconResource.getFile());

			mailSender.send(mimeMessageHelper.getMimeMessage());
			System.out.println("Reset Password Email Sended!");
		} catch (MessagingException | IOException e) {
			e.printStackTrace();
		}
	}

//	Get template content
	public String getContentFromTemplate(VelocityContext model) {
		StringWriter stringWriter = new StringWriter();

		velocityEngine.mergeTemplate("/templates/resetPassword.vm", "UTF-8", model, stringWriter);
		return stringWriter.toString();

	}

	// simple text email
	public void prepareAndSend(String recipient, String subject, String message) {
		MimeMessagePreparator messagePreparator = mimeMessage -> {
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
			messageHelper.setFrom("carmotorcomp@gmail.com");
			messageHelper.setTo(recipient);
			messageHelper.setSubject(subject);
			messageHelper.setText(message);
		};
		try {
			mailSender.send(messagePreparator);
		} catch (MailException e) {
			System.out.println(e);
		}
	}

	// HTML email
	public void prepareAndSendHTML(String recipient, String subject, String message) {
		MimeMessagePreparator messagePreparator = mimeMessage -> {
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
			messageHelper.setFrom("carmotorcomp@gmail.com");
			messageHelper.setTo(recipient);
			messageHelper.setSubject(subject);
			messageHelper.setText(message, true);
		};
		try {
			mailSender.send(messagePreparator);
		} catch (MailException e) {
			System.out.println(e);
		}
	}

	// inline pic email
	public void prepareAndSendImg(String recipient, String subject, String message) {
		MimeMessagePreparator messagePreparator = mimeMessage -> {
			// 這邊建構時要加參數 true
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true);
			messageHelper.setFrom("carmotorcomp@gmail.com");
			messageHelper.setTo(recipient);
			messageHelper.setSubject(subject);

			// 以下為 img 專屬。import了springframework...ClassPathResource和Resource
			String messageSuf = "<hr/>Best Regards,<br/>Car Motor Company<br/><br/>"
					+ "<html><body><a href='http://localhost:8080/FinalProject/'><img src='cid:xxxx' width='200'></a></body></html>"
					+ "Email:<a href=\'mailto:carmotorcomp@gmail.com\'>carmotorcomp@gmail.com</a>";
			messageHelper.setText(message + messageSuf, true);
			Resource resource = new ClassPathResource("static/images/audi-logomini.png");
			messageHelper.addInline("xxxx", resource.getFile());
		};
		try {
			mailSender.send(messagePreparator);
		} catch (MailException e) {
			System.out.println(e);
		}
	}

}
