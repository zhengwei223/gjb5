package javacommon.gather.logic;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;

public class UtilTools {
	private static String[] timeFormats={
			"\\d\\d\\d\\d-\\d\\d-\\d\\d \\d\\d:\\d\\d:\\d\\d",//yyyy-MM-dd hh-mm-ss
			"\\d\\d\\d\\d-\\d\\d-\\d\\d",
			"\\d\\d\\d\\d年\\d\\d月\\d\\d日\\d\\d:\\d\\d",
			"\\d\\d\\d\\d年\\d\\d月\\d\\d日"};
	private static DateFormat[] dateFormats = {new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"),
		new SimpleDateFormat("yyyy-MM-dd"),
		new SimpleDateFormat("yyyy年MM月dd日HH:mm"),
		new SimpleDateFormat("yyyy年MM月dd日")};
	public static boolean isEmpty(String val){
		if(val==null || val.trim().equals(""))
			return true;
		return false;
	}
	
	public static boolean isNotEmpty(String val){
		return !isEmpty(val);
	}
	
	
	public static String getTimeLine(String str){
		if(isEmpty(str)) return "";
		
		String result="";
		
		for(String format : timeFormats){
			Pattern p = Pattern.compile(format);
			Matcher m = p.matcher(str);
			if(m.find()){
				result=m.group();
				break;
			}
		}
		return result;
	}
	public static Date getDate(String str){
		if(isEmpty(str)) return null;
		str=StringUtils.trim(str);
		Date result = null;
		for (int i = 0; i < timeFormats.length; i++) {
			Pattern p = Pattern.compile(timeFormats[i]);
			Matcher m = p.matcher(str);
			if(m.find()){
				try {
					result=dateFormats[i].parse(m.group());
				} catch (ParseException e) {
					continue;
				}
				break;
			}
			
		}
		
		return result;
	}
}
