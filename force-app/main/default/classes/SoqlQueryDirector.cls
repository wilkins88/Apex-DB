/**
 * @File Name          : SoqlQueryDirector.cls
 * @Description        : Soql query director for all fields on the primary sobject
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/7/2020, 12:15:50 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/3/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class SoqlQueryDirector implements IQueryDirector {
    @TestVisible
    private StandardQueryOptionsBuilder builder;
    public SoqlQueryDirector(StandardQueryOptionsBuilder builder) {
        this.builder = builder;
    }

    public IQueryOptions construct() {
        return builder.setPrimaryFieldSet()
            .setSoqlCondition()
            .setOrdering()
            .setOffset()
            .setLimit()
            .getQueryOptions();
    }
}
