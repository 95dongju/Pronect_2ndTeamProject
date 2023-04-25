package com.google.pronect.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PComment {
	private int 	pcid;
	private String 	mid;
	private String 	pccontent;
	private String 	pcip;
	private Date 	pcrdate;
	private int 	pid;
}
