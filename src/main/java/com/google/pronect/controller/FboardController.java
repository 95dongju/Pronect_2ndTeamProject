package com.google.pronect.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.pronect.service.FboardService;
import com.google.pronect.service.FcommentService;
import com.google.pronect.service.FlikeService;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Fboard;
import com.google.pronect.vo.Flike;

@Controller
@RequestMapping("fboard")
public class FboardController {
	@Autowired
	private FboardService fboardService;
	@Autowired
	private FcommentService fcommentService;
	@Autowired
	private FlikeService flikeService;
	
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
	public String write(Fboard fboard, Model model, 
			MultipartHttpServletRequest mRequest, HttpServletRequest request) {
		model.addAttribute("writeResult", fboardService.writeFboard(fboard, mRequest, request));
		return "forward:list.do";
	}
	@RequestMapping(value = "content", method = {RequestMethod.GET, RequestMethod.POST})
	public String content(int fid, Model model, String commentPageNum) {
		model.addAttribute("fDto", fboardService.contentFboard(fid));
		model.addAttribute("fcommentList", fcommentService.fcommentList(fid, commentPageNum, model));
		Flike flike = new Flike();
		model.addAttribute("like", flikeService.findLike(flike));
		model.addAttribute("getLike", flikeService.getLike(flike));
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
		model.addAttribute("commentPreDeleteResult", fcommentService.fcommentDeleteForFboardDelete(fid));
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
	@RequestMapping(value = "likeUp", method = RequestMethod.GET)
	public void likeUp(Flike flike) {
		flikeService.likeUp(flike);
	}
	@RequestMapping(value = "likeDown", method = RequestMethod.GET)
	public void likeDown(Flike flike) {
		flikeService.likeDown(flike);
	}
}
