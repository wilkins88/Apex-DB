/**
 * @File Name          : AggregateQueryOptions.cls
 * @Description        : Options used for making aggregate soql queries
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/23/2020, 1:50:39 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/23/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class AggregateQueryOptions implements IQueryOptions {
    public String toSoql() {
        return '';
    }
}
