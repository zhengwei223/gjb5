package com.bm.gjb5.service;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

import com.bm.gjb5.model.Userinfo;

public class UserinfoParser {
	private InputStream in;
	Document doc = null;

	public UserinfoParser(InputStream in,String cs) throws JDOMException, IOException {
		this.in = in;
		doc = new SAXBuilder().build(new InputStreamReader(in, cs));
	}

	List<Userinfo> getUserinfos() {
		Element root = doc.getRootElement();
		Element userlist = root.getChild("body").getChild("userList");
		List<Element> users = userlist.getChildren();
		List<Userinfo> userinfos = new ArrayList<Userinfo>();
		for (Iterator<Element> iterator = users.iterator(); iterator.hasNext();) {
			Element element = (Element) iterator.next();
			String opt = element.getAttributeValue("opt");
			String uuid = element.getChildText("uuid");
			String code = element.getChildText("code");
			String name = element.getChildText("name");
			String pwd = element.getChildText("pwd");
			String fullname = element.getChildText("fullname");
			String number = element.getChildText("number");
			String unit = element.getChildText("unit");
			String email = element.getChildText("email");
			String orgUuid = element.getChildText("orgUuid");
			String orgCode = element.getChildText("orgCode");
			Userinfo userinfo = new Userinfo(opt, uuid, code, name, pwd,
					fullname, number, unit, email, orgUuid, orgCode);
			userinfos.add(userinfo);
		}
		return userinfos;
	}
}
