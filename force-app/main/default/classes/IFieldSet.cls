/**
 * @File Name          : IFieldSet.cls
 * @Description        : Interface for capturing data field sets
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 4/18/2020, 2:06:49 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    4/18/2020   Thomas Wilkins     Initial Version
**/
public interface IFieldSet {
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
