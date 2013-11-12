package javacommon.gather.logic;

import java.util.HashSet;
import java.util.List;

import javacommon.gather.bean.GrabageSiteconfig;

import com.gargoylesoftware.htmlunit.html.DomNode;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class ParsePageTools {

	private static final String ENABLED = "enabled";
	private static final String HREF = "href";

	/**
	 * 移除广告位
	 * 
	 * @param page
	 *            页面
	 * @param gsite
	 *            目标站点配置
	 */
	public static void removeAdvert(HtmlPage page, GrabageSiteconfig gsite) {
		if (gsite.hasAdvert()) {
			HashSet<DomNode> adset = new HashSet<DomNode>();
			for (String xadvert : gsite.getAdvert()) {
				adset.addAll((List<DomNode>) page.getByXPath(xadvert));
			}
			for (DomNode node : adset) {
				try {
					DomNode pnode = node.getParentNode();
					pnode.removeChild(node);
				} catch (Exception ex) {
					// 可能有嵌套广告的情况，捕获此异常
					ex.printStackTrace();
				}
			}
		}

	}
	/**
	 * 获取第一个匹配节点的href属性
	 * @param page
	 * @param xpath
	 * @return
	 */
	public static String getNodeHref(HtmlPage page, String xpath) {
		if (UtilTools.isEmpty(xpath))
			return "";
		List<DomNode> nodes = (List<DomNode>) page.getByXPath(xpath);
		if (nodes != null && !nodes.isEmpty())
			for (DomNode node : nodes) {
				if (node.getAttributes().getLength() > 0) {
					return node.getAttributes().getNamedItem(HREF)
							.getNodeValue();
				}
			}
		return "";
	}
	/**
	 * 获取第一个匹配节点的某属性的值
	 * @param page
	 * @param xpath
	 * @param attribute
	 * @return
	 */
	public static String getNodeAttibute(HtmlPage page, String xpath,String attribute) {
		if (UtilTools.isEmpty(xpath))
			return "";
		List<DomNode> nodes = (List<DomNode>) page.getByXPath(xpath);
		if (nodes != null && !nodes.isEmpty())
			for (DomNode node : nodes) {
				if (node.getAttributes().getLength() > 0) {
					return node.getAttributes().getNamedItem(attribute)
							.getNodeValue();
				}
			}
		return "";
	}

	/**
	 * 获取第一个匹配节点文本内容
	 * @param page
	 * @param xpath
	 * @return
	 */
	public static String getNodeValue(HtmlPage page, String xpath) {
		if (UtilTools.isEmpty(xpath))
			return "";
		List<DomNode> nodes = (List<DomNode>) page.getByXPath(xpath);
		if (nodes != null && !nodes.isEmpty())
			for (DomNode node : nodes) {
				if (UtilTools.isNotEmpty(node.asText())) {
					return node.asText().trim();
				}
			}
		return "";
	}
	/**
	 * 获取所有匹配节点文本内容
	 * @param page
	 * @param xpath
	 * @return
	 */
	public static String getContent(HtmlPage page, String xpath) {
		if (UtilTools.isEmpty(xpath))
			return "";
		String str = "";
		List<DomNode> nodes = (List<DomNode>) page.getByXPath(xpath);
		if (nodes != null && !nodes.isEmpty())
			for (DomNode node : nodes) {

				if (UtilTools.isNotEmpty(node.asText())) {
					String content = node.asText().trim();
					str += content;
				}
			}
		return str;
	}

}
