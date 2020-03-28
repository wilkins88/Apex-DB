/**
 * @File Name          : SObjectTriggerSettingSelector.cls
 * @Description        : Simple Selector for pulling in sObject Trigger Settings
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/28/2020, 9:54:59 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/22/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class SObjectTriggerSettingSelector implements ISelector {

    public Schema.SObjectType getSObjectType() {
        return SObjectTriggerSetting__mdt.getSObjectType();
    }

    public List<Schema.SObjectField> getSObjectFields() {
        return new List<Schema.SObjectField> {
            SObjectTriggerSetting__mdt.SObjectType__c, SObjectTriggerSetting__mdt.IsActive__c
        };
    }
}
