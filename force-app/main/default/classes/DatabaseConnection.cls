/**
 * @File Name          : DatabaseConnection.cls
 * @Description        : Database wrapper that services as a layer between classes and the Database class, affording
 *                          additional functionality
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 4/23/2020, 9:59:01 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/25/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class DatabaseConnection implements IDatabaseConnection {
    public QueryResults query(IQueryOptionsBuilder optionsBuilder) {
        IQueryOptions options = optionsBuilder.setFieldSet()
            .setCrossObjectQueries()
            .setRelatedListQueries()
            .setSoqlCondition()
            .getQueryOptions();
        return new QueryResults(Database.query(options.toSoql()));
    }
}
