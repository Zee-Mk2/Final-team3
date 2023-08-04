package com.multi.bbs.tour;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TourSchedule {
	private int tsno;
	private int tno;
	private int mno;
	private String name;
	private double la;
	private double lo;
	private Date startTime;
	private Date endTime;
	private String type;
}
