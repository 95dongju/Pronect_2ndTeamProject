package com.google.pronect.service;

import com.google.pronect.vo.SComment;

public interface SCommentService {
	public int comment(SComment scomment);
	public int commentContent(int sid);
	public int commentModify(SComment scomment); 
	public int commentDelete(int scid);
}
