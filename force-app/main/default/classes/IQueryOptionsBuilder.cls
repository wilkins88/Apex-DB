/**
 * @File Name          : IQueryOptionsBuilder.cls
 * @Description        : Builder interface for building query options
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/27/2020, 12:02:14 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/25/2020   Thomas Wilkins     Initial Version
**/
public interface IQueryOptionsBuilder {
    IQueryOptionsBuilder setPrimarySelector();
    IQueryOptionsBuilder setCrossObjectQueries();
    IQueryOptionsBuilder setRelatedListQueries();
    IQueryOptionsBuilder setSoqlCondition();
    IQueryOptions getQueryOptions();
}
