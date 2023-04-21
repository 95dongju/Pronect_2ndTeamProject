package com.google.pronect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.google.pronect.vo.Member;

@Mapper
public interface MemberDao {
	public int idConfirm(String mid);
	public int nicknameConfirm(String mnickname);
	public int joinMember(Member member);
	public String loginCheck(String mid, String mpw);
	public Member getDetailMember(String mid);
	public int modifyMember(Member member);
	public int modifyManager(Member member);
	public List<Member> memberList(Member member);
	public int totCntMember(Member member);
}
