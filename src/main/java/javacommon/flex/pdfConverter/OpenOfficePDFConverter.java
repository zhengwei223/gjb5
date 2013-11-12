package javacommon.flex.pdfConverter;

import java.io.File;
import java.io.FileNotFoundException;

import org.artofsolving.jodconverter.OfficeDocumentConverter;
import org.artofsolving.jodconverter.office.DefaultOfficeManagerConfiguration;
import org.artofsolving.jodconverter.office.OfficeManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javacommon.flex.utils.FileUtils;

;

public class OpenOfficePDFConverter implements PDFConverter {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(OpenOfficePDFConverter.class);
	private OfficeManager officeManager;
	private String officeHome /* = "D:\\Program Files\\OpenOffice.org 3" */;

	public void setOfficeHome(String officeHome) {
		this.officeHome = officeHome;
	}

	private int port[]/* = {8100} */;

	public void setPort(int[] port) {
		this.port = port;
	}

	public void convert2PDF(String inputFile, String pdfFile) throws Exception {

		if (inputFile.endsWith(".txt")) {
			String odtFile = FileUtils.getFilePrefix(inputFile) + ".odt";
			if (new File(odtFile).exists()) {
				LOGGER.debug("odt文件已存在！");
				inputFile = odtFile;
			} else {
				try {
					FileUtils.copyFile(inputFile, odtFile);
					inputFile = odtFile;
				} catch (FileNotFoundException e) {
					System.out.println("文档不存在！");
					e.printStackTrace();
				}
			}
		}

		startService();
		LOGGER.debug("进行文档转换转换:" + inputFile + " --> " + pdfFile);
		OfficeDocumentConverter converter = new OfficeDocumentConverter(
				officeManager);
		converter.convert(new File(inputFile), new File(pdfFile));
		stopService();
	}

	public void convert2PDF(String inputFile) throws Exception {
		String pdfFile = FileUtils.getFilePrefix(inputFile) + ".pdf";
		convert2PDF(inputFile, pdfFile);

	}

	public void startService() throws Exception {
		DefaultOfficeManagerConfiguration configuration = new DefaultOfficeManagerConfiguration();
		try {
			LOGGER.debug("准备启动服务....");
			configuration.setOfficeHome(officeHome);// 设置OpenOffice.org安装目录
			configuration.setPortNumbers(port); // 设置转换端口，默认为8100
			configuration.setTaskExecutionTimeout(1000 * 60 * 5L);// 设置任务执行超时为5分钟
			configuration.setTaskQueueTimeout(1000 * 60 * 60 * 24L);// 设置任务队列超时为24小时

			officeManager = configuration.buildOfficeManager();
			officeManager.start(); // 启动服务
			LOGGER.debug("office转换服务启动成功!");
		} catch (Exception ce) {
			LOGGER.error("office转换服务启动失败!详细信息:" + ce);
			throw ce;
		}
	}

	public void stopService() {
		LOGGER.debug("关闭office转换服务....");
		if (officeManager != null) {
			officeManager.stop();
		}
		LOGGER.debug("关闭office转换成功!");
	}
}
