package com.bm.gjb5.ws;

import java.io.StringReader;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.bm.gjb5.system.AppProperties;
import com.bm.gjb5.system.LogBusiUtils;
import com.bm.gjb5.system.LogBusiUtils.DbOpType;

public class CooperationControlServiceImpl implements CooperationControlService {
	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public String controlCommand(String xml) {
		Document doc;
		try {
			doc = new SAXBuilder().build(new StringReader(xml));
			Element root = doc.getRootElement();
			String order = root.getChild("FileBody").getChildText("Order");
			int orderInt = Integer.parseInt(order);
			logger.info("收到协同控制命令#" + order + "#" + getOrderString(orderInt));
			LogBusiUtils.log("收到协同控制命令#" + order + "#" + getOrderString(orderInt), DbOpType.UPDATE);
			return "0";
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("", e);
			return "1";
		}
	}

	/*
	 * @Override public String appMonitor(String sysytem, long reportTime,
	 * String runStaus) {
	 * logger.info("收到协同应用监视信息#"+sysytem+"#"+reportTime+"#"+runStaus);
	 * LogBusiUtils
	 * .log("收到协同应用监视信息#"+sysytem+"#"+reportTime+"#"+runStaus,DbOpType.UPDATE);
	 * return "1"; }
	 */
	private String getOrderString(int order) {
		return AppProperties.getOrders().get(order);
	}

}
