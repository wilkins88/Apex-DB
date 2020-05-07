/**
 * @File Name          : CrossObjectSoqlQueryDirector.cls
 * @Description        : Director for queries that query for only primary fields and cross object fields
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/7/2020, 12:16:24 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/7/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class CrossObjectSoqlQueryDirector {
    @TestVisible
    private StandardQueryOptionsBuilder builder;
    public CrossObjectSoqlQueryDirector(StandardQueryOptionsBuilder builder) {
        this.builder = builder;
    }

    public IQueryOptions construct() {
        return builder.setPrimaryFieldSet()
            .setCrossObjectQueryOptions()
            .setSoqlCondition()
            .setOrdering()
            .setOffset()
            .setLimit()
            .getQueryOptions();
    }
}
