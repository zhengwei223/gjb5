package javacommon.flex.docConverter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javacommon.flex.pdfConverter.PDFConverter;
import javacommon.flex.swfConverter.SWFConverter;
import javacommon.flex.utils.FileUtils;;

public class DocConverter {

	private PDFConverter pdfConverter;
	private SWFConverter swfConverter;

	public DocConverter(PDFConverter pdfConverter, SWFConverter swfConverter) {
		super();
		this.pdfConverter = pdfConverter;
		this.swfConverter = swfConverter;
	}

	/**
	 * 暂时没有考虑不能转换为pdf的情况，如音频和视频文件
	 * @param inputFile
	 * @param swfFile
	 * @throws Exception
	 */
	public  void convert(String inputFile,String swfFile) throws Exception{
		String pdfFile;
		if(FileUtils.getFileSufix(inputFile).equals("pdf")){//已经是pdf
			pdfFile = inputFile;
			this.swfConverter.convert2SWF(pdfFile, swfFile);
		}/*else if(FileUtils.getFileSufix(inputFile).equals("wav")){//如果是wav
			this.swfConverter.convertWav2SWF(inputFile, swfFile);//wav转swf
		}*/
		else{
			this.pdfConverter.convert2PDF(inputFile);//先转pdf
			pdfFile = FileUtils.getFilePrefix(inputFile)+".pdf";
			this.swfConverter.convert2SWF(pdfFile, swfFile);//pdf转swf
		}
	}
	
	public void convert(String inputFile) throws Exception{
		this.pdfConverter.convert2PDF(inputFile);
		String pdfFile = FileUtils.getFilePrefix(inputFile)+".pdf";
		this.swfConverter.convert2SWF(pdfFile);
		
	}
}
