package com.google.pronect.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.pronect.dao.NboardDao;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Nboard;
@Service
public class NboardServiceImpl implements NboardService {
	@Autowired
	private NboardDao nboardDao;
	String backupPath = "D:\\KHW\\source\\10_2ndProject\\Pronect\\src\\main\\webapp\\nboardFile\\";
	
	@Override
	public List<Nboard> nboardList(Nboard nboard, String pageNum) {
		// TODO Auto-generated method stub
		Paging paging = new Paging(nboardDao.totCntNboard(nboard), pageNum);
		nboard.setStartRow(paging.getStartRow());
		nboard.setEndRow(paging.getEndRow());
		return nboardDao.nboardList(nboard);
	}

	@Override
	public int totCntNboard(Nboard nboard) {
		return nboardDao.totCntNboard(nboard);
	}

	@Override
	public int writeNboard(Nboard nboard, MultipartHttpServletRequest mRequest, HttpServletRequest request) {
		// TODO Auto-generated method stub
		String uploadPath = mRequest.getRealPath("nboardFile/");
		Iterator<String> params = mRequest.getFileNames();
		String nfile = "";
		String param = params.next();
		MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
		nfile = mFile.getOriginalFilename();
		if(nfile!=null && !nfile.equals("")) { // 첨부함
			if(new File(uploadPath + nfile).exists()) {
				// 서버에 같은 파일이름이 있을 경우(첨부파일과)
				nfile = System.currentTimeMillis() + "_" + nfile;
			}//if
			try {
				mFile.transferTo(new File(uploadPath + nfile)); // 서버에 저장
				System.out.println("서버파일 : " + uploadPath + nfile);
				System.out.println("백업파일 : " + backupPath + nfile);
				boolean result = fileCopy(uploadPath + nfile, backupPath + nfile);
				System.out.println(result ?"백업성공":"백업실패");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}else {
			nfile="";
		}// if
		nboard.setNfile(nfile);
		return nboardDao.writeNboard(nboard);
	}
	private boolean fileCopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		InputStream is = null; 
		OutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(file);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int) file.length()];
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1) break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}

	@Override
	public Nboard contentNboard(int nid) {
		return nboardDao.contentNboard(nid);
	}

	@Override
	public int modifyNboard(Nboard nboard, MultipartHttpServletRequest mRequest) {
		// TODO Auto-generated method stub
		String uploadPath = mRequest.getRealPath("nboardFile/");
		Iterator<String> params = mRequest.getFileNames();
		String nfile = "";
		String param = params.next();
		MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
		nfile = mFile.getOriginalFilename();
		if(nfile!=null && !nfile.equals("")) { // 첨부함
			if(new File(uploadPath + nfile).exists()) {
				// 서버에 같은 파일이름이 있을 경우(첨부파일과)
				nfile = System.currentTimeMillis() + "_" + nfile;
			}//if
			try {
				mFile.transferTo(new File(uploadPath + nfile)); // 서버에 저장
				System.out.println("서버파일 : " + uploadPath + nfile);
				System.out.println("백업파일 : " + backupPath + nfile);
				boolean result = fileCopy(uploadPath + nfile, backupPath + nfile);
				System.out.println(result ?"백업성공":"백업실패");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}else {
			nfile="";
		}// if
		nboard.setNfile(nfile);
		return nboardDao.writeNboard(nboard);
	}

	@Override
	public int deleteNboard(int nid) {
		// TODO Auto-generated method stub
		return nboardDao.deleteNboard(nid);
	}

}
