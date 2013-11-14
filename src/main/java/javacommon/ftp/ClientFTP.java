package javacommon.ftp;

import java.io.*;
import java.net.SocketException;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;

public class ClientFTP {
	private FTPClient ftp = null;
	private String hostName;
	private String user;
	private String passwd;
	private int port;

	public ClientFTP() {
	}

	/**
	 * 
	 * @param hostName
	 *            主机地址
	 * @param user
	 *            用户名
	 * @param passwd
	 *            密码
	 * @throws Exception
	 */
	public ClientFTP(String hostName, String user, String passwd) throws Exception {
		this(hostName, 21, user, passwd);
	}

	/**
	 * 
	 * @param hostName
	 *            主机地址
	 * @param port
	 *            端口
	 * @param user
	 *            用户名
	 * @param passwd
	 *            密码
	 * @throws Exception
	 */
	public ClientFTP(String hostName, int port, String user, String passwd) throws Exception {
		ftp = new FTPClient();
		ftp.setControlEncoding("utf-8");
		this.port = port;
		this.hostName = hostName;
		this.user = user;
		this.passwd = passwd;
	}

	// --------------基本操作 begin----------------
	/**
	 * 连接
	 * 
	 * @return
	 * @throws SocketException
	 * @throws IOException
	 */
	public boolean connServer() throws SocketException, IOException {
		ftp.connect(hostName, port);
		return ftp.login(this.user, this.passwd);
	}

	/**
	 * 断开
	 */
	public void disconServer() {
		if (ftp.isConnected()) {
			try {
				ftp.logout();
				ftp.disconnect();
			} catch (IOException ioe) {
			}
		}
	}

	/**
	 * 切换目录
	 * 
	 * @param path
	 * @return
	 * @return
	 * @throws IOException
	 */
	public boolean cd(String path) throws IOException {
		//path = new String(path.getBytes("gbk"),"iso-8859-1");
		return ftp.changeWorkingDirectory(path);
	}

	private void dir(){
		FTPFile[] fs;
		try {
			fs = ftp.listFiles();
			for (FTPFile ff : fs) {
				String fname = ff.getName();
				//fname = new String(fname.getBytes("utf-8"),"gbk");
				System.out.println(fname);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 建目录
	 * 
	 * @param dirName
	 * @return
	 * @throws IOException
	 */
	public boolean makDir(String dirName) throws IOException {
		return ftp.makeDirectory(dirName);
	}

	/**
	 * 删除文件
	 * 
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	public boolean del(String fileName) throws IOException {
		return ftp.deleteFile(fileName);
	}

	/**
	 * 删除目录
	 * 
	 * @param dir
	 * @return
	 * @throws IOException
	 */
	public boolean delDir(String dir) throws IOException {
		return ftp.removeDirectory(dir);
	}

	/**
	 * 重命名
	 * 
	 * @param oldname
	 * @param newname
	 * @return
	 * @throws IOException
	 */
	public boolean rename(String oldname, String newname) throws IOException {
		return ftp.rename(oldname, newname);
	}

	// --------------基本操作 end----------------

	// ------------下载 beigin-----------------
	/**
	 * 下载文件
	 * 
	 * @param remotePath
	 *            FTP服务器上的路径
	 * @param fileName
	 *            要下载的文件名
	 * @param localPath
	 *            下载后保存到本地的路径
	 * @return
	 * @throws IOException
	 */
	public boolean downFile(String fileName, String localPath) throws IOException {
		File localFile = new File(localPath + "/" + fileName);
		OutputStream os = new FileOutputStream(localFile);
		boolean b = ftp.retrieveFile(fileName, os);
		os.close();
		return b;
	}

	/**
	 * 下载remotePath下的所有文件到localPath
	 * 
	 * @param remotePath
	 * @param localPath
	 * @throws IOException
	 */
	public void downAllFile(String localPath) throws IOException {
		FTPFile[] fs = ftp.listFiles();
		for (FTPFile ff : fs) {
			File localFile = new File(localPath + "/" + ff.getName());
			OutputStream os = new FileOutputStream(localFile);
			ftp.retrieveFile(ff.getName(), os);
			os.close();
		}
	}

	// ------------下载 end-----------------

	/**
	 * 上传文件
	 * 
	 * @param filename 保存的文件名
	 * @param localFile 本地文件
	 * @return
	 * @throws IOException 
	 */
	public boolean upFile(String filename, InputStream local) throws IOException {
		boolean b = ftp.storeFile(filename, local);
		local.close();
		return b;
	}

	public static void main(String[] args) {
		try {
			ClientFTP clienftp = new ClientFTP("localhost", "dev", "dev123");
			clienftp.connServer();
			clienftp.dir();
			clienftp.cd("每日一讲录音");
			System.out.println("------------------------------");
			clienftp.dir();
			clienftp.downFile("刘亚宗1.amr", "d:/");
			clienftp.disconServer();
		} catch (Exception ee) {
			ee.printStackTrace();
		}
	}
}