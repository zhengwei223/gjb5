package javacommon.log;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import com.bm.gjb5.dao.RightsUserDao;
import com.bm.gjb5.model.RightsUser;
@ContextConfiguration(locations={"classpath:/spring/*-resource.xml",
        "classpath:/spring/*-datasource.xml",
        "classpath:/spring/*-dao.xml",
})
public class LogAdviceTest extends AbstractJUnit4SpringContextTests{

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Test
	public void testSave() {
		rightsUserDao = (RightsUserDao) applicationContext.getBean("rightsUserDao");
		RightsUser entity = new RightsUser();
//		entity.setRoleId("30000");
		rightsUserDao.save(entity );
		System.out.println(rightsUserDao.findAll());
//		System.out.println(applicationContext.getBean("rightsUserDao"));
	}

	private RightsUserDao rightsUserDao;
}
