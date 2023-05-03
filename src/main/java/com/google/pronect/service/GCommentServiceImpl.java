package com.google.pronect.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.pronect.dao.GCommentDao;
import com.google.pronect.vo.GComment;
@Service
public class GCommentServiceImpl implements GCommentService {
	@Autowired
	private GCommentDao gcommentDao;
	@Override
	public int comment(GComment gcomment, HttpServletRequest request) {
		String gcip = request.getRemoteAddr();
		gcomment.setGcip(gcip);
		return gcommentDao.comment(gcomment);
	}

	@Override
	public List<GComment> commentContent(int gid) {
		return gcommentDao.commentContent(gid);
	}

	@Override
	public int commentModify(GComment gcomment) {
		return gcommentDao.commentModify(gcomment);
	}

	@Override
	public int commentDelete(int gcid) {
		return gcommentDao.commentDelete(gcid);
	}

	@Override
	public GComment getCommentContent(int gcid) {
		return gcommentDao.getCommentContent(gcid);
	}

}
