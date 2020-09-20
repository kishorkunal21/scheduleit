package com.scheduler.scheduleit.config;

import java.util.LinkedHashMap;
import java.util.Map;

public class DropdownLists {

	public static Map<Integer, String> jobMinutes() {
		Map<Integer, String> map = new LinkedHashMap<Integer, String>();
		map.put(-1, "*");
		map.put(0, "0");
		map.put(1, "1");
		map.put(2, "2");
		map.put(3, "3");
		map.put(4, "4");
		map.put(5, "5");
		map.put(6, "6");
		map.put(7, "7");
		map.put(8, "8");
		map.put(9, "9");
		map.put(10, "10");
		map.put(11, "11");
		map.put(12, "12");
		map.put(13, "13");
		map.put(14, "14");
		map.put(15, "15");
		map.put(16, "16");
		map.put(17, "17");
		map.put(18, "18");
		map.put(19, "19");
		map.put(20, "20");
		map.put(21, "21");
		map.put(22, "22");
		map.put(23, "23");
		map.put(24, "24");
		map.put(25, "25");
		map.put(26, "26");
		map.put(27, "27");
		map.put(28, "28");
		map.put(29, "29");
		map.put(30, "30");
		map.put(31, "31");
		map.put(32, "32");
		map.put(33, "33");
		map.put(34, "34");
		map.put(35, "35");
		map.put(36, "36");
		map.put(37, "37");
		map.put(38, "38");
		map.put(39, "39");
		map.put(40, "40");
		map.put(41, "41");
		map.put(42, "42");
		map.put(43, "43");
		map.put(44, "44");
		map.put(45, "45");
		map.put(46, "46");
		map.put(47, "47");
		map.put(48, "48");
		map.put(49, "49");
		map.put(50, "50");
		map.put(51, "51");
		map.put(52, "52");
		map.put(53, "53");
		map.put(54, "54");
		map.put(55, "55");
		map.put(56, "56");
		map.put(57, "57");
		map.put(58, "58");
		map.put(59, "59");

		return map;
	}

	public static Map<Integer, String> jobHours() {
		Map<Integer, String> map = new LinkedHashMap<Integer, String>();
		map.put(-1, "*");
		map.put(0, "0");
		map.put(1, "1");
		map.put(2, "2");
		map.put(3, "3");
		map.put(4, "4");
		map.put(5, "5");
		map.put(6, "6");
		map.put(7, "7");
		map.put(8, "8");
		map.put(9, "9");
		map.put(10, "10");
		map.put(11, "11");
		map.put(12, "12");
		map.put(13, "13");
		map.put(14, "14");
		map.put(15, "15");
		map.put(16, "16");
		map.put(17, "17");
		map.put(18, "18");
		map.put(19, "19");
		map.put(20, "20");
		map.put(21, "21");
		map.put(22, "22");
		map.put(23, "23");
		return map;
	}

	public static Map<Integer, String> jobDayMonths() {
		Map<Integer, String> map = new LinkedHashMap<Integer, String>();
		map.put(-1, "*");
		map.put(1, "1");
		map.put(2, "2");
		map.put(3, "3");
		map.put(4, "4");
		map.put(5, "5");
		map.put(6, "6");
		map.put(7, "7");
		map.put(8, "8");
		map.put(9, "9");
		map.put(10, "10");
		map.put(11, "11");
		map.put(12, "12");
		map.put(13, "13");
		map.put(14, "14");
		map.put(15, "15");
		map.put(16, "16");
		map.put(17, "17");
		map.put(18, "18");
		map.put(19, "19");
		map.put(20, "20");
		map.put(21, "21");
		map.put(22, "22");
		map.put(23, "23");
		map.put(24, "24");
		map.put(25, "25");
		map.put(26, "26");
		map.put(27, "27");
		map.put(28, "28");
		map.put(29, "29");
		map.put(30, "30");
		map.put(31, "31");
		return map;
	}

	public static Map<Integer, String> jobType() {
		Map<Integer, String> map = new LinkedHashMap<Integer, String>();
		map.put(1, "Export to File");
		map.put(2, "Export to Mail");
		map.put(3, "Export to Database");
		return map;
	}

	public static Map<Integer, String> jobWeekDays() {
		Map<Integer, String> map = new LinkedHashMap<Integer, String>();
		map.put(0, "SUN");
		map.put(1, "MON");
		map.put(2, "TUE");
		map.put(3, "WED");
		map.put(4, "THU");
		map.put(5, "FRI");
		map.put(6, "SAT");
		return map;
	}

	public static Map<Integer, String> connectionDriver() {
		Map<Integer, String> map = new LinkedHashMap<Integer, String>();
		map.put(1, "PostgreSQL");
		map.put(2, "Oracle");
		map.put(3, "MySQL");
		return map;
	}

}
