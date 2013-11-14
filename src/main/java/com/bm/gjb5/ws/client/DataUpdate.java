package com.bm.gjb5.ws.client;

import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javacommon.ws.cxf.DynamicClient;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.XMLOutputter;

import com.bm.gjb5.system.AppProperties;
import com.bm.gjb5.system.DictUtil;
import com.bm.gjb5.ws.WsConst;

/**
 * 产出物通知消息接口调用
 * 
 * @author zhengwei lastmodified 2013年11月14日
 * 
 */
public class DataUpdate {
	/**
	 * @return 0：成功 1：参数校验失败 2: 其他失败
	 * @throws Exception
	 */
	public static String send(DataUpdateBean bean) throws Exception {
		String wsdlPath = DictUtil.getDictValue("webService", "dataUpdate", "1");
		Document doc = doc = new SAXBuilder().build(CooperationControlFeedback.class.getResourceAsStream("dataUpdate.xml"));
		Element root = doc.getRootElement();
		// 设置头部时间
		root.getChild("FileHeader").getChild("CreationTime").setText(new SimpleDateFormat(WsConst.DATE_FORMAT).format(new Date()));
		// 设置xml-body
		root.getChild("FileBody").getChild("Pk_id").setText(bean.getPkId());
		root.getChild("FileBody").getChild("EarthquakeId").setText(bean.getEarthquakeId());
		root.getChild("FileBody").getChild("DateName").setText(bean.getDataName());// 数据名称
		root.getChild("FileBody").getChild("DateType").setText(bean.getDataType());// 数据类型
		root.getChild("FileBody").getChild("DatePath").setText(bean.getDataPath());// 数据路径
		root.getChild("FileBody").getChild("Important").setText(bean.getImportant());// 重要程度
		root.getChild("FileBody").getChild("DisasterSite").setText(bean.getDisasterSite());// 灾情地点
		root.getChild("FileBody").getChild("Keyword").setText(bean.getKeyword());// 关键字
		root.getChild("FileBody").getChild("Describe").setText(bean.getDescribe());// 描述
		root.getChild("FileBody").getChild("GetTime").setText(bean.getGetTime());// 获取时间
		root.getChild("FileBody").getChild("Creator").setText(bean.getCreator());// 生产方
		root.getChild("FileBody").getChild("DateColType").setText(bean.getDateColType());
		root.getChild("FileBody").getChild("Expert").setText(bean.getExpert());// 责任人
		root.getChild("FileBody").getChild("Organization").setText(bean.getOrganization());// 责任单位
		XMLOutputter outputter = new XMLOutputter();
		StringWriter out = new StringWriter();
		outputter.output(doc, out);

		String xmlFile = out.toString();
		Object[] result = DynamicClient.invoke(wsdlPath, "DataUpdate", xmlFile);
		return (String) result[0];
	}
}
