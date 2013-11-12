package com.bm.gjb5.service;

import java.io.IOException;
import java.util.List;

import javacommon.base.BaseManager;
import javacommon.base.EntityDao;
import javacommon.util.CryptoUtils;
import javacommon.util.db.DbUtil;

import org.apache.commons.io.IOUtils;
import org.jdom2.JDOMException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import cn.org.rapid_framework.page.Page;

import com.bm.gjb5.dao.RightsUserDao;
import com.bm.gjb5.dao.UserinfoDao;
import com.bm.gjb5.model.RightsUser;
import com.bm.gjb5.model.Userinfo;
import com.bm.gjb5.system.LogBusiUtils;
import com.bm.gjb5.system.LogBusiUtils.DbOpType;
import com.bm.gjb5.vo.query.UserinfoQuery;
import com.bm.gjb5.ws.SyncUtil;

@Service
public class UserinfoManager extends BaseManager<Userinfo, java.lang.String> {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(UserinfoManager.class);

	private UserinfoDao userinfoDao;
	private RightsUserDao rightsUserDao;

	/** 增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,请注意大小写 */
	public void setUserinfoDao(UserinfoDao dao) {
		this.userinfoDao = dao;
	}

	public void setRightsUserDao(RightsUserDao rightsUserDao) {
		this.rightsUserDao = rightsUserDao;
	}

	public EntityDao getEntityDao() {
		return this.userinfoDao;
	}

	public Page findPage(UserinfoQuery query) {
		return userinfoDao.findPage(query);
	}

	// new--------------------------------------------------
	/**
	 * 同步中心用户到本地数据库
	 * @throws Exception 
	 */
	public void sync() throws Exception {
		String xml = SyncUtil.fullSynUserInfo();
		// 解析xml，转为jdbc操作
		UserinfoParser parser = new UserinfoParser(IOUtils.toInputStream(xml),
				"gbk");
		List<Userinfo> userinfos = parser.getUserinfos();
		for (Userinfo userinfo : userinfos) {
			userinfo.setPwd(CryptoUtils.hash("SHA-1", userinfo.getPwd()));
			if (userinfo.getOpt().equals("AddUserExtended")) {
				save(userinfo);
			} else if (userinfo.getOpt().equals("DeleteUserPermanentExtended")) {
				removeById(userinfo.getUuid());
			} else if (userinfo.getOpt().equals("MarkDeleteUserExtended")) {
				// 设置禁用状态
				userinfo.setStatus("0");
				update(userinfo);
			} else if (userinfo.getOpt().equals("ResumeMarkedUserExtended")) {
				// 恢复为可用状态
				userinfo.setStatus("1");
				update(userinfo);
			} else if (userinfo.getOpt().equals("UpdateUserExtended")) {
				update(userinfo);
			} else {

			}
		}
	}

	/** 在本地激活中心用户 **/
	public void activate(String id, String roleId) {
		Userinfo userinfo = userinfoDao.getById(id);
		RightsUser rightsUser = rightsUserDao.getById(id);
		if (null == rightsUser) {
			String sql = "insert into rights_user (ID, USERNAME, PASSWORD, NAME, STATUS, "
					+ "DEPT_ID, ORG_ID, EMP_ID, PHONENUMBER, ROLE_ID)"
					+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			DbUtil.update(sql, userinfo.getUuid(), userinfo.getUsername(),
					userinfo.getPwd(), userinfo.getFullname(),
					userinfo.getStatus(), userinfo.getOrgcode(),
					userinfo.getOrguuid(), userinfo.getCode(),
					userinfo.getPnumber(), roleId);
			LogBusiUtils.log("从中心用户导入本地数据库，用户id为"+id+"授权角色为"+roleId, DbOpType.INSERT);
		} else {
			rightsUserDao.evict(rightsUser);
			RightsUser _rightsUser = new RightsUser(userinfo);
			_rightsUser.setRoleId(roleId);
			rightsUserDao.update(_rightsUser);
		}
	}

}
