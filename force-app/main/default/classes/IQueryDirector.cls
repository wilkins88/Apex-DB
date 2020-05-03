/**
 * @File Name          : IQueryDirector.cls
 * @Description        : Interface for all query directors, which should construct query options based on a builder
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/3/2020, 12:18:22 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/3/2020   Thomas Wilkins     Initial Version
**/
public interface IQueryDirector {
    IQueryOptions construct();
}
