/**
 * @File Name          : IDatabaseConnection.cls
 * @Description        : Base interface for database wrappers
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/3/2020, 12:18:35 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    4/19/2020   Thomas Wilkins     Initial Version
**/
public interface IDatabaseConnection {
    /**
    * @description querys against a database/datastore with the provided query options builder
    * @author Thomas Wilkins | 4/23/2020 
    * @param optionsBuilder query options builder to generate query
    * @return QueryResults 
    **/
    QueryResults query(IQueryDirector queryDirector);
}
