/**
 * @File Name          : ISoqlCondition.cls
 * @Description        : Interface for a soql condition
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/23/2020, 4:51:49 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/23/2020   Thomas Wilkins     Initial Version
**/
public interface ISoqlCondition {
    String toSoql();
}
