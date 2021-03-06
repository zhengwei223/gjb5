package com.bm.gjb5.dao;

import java.util.*;

import javacommon.base.*;
import javacommon.util.*;

import cn.org.rapid_framework.util.*;
import cn.org.rapid_framework.web.util.*;
import cn.org.rapid_framework.page.*;
import cn.org.rapid_framework.page.impl.*;

import com.bm.gjb5.model.*;
import com.bm.gjb5.dao.*;
import com.bm.gjb5.service.*;
import com.bm.gjb5.vo.query.*;

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */


import static cn.org.rapid_framework.util.ObjectUtils.*;
import org.springframework.stereotype.Repository;

@Repository
public class LogExceptionDao extends BaseHibernateDao<LogException,java.lang.String>{

	public Class getEntityClass() {
		return LogException.class;
	}
	
	public Page findPage(LogExceptionQuery query) {
        //XsqlBuilder syntax,please see http://code.google.com/p/rapid-xsqlbuilder
        // [column]为字符串拼接, {column}为使用占位符. [column]为使用字符串拼接,如username='[username]',偷懒时可以使用字符串拼接 
        // [column] 为PageRequest的属性
		String sql = "select t from LogException t where 1=1 "
				+ "/~ and t.eventTime >= {eventTimeBegin} ~/"
				+ "/~ and t.eventTime <= {eventTimeEnd} ~/"
			  	+ "/~ and t.outline = {outline} ~/"
			  	+ "/~ and t.callStack = {callStack} ~/"
			  	+ "/~ and t.submodule = {submodule} ~/"
			  	+ "/~ and t.exceptionLevel = {exceptionLevel} ~/"
			  	+ "/~ and t.status = {status} ~/"
			  	+ "/~ and t.eqId = {eqId} ~/"
				+ "/~ order by [sortColumns] ~/";

        
		return pageQuery(sql,query);
	}
	

}
