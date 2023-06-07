package com.spring.boot.config;

import jakarta.servlet.DispatcherType;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.session.HttpSessionEventPublisher;

import com.spring.boot.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;


@Configuration
@EnableMethodSecurity
@Slf4j
public class SpringSecurityConfig {

    @Autowired
    MemberService memberService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    private static final String[] PERMIT_URL_ARRAY = {
        /* swagger v2 */
        // "/v2/api-docs",
        // "/swagger-resources",
        // "/swagger-resources/**",
        // "/configuration/ui",
        // "/configuration/security",
        // "/swagger-ui.html",
        // "/webjars/**",
        /* swagger v3 */
        "/v3/api-docs/**",
        "/swagger-ui/**"
    };
    private static final String[] AJAX_URL_ARRAY = {
        "/viewsallselectajax", "/infojoinselectajax" , "/checkUserajax"
    };

    private static final String[] CONTROLLER_URL_ARRAY = {
        "/join", "/joininsert" , "/login" ,"/view" ,"/viewdetail" ,"/main"
    };

    private static final String[] INCLUDE_URL_ARRAY = {
        "/header"
    };

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf().disable().cors().disable(); //csrf 와 cors 보호를 해제한다.
          // 인증 거부 관련 처리
        http.exceptionHandling().accessDeniedHandler(accessDeniedHandler());
      
            http.authorizeHttpRequests(request -> request //권한 및 역할 기반의 경로에 대한 액세스 규칙을 정의하는 데 사용되는 것으로, HttpSecurity 구성 클래스에서 사용됩니다.
                        //이 메서드는 표현식을 사용해 요청 경로 접근 규칙을 정의할 수 있는 Customizer<AuthorizeHttpRequestsConfigurer> 타입의 Consumer를 매개변수로 받습니다.        
                        .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll() 
                        .dispatcherTypeMatchers(DispatcherType.INCLUDE).permitAll() 
                        .requestMatchers(INCLUDE_URL_ARRAY).permitAll()
                        .requestMatchers("/status", "/images/**","/status", "/css/**","/status","/js/**").permitAll() //: URL 패턴 지정을 통해 인증 없이 접근을 허용합니다.
                        .requestMatchers(CONTROLLER_URL_ARRAY).permitAll()
                        .requestMatchers(AJAX_URL_ARRAY).permitAll() //ajax 사용 한 url 설정
                        .requestMatchers("/upload/**").permitAll()
                        .requestMatchers("/denied").permitAll()
                        .requestMatchers(PERMIT_URL_ARRAY).hasAnyRole("ADMIN")
            
           
                        .anyRequest().authenticated()  //나머지 요청은 인증이 필요합니다.
                )
                .sessionManagement(session -> session  //중복로그인 방지
                        
                        .maximumSessions(1)
                        .maxSessionsPreventsLogin(false)
                        .expiredUrl("/login")
                        .sessionRegistry(sessionRegistry())    
                )
                .formLogin(login -> login
                        .loginPage("/main")
                        .loginProcessingUrl("/login-process")
                        .usernameParameter("id")
                        .passwordParameter("pw")
                        .successHandler((request, response, authentication) ->{

                            String prevPage = (String) request.getSession().getAttribute("prevPage");
                            String referer = request.getHeader("Referer");  
                            String referer2 = request.getHeader("/join");  
                       //     log.info(""+ prevPage +"이전값 확인");
                          //   log.info(""+ referer +"리페어값 확인");
                         //   log.info(""+ referer2 +"리페어값2 확인");
                            if(prevPage.equals(referer)) //만약 이전페이지 리페어값이 로그인일시 메인으로 가라
                            {
                                response.sendRedirect("/main");
                            }else if(prevPage.equals("/join"))
                            {
                                response.sendRedirect(prevPage);
                            }
                            else
                            {
                                response.sendRedirect(prevPage);
                            }
                            
                        })
                       .failureUrl("/login")
                    //.defaultSuccessUrl("/view", true).permitAll() //로그인 페이지는 인증 없이 접근이 가능합니다.
                )
                .logout( logout ->
                    {
                        logout
                        .logoutUrl("/logout")
                        .addLogoutHandler((request, response, authentication) -> { 
                            // 사실 굳이 내가 세션 무효화하지 않아도 됨. 
                            // LogoutFilter가 내부적으로 해줌.
                            HttpSession session = request.getSession();
                            if (session != null) {
                                session.invalidate();
                            }
                        })  // 로그아웃 핸들러 추가
                        .logoutSuccessHandler((request, response, authentication) -> {
                            response.sendRedirect(request.getHeader("Referer"));
                        }) // 로그아웃 성공 핸들러
                        .deleteCookies("JSESSIONID"); // 로그아웃 후 삭제할 쿠키 지정
                        
                        //.logoutSuccessUrl("/view").permitAll();
                    }
                ) //로그아웃 처리와 관련된 설정을 구성합니다. 기본 로그아웃 설정이 사용됩니다.
                .httpBasic(basic -> basic
                .disable()
                );
         
        return http.getOrBuild(); //HttpSecurity 객체를 리턴합니다.
    }

    @Bean
    public HttpSessionEventPublisher httpSessionEventPublisher() {
        return new HttpSessionEventPublisher();
    }

    @Bean
    public SessionRegistry sessionRegistry() {
        return new SessionRegistryImpl();
    }

    @Bean
    public AccessDeniedHandler accessDeniedHandler() {
    return new UserDeniedHandler();
}
}
