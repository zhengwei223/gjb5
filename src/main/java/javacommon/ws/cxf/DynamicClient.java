package javacommon.ws.cxf;
import java.beans.IntrospectionException;
import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.net.URL;

import javax.xml.namespace.QName;

import org.apache.cxf.endpoint.Client;
import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;
/**
 * CXF动态客户端
 * @author zhengwei lastmodified 2013年9月16日
 *
 */
public class DynamicClient {
	/**
	 * 
	 * @param wsdlPath 	wsdl路径
	 * @param operationName 操作名
	 * @param params 	参数
	 * @return
	 * @throws Exception
	 */
	public static Object[] invoke(String wsdlPath, String operationName, Object... params)
			throws Exception {
		URL wsdlURL;
		File wsdlFile = new File(wsdlPath);
		if (wsdlFile.exists()) {
			wsdlURL = wsdlFile.toURI().toURL();
		} else {
			wsdlURL = new URL(wsdlPath);
		}
		
		JaxWsDynamicClientFactory factory = JaxWsDynamicClientFactory
				.newInstance();
		Client client = factory.createClient(wsdlURL.toExternalForm());
		//ClientImpl clientImpl = (ClientImpl) client;
		
      /*获取operation及参数信息  
       	Endpoint endpoint = clientImpl.getEndpoint();
        ServiceInfo serviceInfo = endpoint.getService().getServiceInfos().get(0);//service
        BindingInfo binding = serviceInfo.getBindings().iterator().next();//binding
        Iterator<BindingOperationInfo> ops = binding.getOperations().iterator();//operations
        while (ops.hasNext()) {
			BindingOperationInfo opInfo = (BindingOperationInfo) ops
					.next();
			System.out.println(opInfo.getName());
		}*/
		return client.invoke(operationName, params);
	}
}
