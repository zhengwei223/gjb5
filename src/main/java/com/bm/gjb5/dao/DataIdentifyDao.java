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
public class DataIdentifyDao extends BaseHibernateDao<DataIdentify,java.lang.String>{

	public Class getEntityClass() {
		return DataIdentify.class;
	}
	
	public Page findPage(DataIdentifyQuery query) {
        //XsqlBuilder syntax,please see http://code.google.com/p/rapid-xsqlbuilder
        // [column]为字符串拼接, {column}为使用占位符. [column]为使用字符串拼接,如username='[username]',偷懒时可以使用字符串拼接 
        // [column] 为PageRequest的属性
		String sql = "select t from DataIdentify t where 1=1 "
				+ "/~ and t.createTime >= {createTimeBegin} ~/"
				+ "/~ and t.createTime <= {createTimeEnd} ~/"
				+ "/~ and t.eventTime >= {eventTimeBegin} ~/"
				+ "/~ and t.eventTime <= {eventTimeEnd} ~/"
			  	+ "/~ and t.location = {location} ~/"
			  	+ "/~ and t.longitude = {longitude} ~/"
			  	+ "/~ and t.latitude = {latitude} ~/"
			  	+ "/~ and t.txtInfo1 = {txtInfo1} ~/"
			  	+ "/~ and t.txtInfo2 = {txtInfo2} ~/"
			  	+ "/~ and t.semantics = {semantics} ~/"
			  	+ "/~ and t.magnitude = {magnitude} ~/"
			  	+ "/~ and t.seisesthesia = {seisesthesia} ~/"
			  	+ "/~ and t.reportMan = {reportMan} ~/"
				+ "/~ and t.reportTime >= {reportTimeBegin} ~/"
				+ "/~ and t.reportTime <= {reportTimeEnd} ~/"
			  	+ "/~ and t.manual = {manual} ~/"
			  	+ "/~ and t.originalId = {originalId} ~/"
				+ "/~ order by [sortColumns] ~/";

        
		return pageQuery(sql,query);
	}
	

}
