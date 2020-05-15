/**
 * @File Name          : FieldSetMock.cls
 * @Description        : 
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/14/2020, 11:06:36 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/14/2020   Thomas Wilkins     Initial Version
**/
@IsTest
public class FieldSetMock implements IFieldSet {
    private Boolean hasFields;
    public FieldSetMock(Boolean hasFields) {
        this.hasFields = hasFields;
    }
    public Schema.SObjectType getSObjectType() {
        return Account.getSObjectType();
    }
    public List<Schema.SObjectField> getSObjectFields() {
        if (this.hasFields) return new List<Schema.SObjectField> { Account.Name };
        else return new List<Schema.SObjectField>(); 
    }
}