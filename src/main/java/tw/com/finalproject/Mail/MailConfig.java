package tw.com.finalproject.Mail;

import java.util.Properties;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class MailConfig {

	@Bean
	public VelocityEngine velocityEngine() {
		Properties props = new Properties();
		props.setProperty("input.encoding", "UTF-8");
		props.setProperty("output.encoding", "UTF-8");
		props.setProperty("resource.loader", "class");
		props.setProperty("class.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
		VelocityEngine velocityEngine = new VelocityEngine(props);
		return velocityEngine;
	}
}
