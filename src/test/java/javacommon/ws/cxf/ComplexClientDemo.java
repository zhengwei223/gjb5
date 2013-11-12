package javacommon.ws.cxf;

import java.util.Date;

import javax.xml.namespace.QName;

/**
 * 
 */
public final class ComplexClientDemo {

	private ComplexClientDemo() {
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception {
		String path = "http://localhost:8082/GJB5/ws/EmergencyService?wsdl";

//		QName emergencyStart = new QName("http://ws.gjb5.com/",
//				"emergencyStart");
//		QName emergencyStop = new QName("http://ws.gjb5.com/",
//				"emergencyStop");
//		Object[] res = DynamicClient.invoke(path,"emergencyStart", "1", new Date().getTime(), "where",
//				"123", "321", "8", "10000");
//		System.out.println("输出结果。。。。。。"+res[0]);
		System.out.println(DynamicClient.invoke(path, "emergencyStop","1", new Date().getTime())[0]);
	}


/*	private static Object[] invoke(String path, QName opName, Object... params)
			throws InstantiationException, IllegalAccessException,
			IntrospectionException, InvocationTargetException, Exception {
		URL wsdlURL;
		File wsdlFile = new File(path);
		if (wsdlFile.exists()) {
			wsdlURL = wsdlFile.toURI().toURL();
		} else {
			wsdlURL = new URL(path);
		}
		
		JaxWsDynamicClientFactory factory = JaxWsDynamicClientFactory
				.newInstance();
		Client client = factory.createClient(wsdlURL.toExternalForm());
		ClientImpl clientImpl = (ClientImpl) client;
		
      //获取operation及参数信息  
       	Endpoint endpoint = clientImpl.getEndpoint();
        ServiceInfo serviceInfo = endpoint.getService().getServiceInfos().get(0);//service
        BindingInfo binding = serviceInfo.getBindings().iterator().next();//binding
        Iterator<BindingOperationInfo> ops = binding.getOperations().iterator();//operations
        while (ops.hasNext()) {
			BindingOperationInfo opInfo = (BindingOperationInfo) ops
					.next();
			System.out.println(opInfo.getName());
		}
		return client.invoke(opName, params);
	}
*/
}
