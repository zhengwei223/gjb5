package javacommon.os;

import java.io.*;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class OSUtils {
	private static final Logger LOGGER = LoggerFactory.getLogger(OSUtils.class);
	private static String ROOT = System.getProperty("user.home");
	protected static String OS = System.getProperty("os.name");
	protected static String DIRECTORY_SEPARATOR = null;
	protected static int len = 0;
	static {
		if(DIRECTORY_SEPARATOR == null)
			DIRECTORY_SEPARATOR	= System.getProperty("file.separator");
	}


	public static boolean isWin(){
		if(OS.contains("Win"))
			return true;
		return false;
	}

	public static boolean is_writable(String dir){
		File f = new File(dir.trim());
		if(!f.isDirectory() || !f.canWrite())
			return false;
		return true;
	}

	public static void mkdir(String dir){
		dir = dir.trim();
		File f = new File(dir);
		if(!f.isDirectory())
			f.mkdirs();
	}

	public static  void exec(String execString) throws InterruptedException, IOException {
		boolean result = true;
		try {
			LOGGER.info("Executing: " + execString);

			ArrayList commands = commandLineAsList(execString);

			ProcessBuilder pb = new ProcessBuilder(commands);
			pb.redirectErrorStream(true);
			Process p = pb.start();

			BufferedReader is = new BufferedReader(new InputStreamReader(
					p.getInputStream()));
			String line;
			while ((line = is.readLine()) != null) {
				if (line.toLowerCase().startsWith("warning")) {
					throw new java.lang.IllegalArgumentException("\tWARNING: " + line);
				} else if (line.toLowerCase().startsWith("error")) {
					throw new java.lang.IllegalArgumentException("\tERROR: " + line);
				} else if (line.toLowerCase().startsWith("fatal")) {
					throw new java.lang.IllegalArgumentException("\tFATAL ERROR: " + line);
				} else {
					LOGGER.info("\t" + line);
				}
			}
			try {
				p.waitFor();
			} catch (InterruptedException e) {
				throw e;
			}
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		}
	}

	public static String separate(String path){
		if(isWin())
			return (path.trim() + "\\").replace("\\\\", "\\");
		else
			return (path.trim() + "/").replace("//", "/");
	}

	public static String execs(String execString) {
		String ret = "";
		try {
			ArrayList commands = commandLineAsList(execString);

			ProcessBuilder pb = new ProcessBuilder(commands);
			pb.redirectErrorStream(true);
			Process p = pb.start();

			BufferedReader is = new BufferedReader(new InputStreamReader(
					p.getInputStream()));
			String line;
			while ((line = is.readLine()) != null) {
				ret += "	" + line;
			}
			try {
				p.waitFor();
			} catch (InterruptedException e) {
				return null;
			}
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		return ret;
	}
	
	public static ArrayList commandLineAsList(String commandLine) {
		ArrayList commands = new ArrayList();
		String elt = "";
		boolean insideString = false;

		for (int i = 0; i < commandLine.length(); i++) {
			char c = commandLine.charAt(i);

			if (!insideString && (c == ' ' || c == '\t')) {
				if (elt.length() > 0) {
					commands.add(elt);
					elt = "";
				}
				continue;
			} else if (c == '"') {
				insideString = !insideString;
			}

			elt += c;
		}
		if (elt.length() > 0) {
			commands.add(elt);
		}

		return commands;
	}

	public static void deleteFiles(String dir){
		dir = separate(dir);
		File file = new File(dir);
		if(!file.isDirectory())
			return;
		String[] files = file.list();
		for (int i=0; i < files.length; i++){
			File f = new File(dir + files[i]);
			f.delete();
		}
	}

	public static ArrayList<String> directoryFiles(String dir){
		ArrayList<String> arr = new ArrayList<String>();
		dir = separate(dir);
		File d = new File(dir);
		if(!d.isDirectory() && !d.mkdirs()){
			return null;
		}
		String[] files = d.list();
		for (int i=0; i < files.length; i++){
			File f = new File(dir + files[i]);
			if(f.isFile()){
				arr.add(files[i]);
			}
		}
		return arr;
	}

	public static String getSizeString(long size){
		String ret = " byte";
		if(size > 1023){
			ret = " KB";
			size = size / 1024;
			if(size > 1023){
				ret = " MB";
				size = size / 1024;
				if(size > 1023){
					size = size / 1024;
					ret = " GB";
				}
			}
		}
		return size + ret;
	}

	public static long FileSize(String dir, String file){
		dir = separate(dir);
		File f = new File(dir + file);
		if(!f.isFile())
			return 0;
		return f.length();
	}

	public static long FileSize(String file){
		File f = new File(file);
		if(!f.isFile())
			return 0;
		return f.length();
	}

	public static void deleteFiles(String[] files, String path){
		path = separate(path);
		for (int i = 0; i < files.length; i++) {
			File f = new File(path + files[i]);
			if(f.exists()){
				f.delete();
			}
		}
	}


	public static boolean is_dir(String dir) {
		if(dir == null || dir.length() == 0)
			return false;
		File f = new File(dir);
		if(f.isDirectory())
			return true;
		return false;
	}

	public static boolean file_exists(String path) {
		if(path == null || path.length() == 0)
			return false;
		File f = new File(path);
		if(f.exists())
			return true;
		return false;
	}

	public static byte[] file_get_contents(String file) {
		byte[] con = {0};
		if(file == null || file == "")
			return con;
		try {
			File f = new File(file);
			if(!f.isFile() || !f.canRead())
				return con;
			FileInputStream fstream = new FileInputStream(file);
			con = new byte[(int) f.length()];
			fstream.read(con);
			fstream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public static String file_get_content(String file) {
		String con = "";
		if(file == null || file == "")
			return null;
		try {
			File f = new File(file);
			if(!f.isFile() || !f.canRead())
				return null;
			FileInputStream fstream = new FileInputStream(file);
			byte[] cont = new byte[(int) f.length()];
			fstream.read(cont);
			fstream.close();
			con = new String(cont,"iso8859-1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public static boolean file_write_contents(String file, String content) {
		try {
			FileOutputStream fstream = new FileOutputStream(file);
			byte[] cont = content.getBytes("iso8859-1");
			fstream.write(cont);
			fstream.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public static int getTotalPage(String file){
		String content = "";
		try {
			content = new String(file_get_contents(file), "iso8859-1");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		if(content.length() == 0)
			return 0;
		int page = 0;
		try {
			String pat_one = "/N\\s+([0-9]+)";
			Pattern pattern = Pattern.compile(pat_one);
			Matcher match = pattern.matcher(content);
			if(match.find()){
				String count = match.group(1).trim();
				try{
					page = Integer.parseInt(count);
				}catch(Exception e){
					e.printStackTrace();
				}
			}

			String pat_two = "/Count\\s+([0-9]+)";
			Pattern pattern2 = Pattern.compile(pat_two);
			Matcher match2 = pattern2.matcher(content);
			while(match2.find()){
				String count = match2.group(1).trim();
				try{
					int kk = Integer.parseInt(count);
					if(kk > page)
						page = kk;
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return page;
	}

	public static ArrayList<String> glob(String dir, String pattern){
		dir = separate(dir);
		ArrayList<String> ret = new ArrayList<String>();
		File d = new File(dir);
		if(!d.isDirectory())
			return ret;
		String[] files = d.list();
		pattern = pattern.replace(" ", "*");
		pattern = pattern.replace(".", "[.]");
		pattern = pattern.replace("*", "(.*)");
		Pattern r = Pattern.compile(pattern);
		for(int i = 0; i < files.length; i++){
			Matcher m = r.matcher(files[i]);
			if (m.matches( )) {
				ret.add(dir + files[i]);
			}
		}
		return ret;
	}


	public static void echo(Object echo){
		System.out.println(echo);
	}

	public static void main(String[] args) throws InterruptedException, IOException {
		String execString = "D:\\Program Files\\SWFTools\\pdf2swf g:\\flexpaper\\pdf\\AJAX.pdf -o Ajax.swf -s languagedir=d:\\xpdf-chinese-simplified";
		exec(execString );
	}
}