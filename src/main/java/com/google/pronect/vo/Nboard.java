package com.google.pronect.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Nboard {
	private int       nid;
	private String    mid;
	private String    ntitle;
	private String    ncontent;
	private String 	  nfile;
	private Timestamp nrdate;
	private int    	  startRow;
	private int       endRow;
	private String    schItem;
	private String    schWord;
	private String    mimage;
	private String    mnickname;
}
