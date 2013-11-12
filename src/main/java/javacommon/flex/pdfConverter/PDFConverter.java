package javacommon.flex.pdfConverter;

public interface PDFConverter {
	public void convert2PDF(String inputFile,String pdfFile) throws Exception;
	public void convert2PDF(String inputFile) throws Exception;

}
