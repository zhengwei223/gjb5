package javacommon.flex.swfConverter;

import java.io.File;

import javacommon.flex.utils.FileUtils;
import javacommon.os.OSUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SWFToolsSWFConverter implements SWFConverter {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(SWFToolsSWFConverter.class);
	/**SwfToolsHome**/
	private String swfToolsPath ;
	
	private String pdf2swfExe;
	private String languageDir;
	private String wav2swfExe;
	public void setSwfToolsPath(String swfToolsPath) {
		this.swfToolsPath = swfToolsPath;
		pdf2swfExe = swfToolsPath + "/pdf2swf.exe";
		wav2swfExe = swfToolsPath + "/wav2swf.exe";
	}
	public void setLanguageDir(String languageDir) {
		this.languageDir = languageDir;
	}
	@Override
	public void convert2SWF(String inputFile, String swfFile) {
		File pdfFile = new File(inputFile);
		File outFile = new File(swfFile);
		if (!inputFile.endsWith(".pdf")) {
			LOGGER.warn("文件格式非PDF！");
			return;
		}
		if (!pdfFile.exists()) {
			LOGGER.warn("PDF文件不存在！");
			return;
		}
		if (outFile.exists()) {
			LOGGER.warn("SWF文件已存在！");
			return;
		}
		String command = pdf2swfExe + " \"" + inputFile + "\" -o \"" + swfFile + "\" -s languagedir="+languageDir+" -T 9 -f";
		try {
			LOGGER.debug("开始转换文档: " + inputFile);
			// Runtime.getRuntime().exec(command);
			OSUtils.exec(command);
			LOGGER.debug("成功转换为SWF文件！");
		} catch (Exception e) {
			LOGGER.error("转换文档为swf文件失败！", e);
		}

	}

	@Override
	public void convert2SWF(String inputFile) {
		String swfFile = FileUtils.getFilePrefix(inputFile) + ".swf";
		convert2SWF(inputFile, swfFile);
	}
	@Override
	public void convertWav2SWF(String inputFile, String swfFile) {
		File wavFile = new File(inputFile);
		File outFile = new File(swfFile);
		String command = wav2swfExe + " \"" + inputFile + "\" -o \"" + swfFile + "\" -T 9 -f";
		try {
			LOGGER.debug("开始转换文档: " + inputFile);
			// Runtime.getRuntime().exec(command);
			OSUtils.exec(command);
			LOGGER.debug("成功转换为SWF文件！");
		} catch (Exception e) {
			LOGGER.error("转换文档为swf文件失败！", e);
		}
	}

}
