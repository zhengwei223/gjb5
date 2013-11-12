package javacommon.flex.docConverter;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;
@ContextConfiguration(locations={"classpath:/spring/*.xml"})
public class DocConverterTest extends org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests{

	@Test
	public void testConvertString() throws Exception {
		DocConverter docConverter = (DocConverter) applicationContext.getBean("docConverter");
		String txtFile = "G:\\gjb5data\\original\\0b64ee27a9d94301a3e0f114219bf03d\\txtTest.txt";
		String docFile = "G:\\gjb5data\\original\\0b64ee27a9d94301a3e0f114219bf03d\\docTest.doc";
		String xlsFile = "G:\\gjb5data\\original\\0b64ee27a9d94301a3e0f114219bf03d\\excelTest.xlsx";
		String pptFile = "G:\\gjb5data\\original\\0b64ee27a9d94301a3e0f114219bf03d\\pptTest.ppt";
		docConverter.convert(txtFile);
		docConverter.convert(docFile);
		docConverter.convert(xlsFile);
		docConverter.convert(pptFile);
		
	}

}
