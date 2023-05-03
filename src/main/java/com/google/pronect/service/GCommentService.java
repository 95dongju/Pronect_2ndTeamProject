package com.google.pronect.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.google.pronect.vo.GComment;

public interface GCommentService {
	public int comment(GComment gcomment, HttpServletRequest request);
	public List<GComment> commentContent(int gid);
	public GComment getCommentContent(int gcid);
	public int commentModify(GComment gcomment); 
	public int commentDelete(int gcid);
}
