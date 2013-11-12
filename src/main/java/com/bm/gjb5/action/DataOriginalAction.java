package com.bm.gjb5.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;
import java.util.Properties;

import javacommon.base.BaseStruts2Action;
import javacommon.flex.docConverter.DocConverter;

import javax.servlet.http.HttpServletRequest;

import oracle.net.aso.f;

import org.apache.commons.io.FileUtils;
import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;

import cn.org.rapid_framework.page.Page;
import cn.org.rapid_framework.web.scope.Flash;
import cn.org.rapid_framework.web.util.HttpUtils;

import com.bm.gjb5.model.DataOriginal;
import com.bm.gjb5.model.SysEarthquake;
import com.bm.gjb5.service.DataOriginalManager;
import com.bm.gjb5.service.SysEarthquakeManager;
import com.bm.gjb5.system.AppProperties;
import com.bm.gjb5.system.DataUtils;
import com.bm.gjb5.system.DictUtil;
import com.bm.gjb5.vo.query.DataOriginalQuery;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * @author zhengwei
 * @version 1.0
 * @since 1.0
 */

public class DataOriginalAction extends BaseStruts2Action implements
		Preparable, ModelDriven {
	// 默认多列排序,example: username desc,createTime asc
	protected static final String DEFAULT_SORT_COLUMNS = null;

	// forward paths
	protected static final String QUERY_JSP = "/pages/DataOriginal/query.jsp";
	protected static final String LIST_JSP = "/pages/DataOriginal/list.jsp";
	protected static final String CREATE_JSP = "/pages/DataOriginal/create.jsp";
	protected static final String EDIT_JSP = "/pages/DataOriginal/edit.jsp";
	protected static final String SHOW_JSP = "/pages/DataOriginal/show.jsp";
	// redirect paths,startWith: !
	protected static final String LIST_ACTION = "!/pages/DataOriginal/list.do";

	public void prepare() throws Exception {
		if (isNullOrEmptyString(id)) {
			dataOriginal = new DataOriginal();
		} else {
			dataOriginal = (DataOriginal) dataOriginalManager.getById(id);
			
		}
		getValueStack().set("statusList",
				DictUtil.getDictMap("data_original", "status"));
		getValueStack().set(
				"formList",AppProperties.getAllFormats());
	}

	/** 执行搜索 */
	public String list() {
		DataOriginalQuery query = newQuery(DataOriginalQuery.class,
				DEFAULT_SORT_COLUMNS);
		if(session.get("event")!=null){
			SysEarthquake event = (SysEarthquake) session.get("event");
			query.setEventId(event.getEventId());
		}
		Page page = dataOriginalManager.findPage(query);
		savePage(page, query);
		return LIST_JSP;
	}

	/**
	 * 查看对象
	 * 
	 * @throws IOException
	 */
	public String show() throws IOException {
		
		return SHOW_JSP;
	}

	/** 进入新增页面 */
	public String create() {
		return CREATE_JSP;
	}

	/** 保存新增对象 */
	public String save() {
		try {
			parseUpload(getRequest());
			dataOriginal.setNoticeTime(new Date());
			dataOriginal.setCollTime(new Date());
			dataOriginal.setFilename(uploadFileName);
			dataOriginal.setForm(uploadFileName.substring(uploadFileName
					.lastIndexOf(".") + 1));
			// dataOriginal.setFileSize(dataFile.length());
			dataOriginal.setOriginalName("手工上传");
			File destFile = DataUtils.getOriginalFile(
					dataOriginal.getEventId(), uploadFileName);
			FileUtils.copyFile(uploadInput, destFile);//存放
			// IOUtils.copy(uploadInput, new FileOutputStream(destFile));
//			dataOriginal.setLocaleUrl(destFile.getAbsolutePath());//本地路径
			dataOriginal.setLocaleUrl("/"+dataOriginal.getEventId()+"/"+uploadFileName);//本地路径,使用相对路径
			dataOriginal.setFileSize((long) uploadInput.length());
		} catch (Exception e) {
			LOG.error("拷贝文件出错", e);
		}
		dataOriginal.setStatus(0);
		;
		dataOriginalManager.save(dataOriginal);

		Flash.current().success(CREATED_SUCCESS); // 存放在Flash中的数据,在下一次http请求中仍然可以读取数据,error()用于显示错误消息
		return LIST_ACTION;
	}

	/** 进入更新页面 */
	public String edit() {
		return EDIT_JSP;
	}

	/** 保存更新对象 */
	public String update() {
		dataOriginalManager.update(this.dataOriginal);
		Flash.current().success(UPDATE_SUCCESS);
		return LIST_ACTION;
	}

	/** 删除对象 */
	public String delete() {
		for (int i = 0; i < items.length; i++) {
			Hashtable params = HttpUtils.parseQueryString(items[i]);
			java.lang.String id = new java.lang.String(
					(String) params.get("id"));
			dataOriginalManager.removeById(id);
		}
		Flash.current().success(DELETE_SUCCESS);
		return LIST_ACTION;
	}

	public String play() throws IOException {
		String form = dataOriginal.getForm();
		
		List<String> imgFormatList = AppProperties.getImgFormatList();
		List<String> audioFormatList = AppProperties.getAudioFormatList();
		//---------音频---------------------
		if (audioFormatList.contains(form)) {
			String playPath = copy(form);
			getValueStack().set("playPath", playPath);
			return "/pages/multimedia/play_mp3.jsp";
		}
		//---------图片---------------
		if(imgFormatList.contains(form)){
			String playPath = copy(form);
			getValueStack().set("playPath", playPath);
			return "/pages/multimedia/play_img.jsp";
		}
		//----------视频--------------
		if(AppProperties.getVedioFormatList().contains(form)){
			String playPath = copy(form);
			getValueStack().set("playPath", playPath);
			return "/pages/multimedia/play_vedio.jsp";
		}
		//----文档---如果是doc/docx/xls/xlsx/pdf/ppt/pptx/txt,转换为pdf再转换为swf
		if(AppProperties.getDocFormatList().contains(form)){
			String srcPath = DataUtils.ORIGINAL_DIR+dataOriginal.getLocaleUrl();
			String relativePath = "/swf/" + dataOriginal.getEventId() + "/"
					+ dataOriginal.getId() + ".swf";
			// 绝对路径
			String filePath = DataUtils.getDataBasePath() + relativePath;
			//被播放的文件
			File destFile = new File(filePath);
			// 判断有没有swf文件，没有则生成
			if (!destFile.exists()) {
				if (!destFile.getParentFile().exists()) {
					destFile.getParentFile().mkdirs();
				}
				try {
					// 将pdf生成到指定路径
					docConverter.convert(srcPath, filePath);
				} catch (Exception e) {
					LOG.error("转换失败", e);
					return "/pages/multimedia/cannotplay.jsp";
				}
			}
			getValueStack().set("swfPath", DataUtils.getVirtualPath() + relativePath);// 共享
			return "/pages/multimedia/play_swf.jsp";
		}
		return "/pages/multimedia/cannotplay.jsp";
	}
	//将原文件按格式拷贝到不同路径,且新的文件以记录的id作为文件名,主要是为了防止中文路径出现问题
	private String copy(String form) throws IOException {
		String relativePath =  "/"+form+"/"
				+ dataOriginal.getEventId() + "/" + dataOriginal.getId()
				+ "."+form+"";
		//目标路径
		String path = DataUtils.getDataBasePath() + relativePath;
		File destFile = new File(path);
		//不存在，就拷贝
		if (!destFile.exists()) {
			if (!destFile.getParentFile().exists()) {
				destFile.getParentFile().mkdirs();
			}
			// 拷贝并以id命名,网页请求中文资源有路径问题
			FileUtils.copyFile(new File(DataUtils.ORIGINAL_DIR+dataOriginal.getLocaleUrl()),
					new File(path));
		}
		//返回播放路径
		return DataUtils.getVirtualPath()+relativePath;
	}

	// --------fields-----------
	private DataOriginalManager dataOriginalManager;
	private SysEarthquakeManager sysEarthquakeManager;
	private DataOriginal dataOriginal;
	java.lang.String id = null;
	private String[] items;
	private File uploadInput;
	private String uploadFileName;
	private String uploadContentType;
	private DocConverter docConverter;
	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,注意大小写 */
	public void setDataOriginalManager(DataOriginalManager manager) {
		this.dataOriginalManager = manager;
	}

	public void setSysEarthquakeManager(
			SysEarthquakeManager sysEarthquakeManager) {
		this.sysEarthquakeManager = sysEarthquakeManager;
	}

	public void setDocConverter(DocConverter docConverter) {
		this.docConverter = docConverter;
	}
	public Object getModel() {
		return dataOriginal;
	}

	public void setId(java.lang.String val) {
		this.id = val;
	}

	public void setItems(String[] items) {
		this.items = items;
	}

	public void setUploadInput(File uploadInput) {
		this.uploadInput = uploadInput;
	}

	public void setUploadContentType(String dataFileContentType) {
		this.uploadContentType = dataFileContentType;
	}

	public void setUploadFileName(String dataFileFileName) {
		this.uploadFileName = dataFileFileName;
	}

	@SuppressWarnings("all")
	private void parseUpload(HttpServletRequest request) throws Exception {
		if (request instanceof ShiroHttpServletRequest) {
			ShiroHttpServletRequest _request = (ShiroHttpServletRequest) request;
			request = (HttpServletRequest) _request.getRequest();
		}
		MultiPartRequestWrapper multiWrapper = (MultiPartRequestWrapper) request;

		// bind allowed Files
		Enumeration fileParameterNames = multiWrapper.getFileParameterNames();
		while (fileParameterNames != null
				&& fileParameterNames.hasMoreElements()) {
			// get the value of this input tag
			String inputName = (String) fileParameterNames.nextElement();

			// get the content type
			String[] contentType = multiWrapper.getContentTypes(inputName);

			if (isNonEmpty(contentType)) {
				// get the name of the file from the input tag
				String[] fileName = multiWrapper.getFileNames(inputName);

				if (isNonEmpty(fileName)) {
					// get a File object for the uploaded File
					File[] files = multiWrapper.getFiles(inputName);
					if (files != null && files.length > 0) {
						List<File> acceptedFiles = new ArrayList<File>(
								files.length);
						List<String> acceptedContentTypes = new ArrayList<String>(
								files.length);
						List<String> acceptedFileNames = new ArrayList<String>(
								files.length);
						String contentTypeName = inputName + "ContentType";
						String fileNameName = inputName + "FileName";

						for (int index = 0; index < files.length; index++) {
							setUploadFileName(fileName[index]);
							setUploadContentType(contentType[index]);
							setUploadInput(files[index]);
						}
					}
				}
			}
		}
	}

	private static boolean isNonEmpty(Object[] objArray) {
		boolean result = false;
		for (int index = 0; index < objArray.length && !result; index++) {
			if (objArray[index] != null) {
				result = true;
			}
		}
		return result;
	}
}
