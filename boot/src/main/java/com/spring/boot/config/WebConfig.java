package com.spring.boot.config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configurable //설정파일을 만들기 위한 애노테이션 or Bean을 등록하기 위한 애노테이션이다.
public class WebConfig implements WebMvcConfigurer{


    @Value("${resource.path}")  //propertis 파일의 설정을 읽어온다.
	private String resourcePath;
	
	@Value("${upload.path}")
	private String uploadPath;


    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) { //정적리소스를 관리하는  메서드

        registry.addResourceHandler(uploadPath).addResourceLocations(resourcePath);
        //addResourceLocations 메서드를 이용하여 실제 파일이 있는 경로를 지정해 준다.
        
    
    }
 
    
}
