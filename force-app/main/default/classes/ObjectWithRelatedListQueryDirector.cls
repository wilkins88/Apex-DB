/**
 * @File Name          : ObjectWithRelatedListQueryDirector.cls
 * @Description        : Director for queries that include only primary fields and related lists
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/14/2020, 8:17:44 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/7/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class ObjectWithRelatedListQueryDirector {
    @TestVisible
    private StandardQueryOptionsBuilder builder;
    public ObjectWithRelatedListQueryDirector(StandardQueryOptionsBuilder builder) {
        this.builder = builder;
    }

    public IQueryOptions construct() {
        return builder.setPrimaryFieldSet()
            .setRelatedListQueryOptions()
            .setSoqlCondition()
            .setOrdering()
            .setOffset()
            .setLimit()
            .getQueryOptions();
    }
}
