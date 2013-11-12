package javacommon.util.db;

public interface Config {
	public String getDriverName();

	public String getUrl();

	public String getUser();

	public String getPwd();

	public String getName();

	public int getMaxActive();

	public int getMaxIde();

	public long getMaxWait();
}
