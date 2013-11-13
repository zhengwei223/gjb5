package com.bm.gjb5.ws;

import java.io.IOException;
import java.io.StringReader;
import java.util.Date;

import javax.jws.WebService;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.bm.gjb5.model.SysEarthquake;
import com.bm.gjb5.service.SysEarthquakeManager;
import com.bm.gjb5.system.LogBusiUtils;
import com.bm.gjb5.system.LogBusiUtils.DbOpType;

public class EmergencyServiceImpl implements EmergencyService {
	private static final Logger LOGGER = LoggerFactory.getLogger(EmergencyServiceImpl.class);
	@Override
	public String emergencyStart(String xml)  {
		Document doc;
		try {
			doc = new SAXBuilder().build(new StringReader(xml));
			Element root = doc.getRootElement();
			String eventId = root.getChild("FileBody").getChildText("EventId");
			Date eventTime = new Date(Long.parseLong(root.getChild("FileBody").getChildText("EventTime")));
			String longitude = root.getChild("FileBody").getChildText("Longitude");
			String latitude = root.getChild("FileBody").getChildText("Latitude");
			String magnitude = root.getChild("FileBody").getChildText("Magnitude");
			String depth = root.getChild("FileBody").getChildText("Depth");
			String location = root.getChild("FileBody").getChildText("Location");
			
			SysEarthquake entity = new SysEarthquake(eventId, eventTime,
					longitude, latitude, depth, magnitude, location, new Date(), 1);
			sysEarthquakeManager.save(entity);
			String logString = "应急启动，地震事件："+eventId + " " + eventTime + " " + location + " "
					+ longitude + " " + latitude + " " + magnitude + " " + depth;
			LOGGER.info(logString);
			LogBusiUtils.log(logString, DbOpType.INSERT);
			return "0";
		} catch(Exception e) {
			e.printStackTrace();
			LOGGER.error("", e);
			return "1";
		}
	}
	
	@Override
	public String emergencyStop(String xml) {
		Document doc;
		try {
			doc = new SAXBuilder().build(new StringReader(xml));
			Element root = doc.getRootElement();
			String eventId = root.getChild("FileBody").getChildText("EventId");
			Date eventTime = new Date(Long.parseLong(root.getChild("FileBody").getChildText("EventTime")));
			SysEarthquake entity =  sysEarthquakeManager.getById(eventId);
			entity.setStatus(2);
			entity.setEndTime(eventTime);
			sysEarthquakeManager.update(entity);
			LOGGER.info("应急结束，事件ID："+eventId);
			LogBusiUtils.log("应急结束，事件ID："+eventId, DbOpType.UPDATE);
			
			return "0";
		} catch(Exception e) {
			e.printStackTrace();
			LOGGER.error("", e);
			return "1";
		}
	}
	
	private SysEarthquakeManager sysEarthquakeManager;

	public void setSysEarthquakeManager(
			SysEarthquakeManager sysEarthquakeManager) {
		this.sysEarthquakeManager = sysEarthquakeManager;
	}
}
