package com.multi.bbs.account.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int mno;
	private String role;
	private String name;
	private String email;
	private String password;
	private String phone;
	private String state;
	private Date enroll_date;
}
