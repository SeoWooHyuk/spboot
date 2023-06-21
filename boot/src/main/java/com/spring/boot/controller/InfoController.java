package com.spring.boot.controller;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;
import com.spring.boot.security.AdminAuthorize;
import com.spring.boot.security.UserDetailServiceimpi;
import com.spring.boot.security.UserAuthorize;
import com.spring.boot.service.InfoService;
import com.spring.boot.vo.InfoMember;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import com.spring.boot.service.MemberService;

@Controller
@Slf4j
@Tag(name = "InfoController", description = "로그인 로그아웃 회원관리 + 헤더푸터관리 컨트롤러")
public class InfoController {

    @Autowired
    SessionRegistry sessionRegistry; // bean에 등록된 세션저장소

    @Autowired
    InfoService infoService; 

    @Autowired
    MemberService memberService;

    @Autowired
    UserDetailServiceimpi myUserDetailService;

    @GetMapping("/denied")
    public String denied() //접근한 권한이없는 자가 접근할때 가는 페이지
    {
         //log.info("권한실패후 읽는 지확인");
        return "denied-page";
    }

    @GetMapping("/admin") //관리자 접근 페이지
    public String admin() 
    {
      
        return "admin";
    }


    @Operation(summary = "인덱스 화면", description = "템플릿 화면을 출력합니다.")
    @GetMapping("/main")
    public String index()
    {
        return "index";
    }

    @Operation(summary = "헤더 화면", description = "화면 헤더을 출력합니다.")
    @GetMapping("/header")
    public String header()
    {
        return "header";
    }


    @Operation(summary = "후터 화면", description = "화면 후터을 출력합니다.")
    @GetMapping("/footer")
    public String footer()
    {
        return "footer";
    }

    @GetMapping("/login")
    public String login(HttpServletRequest request , 
    @RequestParam(value = "err", required = false)String err, 
    @RequestParam(value = "exception", required = false)String exception, Model model)
    {
    

        model.addAttribute("err", err);
        model.addAttribute("exception", exception);
      /* 로그인 성공 시 이전 페이지로 이동 */
		String uri = request.getHeader("Referer");
        if (uri != null && uri.contains("?")) { //파라미터가있을때 파라미터를 제거한다.
            uri = uri.substring(0, uri.indexOf("?"));
        }
        log.info(""+ uri +"/uri 확인1");


		if (uri==null  || uri.length() == 0)  {
			// null일시 이전 페이지에서 addFlashAttribute로 보내준 uri을 저장
			Map<String, ?> paramMap = RequestContextUtils.getInputFlashMap(request);
			// uri = (String) paramMap.get("referer"); aws 배포환경에서는 보안때문 null발생시킬수있어
            uri = request.getHeader("Origin");
			log.info(""+ uri +"uri 확인2");
			// 이전 url 정보 담기
			request.getSession().setAttribute("prevPage", uri);

		}else {
			// 이전 url 정보 담기
			request.getSession().setAttribute("prevPage", uri);
		}	
        return "login";
    }

    @GetMapping(value ="/checkUserajax")
    @ResponseBody
    @Operation(summary = "로그인 중복확인 처리", description = "로그인 중복확인 후 alter로 경고.")
    public boolean checkUserajax(@RequestParam(name = "id") String userid) {
        log.info(userid+ "체크유저 아이디 들어오는 거확인");
        if(userid != null) 
        {
            //TODO session 확인하는 함수 구현
            UserDetails userDetails = myUserDetailService.loadUserByUsername(userid);
            List<SessionInformation> allSessions  = sessionRegistry.getAllSessions(userDetails,false); 
                //로그인된 객체가 존재하면 allSessions List의 길이가 1을 넘을 것이다.
            if(allSessions.size() > 0)
            {
                return true; // user 존재
            }
            else{
                return false; // user 존재 x 
            }
        }
        else 
        {
            return false;
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
    public ResponseEntity<String> joininsert(@RequestBody InfoMember info)  //ResponseEntity란, httpentity를 상속받는, 결과 데이터와 HTTP 상태 코드를 직접 제어할 수 있는 클래스이다.
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

