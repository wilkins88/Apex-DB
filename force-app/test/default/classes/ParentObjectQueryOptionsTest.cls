/**
 * @File Name          : ParentObjectQueryOptionsTest.cls
 * @Description        : 
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/14/2020, 10:57:09 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/7/2020   Thomas Wilkins     Initial Version
**/
@IsTest
private class ParentObjectQueryOptionsTest {
    @IsTest
    private static void constructor_correctInputs_success() {
        ParentObjectQueryOptions options;
        System.Test.startTest();
        options = new ParentObjectQueryOptions('Account', Account.getSObjectType(), new FieldSetMock(true));
        System.Test.stopTest();
        System.assertEquals('Account', options.relationName);
        System.assertEquals(1, options.relationFields.getSObjectFields().size());
    }

    @IsTest
    private static void constructor_nullRelationName_throwError() {
        String err;
        System.Test.startTest();
        try {
            ParentObjectQueryOptions options = new ParentObjectQueryOptions(null, null, null);
        } catch (SoqlException e) {
            err = e.getMessage();
        }
        System.Test.stopTest();
        System.assertEquals(ParentObjectQueryOptions.NULL_RELATION_NAME, err);
    }

    @IsTest
    private static void constructor_nullRelationFields_throwError() {
        String err;
        System.Test.startTest();
        try {
            ParentObjectQueryOptions options = new ParentObjectQueryOptions('Account', null, null);
        } catch (SoqlException e) {
            err = e.getMessage();
        }
        System.Test.stopTest();
        System.assertEquals(ParentObjectQueryOptions.NULL_RELATION_FIELDS, err);
    }

    @IsTest
    private static void constructor_nullRelationSObjectType_throwError() {
        String err;
        System.Test.startTest();
        try {
            ParentObjectQueryOptions options = new ParentObjectQueryOptions('Account', null, new FieldSetMock(true));
        } catch (SoqlException e) {
            err = e.getMessage();
        }
        System.Test.stopTest();
        System.assertEquals(ParentObjectQueryOptions.NULL_SOBJECT_TYPE, err);
    }

    @IsTest
    private static void constructor_sObjectTypeMismatch_throwError() {
        String err;
        System.Test.startTest();
        try {
            ParentObjectQueryOptions options = new ParentObjectQueryOptions('Account', Opportunity.getSObjectType(), new FieldSetMock(true));
        } catch (SoqlException e) {
            err = e.getMessage();
        }
        System.Test.stopTest();
        System.assertEquals(ParentObjectQueryOptions.SOBJECT_TYPE_MISMATCH, err);
    }

    @IsTest
    private static void toString_hasValues_returnString() {
        ParentObjectQueryOptions options = new ParentObjectQueryOptions('Account', Account.getSObjectType(), new FieldSetMock(true));
        String str;
        System.Test.startTest();
        str = options.toString();
        System.Test.stopTest();
        System.assertEquals('Account.Name', str);
    }

    @IsTest
    private static void toString_hasNoValues_returnEmptyString() {
        ParentObjectQueryOptions options = new ParentObjectQueryOptions('Account', Account.getSObjectType(), new FieldSetMock(false));
        String str;
        System.Test.startTest();
        str = options.toString();
        System.Test.stopTest();
        System.assertEquals('', str);
    }
}
