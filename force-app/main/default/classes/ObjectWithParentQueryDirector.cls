/**
 * @File Name          : ObjectWithParentQueryDirector.cls
 * @Description        : Director for queries that query for only primary fields and parent object fields
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/14/2020, 8:23:44 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/7/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class ObjectWithParentQueryDirector {
    @TestVisible
    private StandardQueryOptionsBuilder builder;
    public ObjectWithParentQueryDirector(StandardQueryOptionsBuilder builder) {
        this.builder = builder;
    }

    public IQueryOptions construct() {
        return builder.setPrimaryFieldSet()
            .setParentObjectQueryOptions()
            .setSoqlCondition()
            .setOrdering()
            .setOffset()
            .setLimit()
            .getQueryOptions();
    }
}
