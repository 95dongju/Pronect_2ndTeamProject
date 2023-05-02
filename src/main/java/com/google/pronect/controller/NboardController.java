package com.google.pronect.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.pronect.service.NboardService;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Nboard;

@Controller
@RequestMapping("nboard")
public class NboardController {
	@Autowired
	private NboardService nboardService;
	
	@RequestMapping(value = "list", method = {RequestMethod.GET, RequestMethod.POST})
	public String list(Nboard nboard, Model model, String pageNum) {
		model.addAttribute("nboardList", nboardService.nboardList(nboard, pageNum));
		model.addAttribute("paging", new Paging(nboardService.totCntNboard(nboard), pageNum));
		return "nboard/list";
	}
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write() {
		return "nboard/write";
	}
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(Nboard nboard, Model model, 
			MultipartHttpServletRequest mRequest, HttpServletRequest request) {
		model.addAttribute("writeResult", nboardService.writeNboard(nboard, mRequest, request));
		return "forward:list.do";
	}
	@RequestMapping(value = "content", method = {RequestMethod.GET, RequestMethod.POST})
	public String content(int nid, Model model, String commentPageNum) {
		model.addAttribute("nDto", nboardService.contentNboard(nid));
		//TODO 여기에 댓글 로직 추가
		return "nboard/content";
	}
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modify(int nid, Model model) {
		model.addAttribute("nDto", nboardService.contentNboard(nid));
		return "nboard/modify";
	}
	@RequestMapping(value="modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute("nDto") Nboard nboard, Model model, 
			MultipartHttpServletRequest mRequest) {
		model.addAttribute("modifyResult", nboardService.modifyNboard(nboard, mRequest));
		return "forward:content.do";
	}
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String delete(int nid, Model model) {
		model.addAttribute("deleteResult", nboardService.deleteNboard(nid));
		return "forward:list.do";
	}
}
