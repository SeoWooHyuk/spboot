package com.spring.boot.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.spring.boot.service.InfoService;
import com.spring.boot.vo.Information;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class InfoController {

    @Autowired
    InfoService infoService; 


    @GetMapping("/main")
    public String index()
    {
        return "index";
    }

    @GetMapping("/header")
    public String header()
    {
        return "header";
    }

    @GetMapping("/login")
    public String login( HttpServletRequest request)
    {
      /* 로그인 성공 시 이전 페이지로 이동 */
		String uri = request.getHeader("Referer");
        log.info(""+ uri +"컨트롤러 확인");
		// 이전 uri가 null이다 -> 배포 서버에서 나타나는 오류?
		if (uri==null) {
			// null일시 이전 페이지에서 addFlashAttribute로 보내준 uri을 저장
			Map<String, ?> paramMap = RequestContextUtils.getInputFlashMap(request);
			uri = (String) paramMap.get("referer");
			
			// 이전 url 정보 담기
			request.getSession().setAttribute("prevPage", uri);

		}else {
			// 이전 url 정보 담기
			request.getSession().setAttribute("prevPage", uri);
		}	
        return "login";
    }

 
    @GetMapping("/join")
    public String join()
    {
        return "join";
    }

    @PostMapping("/joininsert")
    public ResponseEntity<String> joininsert(@RequestBody Information info) 
    {
        try {

            int intI = infoService.joininsert(info);
           //throw new RuntimeException("강제 예외 발생");
            return ResponseEntity.ok("join success");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
        // return ResponseEntity.ok("join success"); : 회원가입이 성공적으로 완료되면, 
        // HTTP 상태코드 200(OK)와 메시지 "join success"를 함께 응답합니다.
        //  이는 클라이언트가 회원가입이 성공적으로 이루어졌음을 알리는 응답입니다.

    }
}

