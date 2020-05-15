/**
 * @File Name          : StandardQueryOptionsBuilderMock.cls
 * @Description        : 
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/14/2020, 8:22:42 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/4/2020   Thomas Wilkins     Initial Version
**/
@IsTest
public inherited sharing class StandardQueryOptionsBuilderMock extends StandardQueryOptionsBuilder {
    @TestVisible
    private Boolean hasSetFields, hasSetParentObjectQuery, hasSetRelatedListQuery,
        hasSetSoqlCondition, hasSetLimit, hasSetOffset, hasSetOrdering;
        
    public override StandardQueryOptionsBuilder setSoqlCondition() {
        this.hasSetSoqlCondition = true;
        return this;
    }

    public override StandardQueryOptionsBuilder setOffset() {
        this.hasSetOffset = true;
        return this;
    }

    public override StandardQueryOptionsBuilder setPrimaryFieldSet() {
        this.fieldSet = new FieldSetMock();
        this.hasSetFields = true;
        return this;
    }

    public override StandardQueryOptionsBuilder setRelatedListQueryOptions() {
        this.hasSetRelatedListQuery = true;
        return this;
    }

    public override StandardQueryOptionsBuilder setParentObjectQueryOptions() {
        this.hasSetParentObjectQuery = true;
        return this;
    }

    public override StandardQueryOptionsBuilder setLimit() {
        this.hasSetLimit = true;
        return this;
    }

    public override StandardQueryOptionsBuilder setOrdering() {
        this.hasSetOrdering = true;
        return this;
    }

    public inherited sharing class FieldSetMock implements IFieldSet {
        public Schema.SObjectType getSObjectType() {
            return Account.getSObjectType();
        }

        public List<Schema.SObjectField> getSObjectFields() {
            return new List<Schema.SObjectField>();
        }
    }
}
