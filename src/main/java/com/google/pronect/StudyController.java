package com.google.pronect;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.pronect.service.StudyService;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Study;

@Controller
@RequestMapping(value="study")
public class StudyController {
	@Autowired
	private StudyService studyService;
	@RequestMapping(value="list", method= {RequestMethod.GET, RequestMethod.POST})
	public String list(String pageNum, Model model, HttpSession session) {
		String mid = (String) session.getAttribute("mid");
		mid = "test1-1"; // 합칠때 mid로 바꿀것
		model.addAttribute("studyGroupLeader",studyService.studyGroupLeader(mid));
		model.addAttribute("studyList",studyService.studyList(pageNum));
		model.addAttribute("paging",new Paging(studyService.studyTotCnt(),pageNum));
		return "studyGroup/studyList";
	}
	@RequestMapping(value="register", method=RequestMethod.GET)
	public String register(){
		return "studyGroup/studyRegister";
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String register(Study study, Model model, HttpServletRequest request, HttpSession session, String[] slanguage){
		String mid = (String) session.getAttribute("mid");
		study.setMid("test1-1"); // 합칠때 mid로 바꿀것
		study.setSlanguage1("");
		study.setSlanguage2("");
		study.setSlanguage3("");
	    if (slanguage != null) {
	        for (int i = 0; i < slanguage.length; i++) {
	            if (i == 0) {
	                study.setSlanguage1(slanguage[i]);
	            } else if (i == 1) {
	                study.setSlanguage2(slanguage[i]);
	            } else if (i == 2) {
	                study.setSlanguage3(slanguage[i]);
	            }
	        }
	    }
	    model.addAttribute("studyRegisterResult",studyService.registerGroup(study));
		return "forward:list.do";
	}
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detail(int sid, Model model, String pageNum){
		model.addAttribute("studyDetail",studyService.getStudyDetail(sid));
		model.addAttribute("pageNum",pageNum);
		return "studyGroup/studyDetail";
	}
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String modify(int sid, Model model){
		model.addAttribute("studyDetail",studyService.getAfterModifyView(sid));
		return "studyGroup/studyModify";
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modify_post(Study study, Model model, String[] slanguage){
		System.out.println(slanguage+"11111111");
		study.setSlanguage1("");
		study.setSlanguage2("");
		study.setSlanguage3("");
	    if (slanguage != null) {
	        for (int i = 0; i < slanguage.length; i++) {
	            if (i == 0) {
	                study.setSlanguage1(slanguage[i]);
	            } else if (i == 1) {
	                study.setSlanguage2(slanguage[i]);
	            } else if (i == 2) {
	                study.setSlanguage3(slanguage[i]);
	            }
	        }
	    }
	    
		model.addAttribute("studyModifyResult",studyService.modifyStudy(study));
		return "forward:list.do";
	}
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int sid, Model model){
		studyService.deleteHistory(sid);
		model.addAttribute("studyDeleteResult",studyService.deleteStudy(sid));
		return "forward:list.do";
	}
//	@RequestMapping(value="", method=RequestMethod.)
//	public String (){
//		return "";
//	}
//	@RequestMapping(value="", method=RequestMethod.)
//	public String (){
//		return "";
//	}
}
