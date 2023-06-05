package com.spring.boot.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configurable //보통 Spring AOP를 사용할 때 @Configurable을 이용하여 객체를 생성하고 의존 관계를 주입하고, 
@Configuration // Bean 설정 정보를 담은 클래스를 정의할 때 사용합니다.
public class WebConfig implements WebMvcConfigurer{


    @Value("${resource.path}")  //propertis 파일의 설정을 읽어온다.
	private String resourcePath;
	
	@Value("${upload.path}")
	private String uploadPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) { //정적리소스를 관리하는  메서드

        registry.addResourceHandler(uploadPath).addResourceLocations(resourcePath); //uploadPath로 요청이 들어오면 resourcePath에서 찾겠다는 의미
        //addResourceLocations 메서드를 이용하여 실제 파일이 있는 경로를 지정해 준다.
        
    
    }   

    
}
