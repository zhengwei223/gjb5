package javacommon.log;


import org.aspectj.lang.JoinPoint;



/**
 * 记录日志
 * @author zhengwei lastmodified 2013年9月5日
 *
 */
public class LogAdvice{
	
	public void afterThrowing(JoinPoint jp, Exception ex){
		System.out.println("----------------抛异常了………………");
	}

}
