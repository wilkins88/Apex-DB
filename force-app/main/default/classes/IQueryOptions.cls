/**
 * @File Name          : IQueryOptions.cls
 * @Description        : Generic interface for query options, which should return a soql string
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/23/2020, 1:49:22 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/23/2020   Thomas Wilkins     Initial Version
**/
public interface IQueryOptions {
    /**
    * @description Returns a soql string based on the provided obptions
    * @author Thomas Wilkins | 3/23/2020 
    * @return String 
    **/
    String toSoql();
}
