package com.spring.boot.controller;

import java.io.Console;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;
import com.spring.boot.config.AdminAuthorize;
import com.spring.boot.config.UserAuthorize;
import com.spring.boot.service.InfoService;
import com.spring.boot.vo.InfoMember;
import com.spring.boot.vo.Information;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import com.spring.boot.service.MemberService;


@Controller
@Slf4j
public class InfoController {

    @Autowired
    InfoService infoService; 

    @Autowired
    MemberService memberService;


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
    public String login(HttpServletRequest request)
    {
      /* 로그인 성공 시 이전 페이지로 이동 */
		String uri = request.getHeader("Referer");
       // log.info(""+ uri +"컨트롤러 확인");
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


    @GetMapping("/loginsession")
    @ResponseBody
    public String loginse(HttpServletRequest request) 
    {
        log.info("읽는건가");
        SecurityContext securityContext = (SecurityContext) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
            if (securityContext != null && securityContext.getAuthentication() != null) {
            // 로그인 중인 사용자 정보가 존재하는 경우, "valid_session" 문자열 반환
            return "invalid_session";
        } else {
            // 로그인 중인 사용자 정보가 존재하지 않는 경우, "invalid_session" 문자열 반환
            return "valid_session";
  }
    }
    


    @RequestMapping(value = "/join", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView infojoinselect()
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("join");
        return mv;
    }

     //아이디 중복 확인 ajax비동기 통신전달
	@RequestMapping(value = "/infojoinselectajax", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView infojoinselectajax(@ModelAttribute("check") String id, @RequestBody String id2)  {

        
        String idcheck = id2.replace("\"", ""); // "" 제거
        Optional<InfoMember> findOne = memberService.findOne(idcheck); //로그인시 셀렉으로 조회

       //log.info(""+ findOne.isPresent() +"파일");

		ModelAndView mv = new ModelAndView();
        mv.addObject("check", findOne.isPresent()); //총게시물
		mv.setViewName("jsonView"); //클라이언트로
		return mv;
	}


    @PostMapping("/joininsert")
    public ResponseEntity<String> joininsert(@RequestBody Information info)  //ResponseEntity란, httpentity를 상속받는, 결과 데이터와 HTTP 상태 코드를 직접 제어할 수 있는 클래스이다.
    //ResponseEntity에는 사용자의  HttpRequest에 대한 응답 데이터가 포함된다.
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


    @GetMapping("/setting/admin")
    @AdminAuthorize
    public String adminSettingPage() {
        return "admin_setting";
    }

    @GetMapping("/setting/user")
    @UserAuthorize
    public String userSettingPage() {
        return "user_setting";
    }
    
}

