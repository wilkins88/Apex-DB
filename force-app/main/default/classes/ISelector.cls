/**
 * @File Name          : ISelector.cls
 * @Description        : Interface used to define selector options
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/23/2020, 12:12:26 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/23/2020   Thomas Wilkins     Initial Version
**/
public interface ISelector {
    /**
    * @description returns the type of Sobject that the selector is for
    * @author Thomas Wilkins | 3/22/2020 
    * @return System.Schema.SObjectType
    **/
    Schema.SObjectType getSObjectType();
        /**
    * @description returns the sobject fields that should be queried
    * @author Thomas Wilkins | 3/22/2020 
    * @return List<System.Schema.SObjectField>
    **/
    List<Schema.SObjectField> getSObjectFields();
}
