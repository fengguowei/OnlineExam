package com.hpe.util;

public class StringUtils {
	
	public static boolean isBlank(String str){
		if(null!=str&&!"".equals(str)){
			return false;
		}
		return true;
	}
}
