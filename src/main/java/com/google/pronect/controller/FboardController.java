package com.google.pronect.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.pronect.service.FboardService;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Fboard;

@Controller
@RequestMapping("fboard")
public class FboardController {
	@Autowired
	private FboardService fboardService;
	
	@RequestMapping(value = "list", method = {RequestMethod.GET, RequestMethod.POST})
	public String list(Fboard fboard, Model model, String pageNum) {
		model.addAttribute("fboardList", fboardService.fboardList(fboard, pageNum));
		model.addAttribute("paging", new Paging(fboardService.totCntFboard(fboard), pageNum));
		return "fboard/list";
	}
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write() {
		return "fboard/write";
	}
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(@ModelAttribute("fDto") Fboard fboard, Model model, 
			MultipartHttpServletRequest mRequest) {
		model.addAttribute("writeResult", fboardService.writeFboard(fboard, mRequest));
		return "fboard/write";
	}
	@RequestMapping(value = "content", method = {RequestMethod.GET, RequestMethod.POST})
	public String content(int fid, Model model) {
		model.addAttribute("fDto", fboardService.contentFboard(fid));
		//TODO 여기에 댓글 로직 추가
		return "fboard/content";
	}
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modify(int fid, Model model) {
		model.addAttribute("fDto", fboardService.fboardModifyReplyView(fid));
		return "fboard/modify";
	}
	@RequestMapping(value="modify", method = RequestMethod.POST)
	public String modify(@ModelAttribute("fDto") Fboard fboard, Model model, 
			MultipartHttpServletRequest mRequest) {
		model.addAttribute("modifyResult", fboardService.modifyFboard(fboard, mRequest));
		return "forward:content.do";
	}
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String delete(int fid, Model model) {
		model.addAttribute("deleteResult", fboardService.deleteFboard(fid));
		return "forward:list.do";
	}
	@RequestMapping(value="reply", method = RequestMethod.GET)
	public String reply(int fid, Model model) {
		model.addAttribute("fDto",fboardService.fboardModifyReplyView(fid));
		return "fboard/reply";
	}
	@RequestMapping(value="reply", method = RequestMethod.POST)
	public String reply(@ModelAttribute("fDto") Fboard fboard, Model model, 
			MultipartHttpServletRequest mRequest) {
		model.addAttribute("replyResult", fboardService.replyFboard(fboard, mRequest));
		return "forward:list.do";
	}
}
