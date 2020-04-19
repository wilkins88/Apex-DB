/**
 * @File Name          : IDatabaseConnection.cls
 * @Description        : Base interface for database wrappers
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 4/19/2020, 7:47:14 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    4/19/2020   Thomas Wilkins     Initial Version
**/
public interface IDatabaseConnection {
    QueryResults query(IQueryOptionsBuilder optionsBuilder);
}
