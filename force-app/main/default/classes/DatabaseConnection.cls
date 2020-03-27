/**
 * @File Name          : DatabaseConnection.cls
 * @Description        : Database wrapper that services as a layer between classes and the Database class, affording
 *                          additional functionality
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/27/2020, 12:03:33 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/25/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class DatabaseConnection {
    public List<SObject> query(IQueryOptionsBuilder optionsBuilder) {
        IQueryOptions options = optionsBuilder.setPrimarySelector()
            .setCrossObjectQueries()
            .setRelatedListQueries()
            .setSoqlCondition()
            .getQueryOptions();
        return Database.query(options.toSoql());
    }
}
