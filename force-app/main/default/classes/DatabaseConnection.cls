/**
 * @File Name          : DatabaseConnection.cls
 * @Description        : Database wrapper that services as a layer between classes and the Database class, affording
 *                          additional functionality
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/3/2020, 12:19:02 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/25/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class DatabaseConnection implements IDatabaseConnection {
    public QueryResults query(IQueryDirector queryDirector) {
        IQueryOptions options = queryDirector.construct();
        return new QueryResults(Database.query(options.toSoql()));
    }
}
