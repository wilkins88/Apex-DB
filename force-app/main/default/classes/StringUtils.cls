/**
 * @File Name          : StringUtils.cls
 * @Description        : Utilities for working with and creating strings
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/14/2020, 8:05:41 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/14/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class StringUtils {
    /**
    * @description Joins a list of objects where the general String.join may not work
    * @author Thomas Wilkins | 5/14/2020 
    * @param objectsToJoin Objects that can be converted using String.valueOf
    * @return String 
    **/
    public static String join(List<Object> objectsToJoin, String delimiter) {
        String str = '';
        for (Integer i = 0; i < objectsToJoin.size(); i++) {
            if (i == 0) str += String.valueOf(objectsToJoin[i]);
            else str += delimiter + String.valueOf(objectsToJoin[i]);
        }
        return str;
    }
}
