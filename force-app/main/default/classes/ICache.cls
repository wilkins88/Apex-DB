/**
 * @File Name          : ICache.cls
 * @Description        : 
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/27/2020, 9:39:15 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/27/2020   Thomas Wilkins     Initial Version
**/
public interface ICache {
    Object get(String key);
    void put(String key, Object value);
}
