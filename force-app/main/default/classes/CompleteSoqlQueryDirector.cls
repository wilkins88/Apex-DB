/**
 * @File Name          : FullSoqlQueryDirector.cls
 * @Description        : Soql query director for constructing a complete query with primary fields, cross object queries, and related lists
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/14/2020, 8:23:54 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/7/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class CompleteSoqlQueryDirector {
    @TestVisible
    private StandardQueryOptionsBuilder builder;
    public CompleteSoqlQueryDirector(StandardQueryOptionsBuilder builder) {
        this.builder = builder;
    }

    public IQueryOptions construct() {
        return builder.setPrimaryFieldSet()
            .setParentObjectQueryOptions()
            .setRelatedListQueryOptions()
            .setSoqlCondition()
            .setOrdering()
            .setOffset()
            .setLimit()
            .getQueryOptions();
    }
}
