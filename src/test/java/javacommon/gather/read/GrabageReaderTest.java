package javacommon.gather.read;

import java.util.List;

import javacommon.gather.bean.GrabageSiteconfig;
import javacommon.gather.bean.Pageinfo;

import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;

import com.bm.gjb5.service.GrabageSiteconfigManager;
@ContextConfiguration(locations={"classpath:/spring/*.xml"})
public class GrabageReaderTest extends AbstractTransactionalJUnit4SpringContextTests{
	@Test
	public void testGetPageInfos() {
		GrabageSiteconfigManager service = (GrabageSiteconfigManager) applicationContext.getBean("grabageSiteconfigManager");
		
		GrabageSiteconfig config = service.getById("4028808c412bcd5701412bd1727f0001");
		GrabageReader reader = new GrabageReader(config );
		try {
			 List<Pageinfo> infos = reader.getPageInfos();
			 System.out.println(infos);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
