package com.multi.bbs.common.util;

import java.time.Duration;
import java.time.Instant;
import java.util.Date;

public class CalcTime {
	/**
	 * 주어진 시간과 현재 시간의 차이를 계산해서,<br>
	 * "방금 전" or "n분/시간/일/개월 전" 문자열을 반환하는 메소드.
	 * @param 시간
	 * @return 주어진 시간과 현재 시간의 차이 
	 */
	public String getTimeDiff(Date writeTime) {
		Instant now = Instant.now();
		Duration duration = Duration.between(writeTime.toInstant(), now);
		int secDiff = (int) duration.getSeconds();
		if (secDiff < 60) {
			return "방금 전";
		}
		if (secDiff < 3600) {
			return (secDiff / 60) + "분 전";
		}
		if (secDiff < 86400) {
			return (secDiff / 3600) + "시간 전";
		}
		if (secDiff < 2592000) {
			return (secDiff / 86400) + "일 전";
		}
		
		return (secDiff / 2592000) + "개월 전";
	}
}
