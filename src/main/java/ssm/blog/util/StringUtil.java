package ssm.blog.util;

import java.util.ArrayList;
import java.util.List;

/**
 * @Description 字符串工具类
 * @author 
 *
 */
public class StringUtil {

	/**
	 * @Description 判断是否是空
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str) {
		if(str == null || "".equals(str.trim())) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * @Description 判断是否不是空
	 * @param str
	 * @return
	 */
	public static boolean isNotEmpty(String str) {
		if((str != null) && !"".equals(str.trim())) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * @Description 格式化模糊查询
	 * @param str
	 * @return
	 */
	public static String formatLike(String str) {
		if(isNotEmpty(str)) {
			return "%" + str + "%";
		} else {
			return null;
		}
	}
	
	/**
	 * @Description 过滤掉集合里的空格
	 * @param list
	 * @return
	 */
	public static List<String> filterWhite(List<String> list) {
		List<String> resultList = new ArrayList<String>();
		for(String l : list) {
			if(isNotEmpty(l)) {
				resultList.add(l);
			}
		}
		return resultList;
	}

}
