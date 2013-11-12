package javacommon.gather.read;

import javacommon.gather.bean.*;
import javacommon.gather.logic.ParsePageTools;
import javacommon.gather.logic.UtilTools;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomNode;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.opensymphony.xwork2.ActionContext;

/**
 * 
 */
public class GrabageReader {
	
	
	private final  GrabageSiteconfig xconfig ;
	private WebClient webClient;
	private List<Pageinfo> pageInfos ;
	private int totalCount;
	public GrabageReader(GrabageSiteconfig config) {
		webClient= new WebClient(BrowserVersion.INTERNET_EXPLORER_8);
		webClient.setJavaScriptEnabled(false);
		webClient.setCssEnabled(false);
		this.xconfig= config;
		pageInfos = new ArrayList<Pageinfo>();
	}
	
	public List<Pageinfo> getPageInfos() throws Exception {
		tryToLoadXlink();
		ActionContext.getContext().getSession().put("progress_msg", "超链接解析完毕，共有"+pageInfos.size()+"个页面内容需要提取");
		for (int i = 0; i < pageInfos.size(); i++) {
			tryToLoadContent(pageInfos.get(i));
			//将进度存放在session中
			double progress =100*( (i+1)/(double)pageInfos.size());
			ActionContext.getContext().getSession().put("progress_value", progress);
			ActionContext.getContext().getSession().put("progress_msg_sub", "完成：提取第"+(i+1)+"/"+pageInfos.size()+"个页面内容");
		}
		return pageInfos;
	}
	//加载内容等细节
	private void tryToLoadContent(Pageinfo info) throws Exception {
		info.setSiteId(xconfig.getId());
		HtmlPage page = (HtmlPage) webClient.getPage(info.getLink());
		ParsePageTools.removeAdvert(page, xconfig);
		String timeline = ParsePageTools.getNodeValue(page, xconfig.getTimeline());
		String content = ParsePageTools.getNodeValue(page, xconfig.getContent());
		String author = ParsePageTools.getNodeValue(page, xconfig.getAuthor());
		String source = 	ParsePageTools.getNodeValue(page, xconfig.getSource());
		String summary = ParsePageTools.getNodeAttibute(page, xconfig.getSummary(),"content");
		if(info.getTitle()==null)
			info.setTitle(ParsePageTools.getNodeValue(page, xconfig.getTitle()));
		info.setTimeline(UtilTools.getDate(timeline));
		info.setContent(content);
		info.setAuthor(author);
		info.setSource(source);
		info.setSummary(summary);
	}
	//加载页面上的超链接
	private void tryToLoadXlink() throws IOException {
		long lasting = System.currentTimeMillis();
		String link = xconfig.getLink();//主页面
		HtmlPage page =null;
		int index = 1;
		do {
			page = (HtmlPage) webClient.getPage(link);
			if(page==null)
				return;
			if(xconfig.getXlink()==null){//如果没有第二级链接，直接把该页当做内容页
				Pageinfo pageInfo = new Pageinfo();
				pageInfo.setLink(link);
				pageInfos.add(pageInfo);
				totalCount++;
				return;
			}
			//获取所有需要的超链接
			List<DomNode> nodes = (List<DomNode>) page.getByXPath(xconfig.getXlink());
			for (DomNode node : nodes) {
				totalCount++;
				String href = node.getAttributes().getNamedItem("href")
						.getNodeValue();
				String title = node.asText();
				boolean hasKeyword = false;
				if(xconfig.getKeywords()!=null&&xconfig.getKeywords().size()>0){
					//有关键字，则做判断
					for (String kw : xconfig.getKeywords()) {
						if(title.contains(kw)){
							hasKeyword = true;
							break;
						}
					}
				}else {
					//没有关键字，需要提取所有
					hasKeyword = true;
				}
				
				if(hasKeyword){
					Pageinfo pageInfo = new Pageinfo(href,title);
					pageInfos.add(pageInfo);
				}
			}
			//System.out.println("---------完成第"+index+"页-----------");
			//准备下一页
			String nextpage = ParsePageTools.getNodeHref(page, xconfig.getSplitpath());
			link = xconfig.getForward()+nextpage;//重置link
			index++;
		} while (index<xconfig.getPagecount());
//		System.out.println("get links cost "+(System.currentTimeMillis()-lasting)/1000+"'s");
	}
	
	
}