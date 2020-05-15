/**
 * @File Name          : ParentObjectQueryOptions.cls
 * @Description        : 
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/14/2020, 6:12:08 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/23/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class ParentObjectQueryOptions {
    @TestVisible
    private static final String NULL_RELATION_NAME = 'Invalid parent object query options: NULL relation name.';
    @TestVisible
    private static final String NULL_RELATION_FIELDS = 'Invalid parent object query options: NULL relation fields.';
    @TestVisible
    private static final String NULL_SOBJECT_TYPE = 'Invalid parent object query options: NULL sObject type.';
    @TestVisible
    private static final String SOBJECT_TYPE_MISMATCH = 'Invalid parent object query options: Relation sObject Type does not match field set sObject Type.';
    @TestVisible
    private String relationName;
    @TestVisible
    private IFieldSet relationFields;
    @TestVisible
    private Schema.SObjectType relationSObjType;

    public ParentObjectQueryOptions(String relationName, Schema.SObjectType relationSObjType, IFieldSet relationFields) {
        this.relationName = relationName;
        this.relationFields = relationFields;
        this.relationSObjType = relationSObjType;
        this.validate();
    }

    /**
    * @description Generates the soql for the parent object fields
    * @author Thomas Wilkins | 5/7/2020 
    * @return String 
    **/
    public override String toString() {
        List<String> queryFields = new List<String>();
        for (Schema.SObjectField field : this.relationFields.getSObjectFields()) {
            queryFields.add(this.relationName + '.' + String.valueOf(field));
        }
        return String.join(queryFields, ',');
    }

    /**
    * @description Helper that validates query option input
    * @author Thomas Wilkins | 5/7/2020 
    * @return void 
    **/
    private void validate() {
        if (this.relationName == null) throw new SoqlException(NULL_RELATION_NAME);
        if (this.relationFields == null) throw new SoqlException(NULL_RELATION_FIELDS);
        if (this.relationSObjType == null) throw new SoqlException(NULL_SOBJECT_TYPE);
        if (this.relationSObjType != relationFields.getSObjectType()) throw new SoqlException(SOBJECT_TYPE_MISMATCH);
    }
}
