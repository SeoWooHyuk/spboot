package com.spring.boot.config;

import jakarta.servlet.DispatcherType;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.server.ui.LogoutPageGeneratingWebFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RegexRequestMatcher;

import com.spring.boot.service.MemberService;

import static org.springframework.security.config.Customizer.withDefaults;

import org.springframework.beans.factory.annotation.Autowired;


@Configuration
@EnableMethodSecurity
public class SpringSecurityConfig {

    @Autowired
    MemberService memberService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf().disable().cors().disable(); //csrf 와 cors 보호를 해제한다.

               http.authorizeHttpRequests(request -> request //권한 및 역할 기반의 경로에 대한 액세스 규칙을 정의하는 데 사용되는 것으로, HttpSecurity 구성 클래스에서 사용됩니다.
                        //이 메서드는 표현식을 사용해 요청 경로 접근 규칙을 정의할 수 있는 Customizer<AuthorizeHttpRequestsConfigurer> 타입의 Consumer를 매개변수로 받습니다.        
                        .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll() 
                        .dispatcherTypeMatchers(DispatcherType.INCLUDE).permitAll() 
                        .requestMatchers("/header").permitAll()
                        .requestMatchers("/status", "/images/**","/status", "/css/**","/status","/js/**",
                         "/join", "/joininsert", "/login").permitAll() //: URL 패턴 지정을 통해 인증 없이 접근을 허용합니다.
                        .requestMatchers("/view").permitAll()
                        .requestMatchers("/viewsallselectajax").permitAll()
                        .anyRequest().authenticated()  //나머지 요청은 인증이 필요합니다.
                )
                .formLogin(login -> login
                        .loginPage("/login")
                        .loginProcessingUrl("/login-process")
                        .usernameParameter("id")
                        .passwordParameter("pw")
                        .defaultSuccessUrl("/", false)
                        .permitAll() //로그인 페이지는 인증 없이 접근이 가능합니다.
                )
                .logout( logout ->
                {
                    logout
                    .logoutUrl("/logout")
                    .logoutSuccessUrl("/view").permitAll();
                }
                ) //로그아웃 처리와 관련된 설정을 구성합니다. 기본 로그아웃 설정이 사용됩니다.

                
                .httpBasic(basic -> basic
                .disable()
                );
         
        return http.getOrBuild(); //HttpSecurity 객체를 리턴합니다.
    }
}
