/**
 * @File Name          : CrossObjectQueryOptionsTest.cls
 * @Description        : 
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/7/2020, 9:45:49 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/7/2020   Thomas Wilkins     Initial Version
**/
@IsTest
private class CrossObjectQueryOptionsTest {
    @IsTest
    private static void constructor_correctInputs_success() {
        CrossObjectQueryOptions options;
        System.Test.startTest();
        options = new CrossObjectQueryOptions('Account', new MockFieldSet(true));
        System.Test.stopTest();
        System.assertEquals('Account', options.relationName);
        System.assertEquals(1, options.relationFields.getSObjectFields().size());
    }

    @IsTest
    private static void constructor_nullRelationName_throwError() {
        String err;
        System.Test.startTest();
        try {
            CrossObjectQueryOptions options = new CrossObjectQueryOptions(null, null);
        } catch (SoqlException e) {
            err = e.getMessage();
        }
        System.Test.stopTest();
        System.assertEquals(CrossObjectQueryOptions.NULL_RELATION_NAME, err);
    }

    @IsTest
    private static void constructor_nullRelationFields_throwError() {
        String err;
        System.Test.startTest();
        try {
            CrossObjectQueryOptions options = new CrossObjectQueryOptions('Account', null);
        } catch (SoqlException e) {
            err = e.getMessage();
        }
        System.Test.stopTest();
        System.assertEquals(CrossObjectQueryOptions.NULL_RELATION_FIELDS, err);
    }

    @IsTest
    private static void toString_hasValues_returnString() {
        CrossObjectQueryOptions options = new CrossObjectQueryOptions('Account', new MockFieldSet(true));
        String str;
        System.Test.startTest();
        str = options.toString();
        System.Test.stopTest();
        System.assertEquals('Account.Name', str);
    }

    @IsTest
    private static void toString_hasNoValues_returnEmptyString() {
        CrossObjectQueryOptions options = new CrossObjectQueryOptions('Account', new MockFieldSet(false));
        String str;
        System.Test.startTest();
        str = options.toString();
        System.Test.stopTest();
        System.assertEquals('', str);
    }

    private class MockFieldSet implements IFieldSet {
        private Boolean hasFields;
        public MockFieldSet(Boolean hasFields) {
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
}
