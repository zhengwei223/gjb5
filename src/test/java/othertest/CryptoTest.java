package othertest;

import java.io.UnsupportedEncodingException;

import org.apache.shiro.crypto.hash.Sha1Hash;
import org.junit.Test;

public class CryptoTest {
	@Test
	public void ShiroSha1CryptoTest(){
		String src = "123456";
			byte[] byteDigest = new Sha1Hash(src).getBytes();
			int i;  
	        StringBuffer buf = new StringBuffer("");  
	        for (int offset = 0; offset < byteDigest.length; offset++) {  
	            i = byteDigest[offset];  
	            if (i < 0)  
	                i += 256;  
	            if (i < 16)  
	                buf.append("0");  
	            buf.append(Integer.toHexString(i));  
	        }  
	        //32位加密  
	        System.out.println(buf.toString().toUpperCase().equalsIgnoreCase("7C4A8D09CA3762AF61E59520943DC26494F8941B"));   
	}
}
