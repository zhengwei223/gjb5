package javacommon.util.db.dbcpimpl;

import javacommon.util.db.Config;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;

class Dbcp_Orcl_Config implements Config {
	private String driverName;
	private String url;
	private String user;
	private String pwd;
	private String name;
	private int maxActive;
	private int maxIde;
	private long maxWait;
	private static String configFile = "poolconfig.xml";
	private static Config config;

	private Dbcp_Orcl_Config() {
		init();
	}

	public static Config newInstance() {
		if (config == null) {
			config = new Dbcp_Orcl_Config();
		}
		return config;
	}

	private void init() {
		Document doc = null;
		try {
			doc = new SAXBuilder().build(getClass().getResource(configFile));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		Element root = doc.getRootElement();
		Element database = root.getChild("database");
		this.name = database.getAttributeValue("name").trim();
		this.driverName = database.getChild("driverName").getText().trim();
		this.url = database.getChild("url").getText().trim();
		this.user = database.getChild("user").getText().trim();
		this.pwd = database.getChild("pwd").getText().trim();
		this.maxActive = Integer.parseInt(database.getChild("maxActive")
				.getText().trim());
		this.maxWait = Long.parseLong(database.getChild("maxWait").getText()
				.trim());
		this.maxIde = Integer.parseInt(database.getChild("maxIde").getText()
				.trim());
	}

	public String getDriverName() {
		return this.driverName;
	}

	public String getUrl() {
		return this.url;
	}

	public String getUser() {
		return this.user;
	}

	public String getPwd() {
		return this.pwd;
	}

	public String getName() {
		return this.name;
	}

	public int getMaxActive() {
		return this.maxActive;
	}

	public int getMaxIde() {
		return this.maxIde;
	}

	public long getMaxWait() {
		return this.maxWait;
	}
}
