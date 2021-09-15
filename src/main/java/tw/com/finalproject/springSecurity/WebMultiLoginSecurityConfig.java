package tw.com.finalproject.springSecurity;

import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.ADMIN;
import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.DELIVER;
import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.MEMBER;
import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.SALES;
import static tw.com.finalproject.yumyu.Enums.ApplicationRoles.SERVICE;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import tw.com.finalproject.springSecurity.AuthProvider.EmployeeCustomAuthenticationProvider;
import tw.com.finalproject.springSecurity.AuthProvider.MemberCustomAuthenticationProvider;
import tw.com.finalproject.springSecurity.Filter.MyAuthenticationFilter;
import tw.com.finalproject.springSecurity.Handler.CustomAuthenticationFailureHandler;
import tw.com.finalproject.springSecurity.Handler.CustomAuthenticationSuccessHandler;
import tw.com.finalproject.springSecurity.Handler.CustomLogoutSuccessHandler;
import tw.com.finalproject.springSecurity.Handler.Http403UnauthorizedEntryPoint;

@Configuration
@EnableWebSecurity
public class WebMultiLoginSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private CustomAuthenticationSuccessHandler customAuthenticationSuccessHandler;

	@Autowired
	private CustomAuthenticationFailureHandler customAuthenticationFailureHandler;

	@Autowired
	private EmployeeCustomAuthenticationProvider employeeCustomAuthenticationProvider;

	@Autowired
	private MemberCustomAuthenticationProvider memberCustomAuthenticationProvider;
	
	@Autowired
	private Http403UnauthorizedEntryPoint http403UnauthorizedEntryPoint;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.addFilterBefore(myAuthenticationFilter(), UsernamePasswordAuthenticationFilter.class)
			.csrf().disable()
			.authorizeRequests()
				.antMatchers("/css/**", "/", "/login", "/login_inner", "/register", "/images/**", "/js/**").permitAll()
				.antMatchers("/account/**", "/product/cart")
					.hasAuthority(MEMBER.name())
				.antMatchers("/inner/**")
					.hasAnyAuthority(ADMIN.name(), SALES.name(), DELIVER.name(), SERVICE.name())
				.and().logout()
					.logoutSuccessHandler(new CustomLogoutSuccessHandler()).invalidateHttpSession(true)
				.and().exceptionHandling()
					.authenticationEntryPoint(http403UnauthorizedEntryPoint)
				;

	}

	private MyAuthenticationFilter myAuthenticationFilter() throws Exception {
		MyAuthenticationFilter authenticationFilter = new MyAuthenticationFilter();

		authenticationFilter.setAuthenticationSuccessHandler(customAuthenticationSuccessHandler);
		authenticationFilter.setAuthenticationFailureHandler(customAuthenticationFailureHandler);
		authenticationFilter.setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher("/login", "POST"));
		authenticationFilter.setAuthenticationManager(authenticationManagerBean());

		return authenticationFilter;
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(employeeCustomAuthenticationProvider);
		auth.authenticationProvider(memberCustomAuthenticationProvider);
	}

	@Bean
	@Override
	protected AuthenticationManager authenticationManager() throws Exception {
		return super.authenticationManager();
	}


}
