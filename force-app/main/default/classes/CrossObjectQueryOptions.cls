/**
 * @File Name          : CrossObjectQueryOptions.cls
 * @Description        : 
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/7/2020, 9:34:30 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/23/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class CrossObjectQueryOptions {
    @TestVisible
    private static final String NULL_RELATION_NAME = 'Invalid cross object query options: NULL relation name.';
    @TestVisible
    private static final String NULL_RELATION_FIELDS = 'Invalid cross object query options: NULL relation fields.';
    @TestVisible
    private String relationName;
    @TestVisible
    private IFieldSet relationFields;

    public CrossObjectQueryOptions(String relationName, IFieldSet relationFields) {
        this.relationName = relationName;
        this.relationFields = relationFields;
        this.validate();
    }

    /**
    * @description Generates the soql for the cross object fields
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
    }
}
