/**
 * @File Name          : CacheQueryOptionsBuilder.cls
 * @Description        : Query Options builder for cache settings
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/28/2020, 11:59:17 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/28/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class CacheQueryOptionsBuilder implements IQueryOptionsBuilder {
    @TestVisible
    private String cacheName;
    @TestVisible
    private QueryOptions options;
    
    public CacheQueryOptionsBuilder(String cacheName) {
        this.cacheName = cacheName;
        this.options = new QueryOptions();
    }

    public IQueryOptionsBuilder setPrimarySelector() {
        this.options.setPrimarySelector(new CacheSettingsSelector());
        return this;
    } 

    public IQueryOptionsBuilder setCrossObjectQueries() {
        // no cross object query here
        return this;
    }

    public IQueryOptionsBuilder setRelatedListQueries() {
        // no related list query here
        return this;
    }

    public IQueryOptionsBuilder setSoqlCondition() {
        ComplexSoqlCondition condition = new ComplexSoqlCondition((new SimpleSoqlCondition(SObjectTriggerSetting__mdt.IsActive__c)).isEqualTo(true))
            .addAndCondition((new SimpleSoqlCondition(SObjectTriggerSetting__mdt.SObjectType__c)).isEqualTo(cacheName));
        this.options.setSoqlCondition(condition);
        return this;
    }

    public IQueryOptions getQueryOptions() {
        return this.options;
    }

}

