/**
 * @File Name          : CacheSettingsSelector.cls
 * @Description        : Selector for caching settings
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/28/2020, 12:11:16 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/28/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class CacheSettingsSelector implements ISelector {
    public Schema.SObjectType getSObjectType() {
        return CacheSetting__mdt.getSObjectType();
    }

    public List<Schema.SObjectField> getSObjectFields() {
        return new List<Schema.SObjectField> {
            CacheSetting__mdt.DeveloperName, 
            CacheSetting__mdt.ClassName__c, 
            CacheSetting__mdt.IsActive__c
        };
    }
}
