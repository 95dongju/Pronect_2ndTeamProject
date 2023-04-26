package com.google.pronect.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.pronect.service.SCommentService;
import com.google.pronect.service.StudyService;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Member;
import com.google.pronect.vo.Study;

@Controller
@RequestMapping(value="study")
public class StudyController {
	@Autowired
	private StudyService studyService;
	@Autowired
	private SCommentService sCommentService;
	@RequestMapping(value="list", method= {RequestMethod.GET, RequestMethod.POST})
	public String list(String pageNum, Model model, HttpSession session) {
		// �꽭�뀡 媛앹껜�뿉�꽌 "member" �냽�꽦�쓽 媛믪쓣 媛��졇�삤湲�
		Object memberObj = session.getAttribute("member");
		String mid="";
		// 媛��졇�삩 媛믪쓣 �썝�븯�뒗 �뜲�씠�꽣 ���엯�쑝濡� �삎蹂��솚
		if (memberObj != null && memberObj instanceof Member) {
		    Member member = (Member) memberObj;
		    mid = member.getMid(); // Member �겢�옒�뒪�뿉�꽌 id �븘�뱶�뿉 �빐�떦�븯�뒗 getter 硫붿꽌�뱶瑜� �궗�슜�븯�뿬 id 媛믪쓣 媛��졇�샂
		    // id 媛� �궗�슜
		}
		model.addAttribute("studyGroupLeader",studyService.studyGroupLeader(mid));
		model.addAttribute("studyList",studyService.studyList(pageNum));
		model.addAttribute("paging",new Paging(studyService.studyTotCnt(),pageNum));
		return "main/main";
	}
	@RequestMapping(value="register", method=RequestMethod.GET)
	public String register(){
		return "studyGroup/studyRegister";
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String register(Study study, Model model, HttpServletRequest request, HttpSession session, String[] slanguage){
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
	public String detail(Study study, Model model, String pageNum, HttpSession session){
		// �꽭�뀡 媛앹껜�뿉�꽌 "member" �냽�꽦�쓽 媛믪쓣 媛��졇�삤湲�
		Object memberObj = session.getAttribute("member");
		String mid="";
		// 媛��졇�삩 媛믪쓣 �썝�븯�뒗 �뜲�씠�꽣 ���엯�쑝濡� �삎蹂��솚
		if (memberObj != null && memberObj instanceof Member) {
		    Member member = (Member) memberObj;
		    mid = member.getMid(); // Member �겢�옒�뒪�뿉�꽌 id �븘�뱶�뿉 �빐�떦�븯�뒗 getter 硫붿꽌�뱶瑜� �궗�슜�븯�뿬 id 媛믪쓣 媛��졇�샂
		    study.setMid(mid);
		    model.addAttribute("joincheck", studyService.joinCheck(study));
		    // id 媛� �궗�슜
		}
		model.addAttribute("studyDetail",studyService.getStudyDetail(study.getSid()));
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("studyComment",sCommentService.commentContent(study.getSid()));
		return "studyGroup/studyDetail";
	}
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String modify(int sid, Model model){
		model.addAttribute("studyDetail",studyService.getAfterModifyView(sid));
		return "studyGroup/studyModify";
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modify_post(Study study, Model model, String[] slanguage){
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
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String join(int sid, String mid, String pageNum, Model model){
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("joinResult", studyService.joinStudy(sid, mid));
		return "forward:detail.do";
	}
	@RequestMapping(value="unJoin", method=RequestMethod.GET)
	public String unJoin(int sid, String mid, String pageNum, Model model){
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("unJoinResult", studyService.unJoinStudy(sid, mid));
		return "forward:detail.do";
	}
}
