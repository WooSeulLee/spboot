package com.test.spboot.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CarInfoVO {
	private Integer ciNum;
	private int start;
	private int count;
	private int page;
	private String ciName;
	private String ciYear;
}
