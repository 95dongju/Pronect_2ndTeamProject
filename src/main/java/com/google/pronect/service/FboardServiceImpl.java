package com.google.pronect.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.pronect.dao.FboardDao;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Fboard;
@Service
public class FboardServiceImpl implements FboardService {
	@Autowired
	private FboardDao fboardDao;
	
	@Override
	public List<Fboard> fboardList(Fboard fboard, String pageNum) {
		// TODO Auto-generated method stub
		Paging paging = new Paging(fboardDao.totCntFboard(fboard), pageNum);
		fboard.setStartRow(paging.getStartRow());
		fboard.setEndRow(paging.getEndRow());
		return fboardDao.fboardList(fboard);
	}

	@Override
	public int totCntFboard(Fboard fboard) {
		// TODO Auto-generated method stub
		return fboardDao.totCntFboard(fboard);
	}

	@Override
	public int writeFboard(Fboard fboard, MultipartHttpServletRequest mRequest) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Fboard contentFboard(int fid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Fboard fboardModifyReplyView(int fid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifyFboard(Fboard fboard, MultipartHttpServletRequest mRequest) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFboard(int fid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int replyFboard(Fboard fboard, MultipartHttpServletRequest mRequest) {
		// TODO Auto-generated method stub
		return 0;
	}

}
