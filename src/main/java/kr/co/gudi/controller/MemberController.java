package kr.co.gudi.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gudi.service.MemberService;

@Controller
public class MemberController {

	Logger logger = LoggerFactory.getLogger(getClass());

	private final MemberService memberService;
	
	// 생성자 주입 활용.
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	@GetMapping(value="/")
	public String main() {
		return "test";
	}
	@GetMapping(value="/{page}.go")
	public String pageMove(@PathVariable String page) {
		return page;
	}
	@GetMapping(value="/{root}/{page}.go")
	public String pageMove(@PathVariable String root, @PathVariable String page) {
		return root+"/"+page;
	}
	@GetMapping(value="/{root}/{sub}/{page}.go")
	public String pageMove(@PathVariable String root, @PathVariable String sub, @PathVariable String page) {
		return root+"/"+sub+"/"+page;
	}
	@RequestMapping(value = "/login.go")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/login.do")
	public String memberLogin(Model model, HttpSession session, String id, String pw) {
		String page = "";
		if(memberService.login(id, pw)) {
			session.setAttribute("loginId", id);
			page = "redirect:/test.go";
		}else {
			page = "redirect:/login.go";
		}
		return page;
	}
	
	@RequestMapping(value = "/resetPassword.do")
	@ResponseBody
	public String resetPassword(@RequestParam String id, @RequestParam String email) {
	    logger.info("비밀번호 초기화 요청: id={}, email={}", id, email);

	    try {
	        return memberService.resetPassword(id, email);
	    } catch (Exception e) {
	        logger.error("비밀번호 초기화 실패: ", e);
	        return "비밀번호 초기화에 실패했습니다.";
	    }
	}
}
