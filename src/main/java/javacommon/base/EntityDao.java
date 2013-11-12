package javacommon.base;

import java.io.Serializable;
import java.util.List;

import org.springframework.dao.DataAccessException;

/**
 * @author badqiu
 */
public interface EntityDao<E, PK extends Serializable> {

	/** 根据主键获得数据 **/
	public Object getById(PK id) throws DataAccessException;

	/** 根据主键删除数据 **/
	public void deleteById(PK id) throws DataAccessException;

	/** 插入数据 
	 * @return */
	public Serializable save(E entity) throws DataAccessException;

	/** 更新数据 */
	public void update(E entity) throws DataAccessException;

	/** 获取全部数据 **/
	public List<E> findAll() throws DataAccessException;

	/** 根据id检查是否插入或是更新数据 */
	public void saveOrUpdate(E entity) throws DataAccessException;

	public boolean isUnique(E entity, String uniquePropertyNames)
			throws DataAccessException;

	/** 用于hibernate.flush() 有些dao实现不需要实现此类 */
	public void flush() throws DataAccessException;

}
