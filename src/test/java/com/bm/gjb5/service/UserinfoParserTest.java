package com.bm.gjb5.service;

import static org.junit.Assert.*;

import java.io.IOException;
import java.io.InputStreamReader;

import org.jdom2.JDOMException;
import org.junit.Test;

public class UserinfoParserTest {

	@Test
	public void testGetUserinfos() {
		try {
			UserinfoParser parser = new UserinfoParser(getClass().getResourceAsStream("userinfo.xml"),"gbk");
			System.out.println(parser.getUserinfos());
		} catch (JDOMException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
