package com.spring.boot.security;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;



import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class UserDeniedHandler implements AccessDeniedHandler {

    private static final Logger logger = LoggerFactory.getLogger(UserDeniedHandler.class);
    
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
        response.setStatus(HttpStatus.FORBIDDEN.value()); //서버에서 클라이언트로 전송되는 응답 코드를 403 Forbidden으로 설정하여, 클라이언트가 요청한 리소스에 접근할 권한이 없음을 알리는 것입니다.
        
        request.getRequestDispatcher("redirect:/denied").forward(request, response);
        
    }
    
}
