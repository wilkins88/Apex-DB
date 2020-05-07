/**
 * @File Name          : RelatedListSoqlQueryDirector.cls
 * @Description        : Director for queries that include only primary fields and related lists
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/7/2020, 12:16:04 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/7/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class RelatedListSoqlQueryDirector {
    @TestVisible
    private StandardQueryOptionsBuilder builder;
    public RelatedListSoqlQueryDirector(StandardQueryOptionsBuilder builder) {
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
