/**
 * @File Name          : TriggerHandlerSettingSelector.cls
 * @Description        : Selector for trigger handler settings
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/23/2020, 4:48:03 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/23/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class TriggerHandlerSettingSelector implements ISelector {
    public Schema.SObjectType getSObjectType() {
        return TriggerHandlerSetting__mdt.getSObjectType();
    }

    public List<Schema.SObjectField> getSObjectFields() {
        return new List<Schema.SObjectField> {
            TriggerHandlerSetting__mdt.ClassName__c, TriggerHandlerSetting__mdt.IsActive__c
        };
    }
}
