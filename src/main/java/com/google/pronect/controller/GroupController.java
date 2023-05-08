package com.google.pronect.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.pronect.service.GCommentService;
import com.google.pronect.service.GroupService;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Achive;
import com.google.pronect.vo.GComment;
import com.google.pronect.vo.Group;

@Controller
@RequestMapping(value="group")
public class GroupController {
	@Autowired
	private GroupService groupService;
	@Autowired
	private GCommentService gCommentService;
	@RequestMapping(value="groupList", method= {RequestMethod.GET, RequestMethod.POST})
	public String goupList(String pageNum, Model model) {
		if(pageNum==null || pageNum=="") {
			pageNum = "1";
		}
		model.addAttribute("list",groupService.groupList(pageNum));
		model.addAttribute("name","group");
		model.addAttribute("paging",new Paging(groupService.groupTotCnt(),pageNum,12,10));
		return "main/main";
	}
	@RequestMapping(value="studyList", method= {RequestMethod.GET, RequestMethod.POST})
	public String studyList(String pageNum, Model model) {
		if(pageNum==null || pageNum=="") {
			pageNum = "1";
		}
		model.addAttribute("list",groupService.studyList(pageNum));
		model.addAttribute("name","study");
		model.addAttribute("paging",new Paging(groupService.studyTotCnt(),pageNum,12,10));
		return "main/main";
	}
	@RequestMapping(value="projectList", method= {RequestMethod.GET, RequestMethod.POST})
	public String projectList(String pageNum, Model model) {
		if(pageNum==null || pageNum=="") {
			pageNum = "1";
		}
		model.addAttribute("list",groupService.projectList(pageNum));
		model.addAttribute("name","project");
		model.addAttribute("paging",new Paging(groupService.projectTotCnt(),pageNum,12,10));
		return "main/main";
	}
	@RequestMapping(value="register", method=RequestMethod.GET)
	public String register(){
		return "group/groupRegister";
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String register(Group group, Model model, String[] glanguage, HttpSession session){
	    model.addAttribute("groupRegisterResult",groupService.registerGroup(group, glanguage, session));
		return "forward:groupList.do?pageNum=1";
	}
	@RequestMapping(value="detail", method= {RequestMethod.GET,RequestMethod.POST})
	public String detail(int gid, String mid, Model model,String pageNum){
		if(pageNum.equals(null)) {
			pageNum = (String) model.getAttribute("pageNum");
		}
		model.addAttribute("groupMember",groupService.groupMember(gid));
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		if(mid != null) {
			int joincheckCnt = groupService.joinCheckCnt(gid, mid);
			model.addAttribute("joincheckCnt", joincheckCnt);
			if(joincheckCnt != 0) {
				model.addAttribute("joincheck", groupService.joinCheck(gid, mid));
			}else if(joincheckCnt>0) {
				model.addAttribute("msg","가입 이력 오류메세지");
			}
		}
		model.addAttribute("groupComment",gCommentService.commentContent(gid));
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("paging",new Paging(groupService.projectTotCnt(),pageNum,12,10));
		model.addAttribute("hitGroup",groupService.hitGroup());
		return "group/groupDetail2";
	}
//		model.addAttribute("joinList",groupService.joinList(gid));
//		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
//		model.addAttribute("groupMember",groupService.groupMember(gid));
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String modify(int gid, Model model){
		model.addAttribute("groupDetail",groupService.getAfterModifyView(gid));
		return "group/groupModify";
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modify_post(Group group, Model model, String[] glanguage){
		model.addAttribute("groupModifyResult",groupService.modifyGroup(group, glanguage));
		return "forward:groupList.do";
	}
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int gid, Model model){
		groupService.deleteHistory(gid);
		model.addAttribute("groupDeleteResult",groupService.deleteGroup(gid));
		return "forward:groupList.do";
	}
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String join(int gid, String mid, String pageNum, Model model,HttpSession session){
		int NOTJOINED = 300;
		model.addAttribute("pageNum", pageNum);
		int result = groupService.joinGroup(gid, mid);
		if(result == NOTJOINED) {
			model.addAttribute("joinResult","신청완료"); // joinResult:신청완료
		}else{
			model.addAttribute("joinResult",result); // joinResult:0,1,2,3 (이미 가입된 상태)  
		}
		return "forward:detail.do";
	}
	@RequestMapping(value="unJoin", method=RequestMethod.GET)
	public String unJoin(int gid, String mid, String pageNum, Model model){
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("unJoinResult", groupService.unJoinGroup(gid, mid));
		return "forward:detail.do";
	}
	
	@RequestMapping(value="accept", method=RequestMethod.GET)
	public String accept(String mid, int gid, String pageNum, Achive achive, Model model){
		model.addAttribute("acceptResult", groupService.acceptGroup(gid, mid, achive));
		model.addAttribute("pageNum",pageNum);
		return "forward:detail.do";
	}
	@RequestMapping(value="memberOut", method=RequestMethod.GET)
	public String memberOut(String mid, int gid, Model model){
		model.addAttribute("outResult", groupService.memberOut(gid, mid));
		return "forward:detail.do";
	}
	@RequestMapping(value="complete", method=RequestMethod.GET)
	public String complete(int gid, Model model){
		model.addAttribute("completeResult", groupService.completeGroup(gid));
		return "forward:detail.do";
	}
	@RequestMapping(value="memberInfo", method=RequestMethod.GET)
	public String memberInfo(int gid, String mid,Model model, HttpSession session){
		model.addAttribute("joincheckCnt", groupService.joinCheckCnt(gid, mid));
		model.addAttribute("joinList",groupService.joinList(gid));
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		model.addAttribute("groupMember",groupService.groupMember(gid));
		return "group/groupMemberManagement";
	}
	@RequestMapping(value="groupInfo", method=RequestMethod.GET)
	public String groupInfo(int gid, String mid, Model model, HttpSession session){
		model.addAttribute("joincheck", groupService.joinCheck(gid, mid));
		model.addAttribute("joinList",groupService.joinList(gid));
		model.addAttribute("groupDetail",groupService.getGroupDetail(gid));
		model.addAttribute("groupComment",gCommentService.commentContent(gid));
		model.addAttribute("joinList",groupService.joinList(gid));
		return "group/groupInfo";
	}
	
	@RequestMapping(value="comment", method=RequestMethod.GET)
	public String comment(GComment gcomment, Model model, HttpServletRequest request){
		model.addAttribute("commentResult", gCommentService.comment(gcomment, request));
		return "forward:detail.do?gid="+gcomment.getGid();
	}
	@RequestMapping(value ="commentModify", method = RequestMethod.GET)
	public String commentModify(int gcid, Model model) {
		model.addAttribute("gcomment", gCommentService.getCommentContent(gcid));
		return "group/commentModify";
	}
	@RequestMapping(value="commentModify", method=RequestMethod.POST)
	public String commentModify(GComment gcomment, Model model){
		model.addAttribute("commentResult", gCommentService.commentModify(gcomment));
		return "forward:detail.do?gid="+gcomment.getGid();
	}
	@RequestMapping(value="commentDelete", method=RequestMethod.GET)
	public String commentDelete(int gcid,int gid,String mid, String pageNum,Model model){
		model.addAttribute("commentDeleteResult", gCommentService.commentDelete(gcid));
		model.addAttribute("pageNum",pageNum);
		return "forward:detail.do?gid="+gid+"&mid="+mid;
	}
	@RequestMapping(value="myGroupList", method=RequestMethod.GET)
	public String groupList(String mid, String pageNum, Model model){
		if(pageNum==null || pageNum=="") {
			pageNum = "1";
		}
		model.addAttribute("StudyList", groupService.myStudyList(mid, pageNum));
		System.out.println(groupService.myStudyList(mid, pageNum));
		model.addAttribute("studyPaging",new Paging(groupService.totCntMyStudy(mid),pageNum,12,10));
		return "group/myGroupList";
	}
	@RequestMapping(value="myHistory", method=RequestMethod.GET)
	public String projectList(String mid, String pageNum, Model model){
		if(pageNum==null || pageNum=="") {
			pageNum = "1";
		}
		model.addAttribute("myHistory", groupService.myHistory(mid, pageNum));
		model.addAttribute("historyPaging",new Paging(groupService.totCntMyHistory(mid),pageNum,12,10));
		return "group/myHistory";
	}
}
