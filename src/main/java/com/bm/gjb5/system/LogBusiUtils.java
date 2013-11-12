package com.bm.gjb5.system;

import java.util.UUID;

import javacommon.base.BaseEntity;
import javacommon.util.db.DbUtil;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.MDC;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.org.rapid_framework.util.DateConvertUtils;

public class LogBusiUtils {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(LogBusiUtils.class);
	public static enum DbOpType{
		INSERT(1),DELETE(2),UPDATE(3),SELECT(4),DEFAULT(-1);
		
		private Integer number;

		private DbOpType(Integer number) {
			this.number = number;
		}
		public Integer getNumber() {
			return number;
		}
				
	}
	public static void log(String content, DbOpType optype) {
		String op_user = "";
		String ip = "";
		String subModule = "";
		java.util.Date op_date = new java.util.Date();
		String eq_id = "";
		/**
		 * {@link javacommon.struts2.interceptor.SharedRenderVariableInterceptor}
		 * 将请求中的一些数据放在值栈中
		 * **/
		try {
			// 当前用户
			/** {@link javacommon.filter.LoggerMDCFilter},将用户登录信息进行保存 **/
			op_user = ConvertUtils.convert(MDC.get("userid"));
			// ip地址
			ip = ConvertUtils.convert(MDC.get("req.remoteAddr"));
			// 子模块
			subModule = ConvertUtils.convert(MDC
					.get("share_current_action_class_name"));
			// 地震序列
			eq_id = ConvertUtils.convert(MDC.get("eq.id"));
		} catch (Exception e) {
			LOGGER.info("出现异常" + e);
		}

		String op_date_string = DateConvertUtils.format(op_date,
				BaseEntity.DATE_TIME_FORMAT);
		DbUtil.update("insert into log_busi values('"
				+ StringUtils.remove(UUID.randomUUID().toString(), "-") + "',"
				+ optype.getNumber() + ",'" + op_user + "',to_date('" + op_date_string
				+ "','" + "yy-MM-dd hh24:mi:ss" + "'),'" + subModule + "','"
				+ ip + "','" + eq_id + "','" + content.replace("'", "\"")
				+ "')");

	}
}
