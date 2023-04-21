package com.google.pronect.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.pronect.vo.Member;

public interface MemberService {
	public int idConfirm(String mid);
	public int nicknameConfirm(String mnickname);
	public int joinMember(Member member, HttpSession httpSession, MultipartHttpServletRequest mRequest);
	public String loginCheck(String mid, String mpw, HttpSession httpSession);
	public Member getDetailMember(String mid);
	public int modifyMember(Member member, HttpSession httpSession);
	public int modifyManager(Member member, HttpSession httpSession);
	public List<Member> memberList(String pageNum, Member member);
	public int totCntMember(Member member);
}
