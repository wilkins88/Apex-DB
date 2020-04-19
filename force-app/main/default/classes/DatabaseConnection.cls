/**
 * @File Name          : DatabaseConnection.cls
 * @Description        : Database wrapper that services as a layer between classes and the Database class, affording
 *                          additional functionality
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 4/19/2020, 7:47:26 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/25/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class DatabaseConnection implements IDatabaseConnection {
    // todo error handling
    public QueryResults query(IQueryOptionsBuilder optionsBuilder) {
        try {
            IQueryOptions options = optionsBuilder.setFieldSet()
                .setCrossObjectQueries()
                .setRelatedListQueries()
                .setSoqlCondition()
                .getQueryOptions();
            return new QueryResults(Database.query(options.toSoql()));
        } catch (Exception e) {
            return null;
        }
    }
}
