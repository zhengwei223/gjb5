package javacommon.util;

import org.apache.shiro.crypto.hash.SimpleHash;
/**
 * 加密工具<p>
 *see {@link org.apache.shiro.crypto.hash.SimpleHash}
 * @author zhengwei lastmodified 2013年9月24日<p>
 */
public class CryptoUtils {
	/**
	 * 对指定的source按指定的algorithmName进行加密
	 * @param algorithmName 如SHA-1 MD5 等
	 * @param source
	 * @return 加密后字符串
	 */
	public static String hash(String algorithmName,Object source ){
		
		byte[] byteDigest = new SimpleHash(algorithmName,source).getBytes();
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
        return buf.toString().toUpperCase();

	}
}
