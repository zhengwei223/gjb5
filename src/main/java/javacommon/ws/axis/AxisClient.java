//package javacommon.ws.axis;
//
//import javax.xml.namespace.QName;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
///**
// * AXIS客户端工具
// * @author zhengwei lastmodified 2013年9月10日
// *
// */
//public class AxisClient  {
//	private static final Logger LOGGER = LoggerFactory.getLogger(AxisClient.class);
//	/**
//	 * 调用webservice并仅接受返回的字符串，或调用无返回值的webservice
//	 * @param url ws地址
//	 * @param opAddEntry QName指定命名空间与操作
//	 * @param opAddEntryArgs 入参
//	 * @param isReturnValue 是否有返回值
//	 * @return 字符串或者空串
//	 * @throws AxisFault 
//	 */
//	public static String recieveStringByWs(String url,QName opAddEntry,Object[] opAddEntryArgs, boolean isReturnValue) {
//		
//		String xml = "";
////		RPCServiceClient serviceClient = null;
////		try {
////			serviceClient = new RPCServiceClient();
////			Options options = serviceClient.getOptions();
////			options.setTimeOutInMilliSeconds(3000);
////			EndpointReference targetEPR = new EndpointReference(url);
////			options.setTo(targetEPR);
////			Class[] classes = new Class[] { String.class };
////			if (isReturnValue) {
////				xml = (String) serviceClient.invokeBlocking(opAddEntry,
////						opAddEntryArgs, classes)[0];
////			} else {
////				serviceClient.invokeRobust(opAddEntry, opAddEntryArgs);
////
////			}
////		} catch (AxisFault e) {
////			throw e;
////		} finally {
////			try {
////				if(serviceClient!=null)
////					serviceClient.cleanupTransport();
////			} catch (AxisFault e) {
//////				e.printStackTrace();
////			}
////		}
//		return xml;
//	}
//	
//
//}
