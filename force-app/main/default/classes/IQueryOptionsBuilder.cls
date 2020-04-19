/**
 * @File Name          : IQueryOptionsBuilder.cls
 * @Description        : Builder interface for building query options
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 4/18/2020, 2:08:00 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/25/2020   Thomas Wilkins     Initial Version
**/
public interface IQueryOptionsBuilder {
    IQueryOptionsBuilder setFieldSet();
    IQueryOptionsBuilder setCrossObjectQueries();
    IQueryOptionsBuilder setRelatedListQueries();
    IQueryOptionsBuilder setSoqlCondition();
    IQueryOptions getQueryOptions();
}
