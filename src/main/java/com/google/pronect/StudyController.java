package com.google.pronect;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.pronect.service.StudyService;
import com.google.pronect.util.Paging;

@Controller
@RequestMapping(value="study")
public class StudyController {
	@Autowired
	private StudyService studyService;
	@RequestMapping(value="list.do", method=RequestMethod.GET)
	public String list(String pageNum, Model model) {
		model.addAttribute("studyList",studyService.studyList(pageNum));
		model.addAttribute("paging",new Paging(studyService.studyTotCnt(),pageNum));
		return "studyGroup/list";
	}
//	@RequestMapping(value="" method=RequestMeth.)
//	public String (){
//		return "";
//	}
//	@RequestMapping(value="" method=RequestMeth.)
//	public String (){
//		return "";
//	}
//	@RequestMapping(value="" method=RequestMeth.)
//	public String (){
//		return "";
//	}
//	@RequestMapping(value="" method=RequestMeth.)
//	public String (){
//		return "";
//	}
//	@RequestMapping(value="" method=RequestMeth.)
//	public String (){
//		return "";
//	}
//	@RequestMapping(value="" method=RequestMeth.)
//	public String (){
//		return "";
//	}
//	@RequestMapping(value="" method=RequestMeth.)
//	public String (){
//		return "";
//	}
//	@RequestMapping(value="" method=RequestMeth.)
//	public String (){
//		return "";
//	}
//	@RequestMapping(value="" method=RequestMeth.)
//	public String (){
//		return "";
//	}
//	@RequestMapping(value="" method=RequestMeth.)
//	public String (){
//		return "";
//	}
}
