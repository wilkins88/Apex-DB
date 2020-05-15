/**
 * @File Name          : RelatedListQueryOptions.cls
 * @Description        : Class to encapsulated related list query options
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/14/2020, 11:44:33 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/23/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class RelatedListQueryOptions {
    @TestVisible
    private static final String NULL_RELATION_NAME = 'Invalid related list query options: NULL relation name.';
    @TestVisible
    private static final String NULL_RELATION_FIELDS = 'Invalid related list query options: NULL relation fields.';
    @TestVisible
    private static final String NULL_SOBJECT_TYPE = 'Invalid related list query options: NULL sObject type.';
    @TestVisible
    private static final String SOBJECT_TYPE_MISMATCH = 'Invalid related list query options: Relation sObject Type does not match field set sObject Type.';

    @TestVisible
    private String relatedListName;
    @TestVisible
    private IFieldSet relatedListFields;
    @TestVisible
    private ISoqlCondition condition;
    @TestVisible
    private Schema.SObjectType relatedListSObjType;
    @TestVisible
    private Integer recordLimit;
    @TestVisible
    private Integer recordOffset;
    @TestVisible
    private List<ParentObjectQueryOptions> parentObjectQueries {
        get {
            if (this.parentObjectQueries == null) this.parentObjectQueries = new List<ParentObjectQueryOptions>();
            return this.parentObjectQueries;
        } set;
    }

    public RelatedListQueryOptions(String relatedListName, Schema.SObjectType relatedListSobjType, IFieldSet relatedListFields) {
        this.relatedListName = relatedListName;
        this.relatedListFields = relatedListFields;
        this.relatedListSObjType = relatedListSObjType;
        this.validate();
    }

    /**
    * @description Sets the LIMIT value
    * @author Thomas Wilkins | 5/14/2020 
    * @param recordLimit limit of records for a related list query
    * @return RelatedListQueryOptions 
    **/
    public RelatedListQueryOptions setLimit(Integer recordLimit) {
        this.recordLimit = recordLimit;
        return this;
    }

    /**
    * @description Sets the OFFSET value, can only be used if the top level query has a LIMIT 1 in place
    * @author Thomas Wilkins | 5/14/2020 
    * @param recordOffset the offset of the related list
    * @return RelatedListQueryOptions 
    **/
    public RelatedListQueryOptions setOffset(Integer recordOffset) {
        this.recordOffset = recordOffset;
        return this;
    }

    /**
    * @description Adds a parent object query option
    * @author Thomas Wilkins | 5/14/2020 
    * @param option parent object query options to add
    * @return RelatedListQueryOptions 
    **/
    public RelatedListQueryOptions addParentObjectQuery(ParentObjectQueryOptions option) {
        this.parentObjectQueries.add(option);
        return this;
    }

    /**
    * @description Sets the parent object query options
    * @author Thomas Wilkins | 5/14/2020 
    * @param options parent object query options
    * @return RelatedListQueryOptions 
    **/
    public RelatedListQueryOptions setParentObjectQueries(List<ParentObjectQueryOptions> options) {
        this.parentObjectQueries = options;
        return this;
    }

    /**
    * @description 
    * @author Thomas Wilkins | 5/14/2020 
    * @param condition 
    * @return RelatedListQueryOptions 
    **/
    public RelatedListQueryOptions setSoqlCondition(ISoqlCondition condition) {
        this.condition = condition;
        return this;
    }

    /**
    * @description Crealtes (removes) all parent object query options
    * @author Thomas Wilkins | 5/14/2020 
    * @return RelatedListQueryOptions 
    **/
    public RelatedListQueryOptions clearParentObjectQueries() {
        this.parentObjectQueries.clear();
        return this;
    }

    public override String toString() {
        String str = '(SELECT ';
        str += StringUtils.join(this.relatedListFields.getSObjectFields(), ',');
        str += ' FROM ' + this.relatedListName;
        if (this.condition != null) str += ' WHERE ' + this.condition.toSoql();
        if (this.recordLimit != null) str += ' LIMIT ' + this.recordLimit;
        if (this.recordOffset != null) str += ' OFFSET ' + this.recordOffset;
        str += ')';
        return str;
    }

    /**
    * @description Helper method to validate constructor inputs
    * @author Thomas Wilkins | 5/14/2020 
    * @return void 
    **/
    private void validate() {
        if (this.relatedListName == null) throw new SoqlException(NULL_RELATION_NAME);
        if (this.relatedListFields == null) throw new SoqlException(NULL_RELATION_FIELDS);
        if (this.relatedListSObjType == null) throw new SoqlException(NULL_SOBJECT_TYPE);
        if (this.relatedListSObjType != relatedListFields.getSObjectType()) throw new SoqlException(SOBJECT_TYPE_MISMATCH);
    }
}
