package othertest;

import java.io.IOException;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.hibernate.tool.hbm2ddl.SchemaUpdate;
import org.hibernate.tool.hbm2ddl.SchemaValidator;
import org.junit.Test;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;

@SuppressWarnings("all")
public class HibernateConfigTest {
	private static Configuration cfg;
	static {
		Logger.getLogger("org.hibernate").setLevel(Level.ERROR);
		cfg = new Configuration();
		cfg.configure("othertest/hibernate.cfg.xml");
		for (Class claz : getClasses("javacommon.gather.bean")) {
			System.out.println(claz);
			cfg.addAnnotatedClass(claz);

		}
	}

	@Test
	public void schemaCheck() {
		SchemaUpdate schemaUpdate = new SchemaUpdate(cfg);
		schemaUpdate.execute(true, false);
		SchemaValidator validator = new SchemaValidator(cfg);
		validator.validate();
	}
	private static List<Class> getClasses(String packageName) {
		ResourcePatternResolver rl = new PathMatchingResourcePatternResolver();
		List result = new ArrayList();
		try {
			String packagePart = packageName.replace('.', '/');
			String classPattern = "classpath*:/" + packagePart + "/**/*.class";
			Resource[] resources = rl.getResources(classPattern);
			for (int i = 0; i < resources.length; i++) {
				Resource resource = resources[i];
				String fileName = resource.getURL().toString();
				String className = /*
									 * fileName.substring(
									 * fileName.indexOf(packagePart.substring(0,
									 * packagePart.indexOf('*'))),
									 * fileName.length() - ".class".length())
									 * .replace('/', '.');
									 */
				packageName
						+ "."
						+ fileName.substring(fileName.lastIndexOf("/") + 1,
								fileName.lastIndexOf("."));
				Class type = Class.forName(className);
				if (isEntityClass(type))
					result.add(type);
			}
		} catch (IOException e) {
			fatal(e);
			return null;
		} catch (ClassNotFoundException e) {
			fatal(e);
			return null;
		}
		return result;
	}

	private static boolean isEntityClass(Class type) {
		if (type.isAnnotationPresent(Entity.class) && !type.isInterface()
				&& !isAbstract(type) && !type.isAnonymousClass()
				&& !type.isMemberClass()) {
			return true;
		}
		return false;
	}

	private static boolean isAbstract(Class type) {
		return (type.getModifiers() ^ Modifier.ABSTRACT) == 0;
	}

	private static void fatal(Throwable e) {
		throw new IllegalStateException("scan hibernate annotation error", e);
	}
}
