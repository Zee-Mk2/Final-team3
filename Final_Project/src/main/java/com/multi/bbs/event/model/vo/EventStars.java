package com.multi.bbs.event.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class EventStars {
	private int mno;
	private int evntNo;
	private int rating;
	private double averageRating;
	private int reviewCount;

}