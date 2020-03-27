/**
 * @File Name          : TriggerSettingsQueryOptionsBuilder.cls
 * @Description        : QueryOptions builder for getting trigger handler settings
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/27/2020, 12:12:40 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/27/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class TriggerSettingsQueryOptionsBuilder implements IQueryOptionsBuilder {
    @TestVisible
    private String sObjType;
    @TestVisible
    private QueryOptions options;

    public TriggerSettingsQueryOptionsBuilder(Schema.SObjectType sObjType) {
        this.sObjType = String.valueOf(sObjType);
        this.options = new QueryOptions();
    }

    public IQueryOptionsBuilder setPrimarySelector() {
        this.options.setPrimarySelector(new SObjectTriggerSettingSelector());
        return this;
    } 

    public IQueryOptionsBuilder setCrossObjectQueries() {
        // no cross object query here
        return this;
    }

    public IQueryOptionsBuilder setRelatedListQueries() {
        RelatedListQueryOptions triggerHandlerOptions = new RelatedListQueryOptions('TriggerHandlerSettings__r', new TriggerHandlerSettingSelector());
        // TODO filtering in related lists
        this.options.addRelatedListQuery(triggerHandlerOptions);
        return this;
    }

    public IQueryOptionsBuilder setSoqlCondition() {
        ComplexSoqlCondition condition = new ComplexSoqlCondition((new SimpleSoqlCondition(SObjectTriggerSetting__mdt.IsActive__c)).isEqualTo(true))
            .addAndCondition((new SimpleSoqlCondition(SObjectTriggerSetting__mdt.SObjectType__c)).isEqualTo(sObjType));
        this.options.setSoqlCondition(condition);
        return this;
    }

    public IQueryOptions getQueryOptions() {
        return this.options;
    }
}
