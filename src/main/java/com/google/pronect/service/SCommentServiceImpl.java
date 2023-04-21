package com.google.pronect.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.pronect.dao.SCommentDao;
import com.google.pronect.vo.SComment;
@Service
public class SCommentServiceImpl implements SCommentService {
	@Autowired
	private SCommentDao scommentDao;
	@Override
	public int comment(SComment scomment) {
		return scommentDao.comment(scomment);
	}

	@Override
	public int commentContent(int sid) {
		return scommentDao.commentContent(sid);
	}

	@Override
	public int commentModify(SComment scomment) {
		return scommentDao.commentModify(scomment);
	}

	@Override
	public int commentDelete(int scid) {
		return scommentDao.commentDelete(scid);
	}

}
