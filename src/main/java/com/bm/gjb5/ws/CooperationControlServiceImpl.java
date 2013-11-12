package com.bm.gjb5.ws;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.bm.gjb5.system.AppProperties;

public class CooperationControlServiceImpl implements CooperationControlService {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	@Override
	public String controlCommand(String eventId, String sysytem, int order) {
		
		logger.info("收到协同控制命令#"+order+"#"+getOrderString(order));
		return "1";
	}
	@Override
	public String appMonitor(String sysytem, long reportTime, String runStaus) {
		logger.info("收到协同应用监视信息#"+sysytem+"#"+reportTime+"#"+runStaus);
		return "1";
	}
	private String getOrderString(int order) {
		return AppProperties.getOrders().get(order);
	}

}
