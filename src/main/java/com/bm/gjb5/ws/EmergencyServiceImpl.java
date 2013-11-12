package com.bm.gjb5.ws;

import java.util.Date;

import javax.jws.WebService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.bm.gjb5.model.SysEarthquake;
import com.bm.gjb5.service.SysEarthquakeManager;
import com.bm.gjb5.system.LogBusiUtils;
import com.bm.gjb5.system.LogBusiUtils.DbOpType;

public class EmergencyServiceImpl implements EmergencyService {
	private static final Logger LOGGER = LoggerFactory.getLogger(EmergencyServiceImpl.class);
	@Override
	public String emergencyStart(String eventId, Long eventTime,
			String location, String longitude, String latitude,
			String magnitude, String depth) {
		SysEarthquake entity = new SysEarthquake(eventId, new Date(eventTime),
				longitude, latitude, depth, magnitude, location, new Date(), 1);

		// System.out.println("地震来啦，赶紧开工");
		// System.out.println(eventId + " " + eventTime + " " + location + " "
		// + longitude + " " + latitude + " " + magnitude + " " + depth);
		sysEarthquakeManager.save(entity);
		String logString = "应急启动，地震事件："+eventId + " " + eventTime + " " + location + " "
				 + longitude + " " + latitude + " " + magnitude + " " + depth;
		LOGGER.info(logString);
		LogBusiUtils.log(logString, DbOpType.INSERT);
		return "1";
	}
	
	@Override
	public String emergencyStop(String eventId, Long endTime) {
		SysEarthquake entity =  sysEarthquakeManager.getById(eventId);
		entity.setStatus(2);
		entity.setEndTime(new Date(endTime));
		sysEarthquakeManager.update(entity);
		LOGGER.info("应急结束，事件ID："+eventId);
		LogBusiUtils.log("应急结束，事件ID："+eventId, DbOpType.UPDATE);
		return "1";
	}
	
	private SysEarthquakeManager sysEarthquakeManager;

	public void setSysEarthquakeManager(
			SysEarthquakeManager sysEarthquakeManager) {
		this.sysEarthquakeManager = sysEarthquakeManager;
	}
}
