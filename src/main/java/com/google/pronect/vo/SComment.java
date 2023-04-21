package com.google.pronect.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class SComment {
	private int 	scid;
	private String 	mid;
	private String 	sccontent;
	private String 	scip;
	private Date 	scrdate;
	private int 	sid;
}
