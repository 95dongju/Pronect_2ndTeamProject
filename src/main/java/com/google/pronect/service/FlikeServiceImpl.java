package com.google.pronect.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.pronect.dao.FlikeDao;
import com.google.pronect.vo.Flike;
@Service
public class FlikeServiceImpl implements FlikeService {
	@Autowired
	FlikeDao flikeDao;
	@Override
	public int findLike(Flike flike) {
		// TODO Auto-generated method stub
		return flikeDao.findLike(flike);
	}
	
	@Override
	public int getLike(Flike flike) {
		// TODO Auto-generated method stub
		return flikeDao.getLike(flike);
	}

	@Override
	public int likeUp(Flike flike) {
		// TODO Auto-generated method stub
		return flikeDao.likeUp(flike);
	}

	@Override
	public int likeDown(Flike flike) {
		// TODO Auto-generated method stub
		return flikeDao.likeDown(flike);
	}

}
