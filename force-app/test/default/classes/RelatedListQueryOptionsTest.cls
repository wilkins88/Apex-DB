/**
 * @File Name          : RelatedListQueryOptionsTest.cls
 * @Description        : 
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/14/2020, 11:43:29 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/14/2020   Thomas Wilkins     Initial Version
**/
@IsTest
private class RelatedListQueryOptionsTest {
    @IsTest
    private static void constructor_correctInputs_success() {
        RelatedListQueryOptions options;
        System.Test.startTest();
        options = new RelatedListQueryOptions('Account', Account.getSObjectType(), new FieldSetMock(true));
        System.Test.stopTest();
        System.assertEquals('Account', options.relatedListName);
        System.assertEquals(1, options.relatedListFields.getSObjectFields().size());
    }

    @IsTest
    private static void constructor_nullrelatedListName_throwError() {
        String err;
        System.Test.startTest();
        try {
            RelatedListQueryOptions options = new RelatedListQueryOptions(null, null, null);
        } catch (SoqlException e) {
            err = e.getMessage();
        }
        System.Test.stopTest();
        System.assertEquals(RelatedListQueryOptions.NULL_RELATION_NAME, err);
    }

    @IsTest
    private static void constructor_nullrelatedListFields_throwError() {
        String err;
        System.Test.startTest();
        try {
            RelatedListQueryOptions options = new RelatedListQueryOptions('Account', null, null);
        } catch (SoqlException e) {
            err = e.getMessage();
        }
        System.Test.stopTest();
        System.assertEquals(RelatedListQueryOptions.NULL_RELATION_FIELDS, err);
    }

    @IsTest
    private static void constructor_nullRelationSObjectType_throwError() {
        String err;
        System.Test.startTest();
        try {
            RelatedListQueryOptions options = new RelatedListQueryOptions('Account', null, new FieldSetMock(true));
        } catch (SoqlException e) {
            err = e.getMessage();
        }
        System.Test.stopTest();
        System.assertEquals(RelatedListQueryOptions.NULL_SOBJECT_TYPE, err);
    }

    @IsTest
    private static void constructor_sObjectTypeMismatch_throwError() {
        String err;
        System.Test.startTest();
        try {
            RelatedListQueryOptions options = new RelatedListQueryOptions('Account', Opportunity.getSObjectType(), new FieldSetMock(true));
        } catch (SoqlException e) {
            err = e.getMessage();
        }
        System.Test.stopTest();
        System.assertEquals(RelatedListQueryOptions.SOBJECT_TYPE_MISMATCH, err);
    }

    @IsTest
    private static void setLimit_setTo1_correctlySet() {
        RelatedListQueryOptions options = new RelatedListQueryOptions('Account', Account.getSObjectType(), new FieldSetMock(true));
        System.Test.startTest();
        options.setLimit(1);
        System.Test.stopTest();
        System.assertEquals(1, options.recordLimit);
    }

    @IsTest
    private static void setOffset_setTo1_correctlySet() {
        RelatedListQueryOptions options = new RelatedListQueryOptions('Account', Account.getSObjectType(), new FieldSetMock(true));
        System.Test.startTest();
        options.setOffset(1);
        System.Test.stopTest();
        System.assertEquals(1, options.recordOffset);
    }

    @IsTest
    private static void addParentObjectQuery_add1_1Stored() {
        RelatedListQueryOptions options = new RelatedListQueryOptions('Account', Account.getSObjectType(), new FieldSetMock(true));
        System.Test.startTest();
        options.addParentObjectQuery(new ParentObjectQueryOptions('ParentAccount', Account.getSObjectType(), new FieldSetMock(true)));
        System.Test.stopTest();
        System.assertEquals(1, options.parentObjectQueries.size());
    }

    @IsTest
    private static void addParentObjectQuery_add2_2Stored() {
        RelatedListQueryOptions options = new RelatedListQueryOptions('Account', Account.getSObjectType(), new FieldSetMock(true));
        System.Test.startTest();
        options.addParentObjectQuery(new ParentObjectQueryOptions('ParentAccount', Account.getSObjectType(), new FieldSetMock(true)));
        options.addParentObjectQuery(new ParentObjectQueryOptions('ParentAccount', Account.getSObjectType(), new FieldSetMock(true)));
        System.Test.stopTest();
        System.assertEquals(2, options.parentObjectQueries.size());
    }

    @IsTest
    private static void setParentObjectQueries_set2_2Stored() {
        RelatedListQueryOptions options = new RelatedListQueryOptions('Account', Account.getSObjectType(), new FieldSetMock(true));
        System.Test.startTest();
        options.setParentObjectQueries(new List<ParentObjectQueryOptions> {
            new ParentObjectQueryOptions('ParentAccount', Account.getSObjectType(), new FieldSetMock(true)),
            new ParentObjectQueryOptions('ParentAccount', Account.getSObjectType(), new FieldSetMock(true))    
        });
        System.Test.stopTest();
        System.assertEquals(2, options.parentObjectQueries.size());
    }

    @IsTest
    private static void clearParentObjectQueries_set2_0Stored() {
        RelatedListQueryOptions options = new RelatedListQueryOptions('Account', Account.getSObjectType(), new FieldSetMock(true));
        options.parentObjectQueries = new List<ParentObjectQueryOptions> {
            new ParentObjectQueryOptions('ParentAccount', Account.getSObjectType(), new FieldSetMock(true)),
            new ParentObjectQueryOptions('ParentAccount', Account.getSObjectType(), new FieldSetMock(true))    
        };
        System.Test.startTest();
        options.clearParentObjectQueries();
        System.Test.stopTest();
        System.assertEquals(0, options.parentObjectQueries.size());
    }

    @IsTest
    private static void toString_simple_correctString() {
        RelatedListQueryOptions options = new RelatedListQueryOptions('Account', Account.getSObjectType(), new FieldSetMock(true));
        String str;
        System.Test.startTest();
        str = options.toString();
        System.Test.stopTest();
        System.assertEquals('(SELECT Name FROM Account)', str);
    }

    @IsTest
    private static void toString_withLimit_correctString() {
        RelatedListQueryOptions options = new RelatedListQueryOptions('Account', Account.getSObjectType(), new FieldSetMock(true));
        options.recordLimit = 1;
        String str;
        System.Test.startTest();
        str = options.toString();
        System.Test.stopTest();
        System.assertEquals('(SELECT Name FROM Account LIMIT 1)', str);
    }

    @IsTest
    private static void toString_withOffset_correctString() {
        RelatedListQueryOptions options = new RelatedListQueryOptions('Account', Account.getSObjectType(), new FieldSetMock(true));
        options.recordOffSet = 1;
        String str;
        System.Test.startTest();
        str = options.toString();
        System.Test.stopTest();
        System.assertEquals('(SELECT Name FROM Account OFFSET 1)', str);
    }

    @IsTest
    private static void toString_withCondition_correctString() {
        RelatedListQueryOptions options = new RelatedListQueryOptions('Account', Account.getSObjectType(), new FieldSetMock(true));
        options.condition = (new SimpleSoqlCondition(Account.Name)).isEqualTo('test');
        String str;
        System.Test.startTest();
        str = options.toString();
        System.Test.stopTest();
        System.assertEquals('(SELECT Name FROM Account WHERE Name = test)', str);
    }

    @IsTest
    private static void toString_withAll_correctString() {
        RelatedListQueryOptions options = new RelatedListQueryOptions('Account', Account.getSObjectType(), new FieldSetMock(true));
        options.condition = (new SimpleSoqlCondition(Account.Name)).isEqualTo('test');
        options.recordLimit = 1;
        options.recordOffset = 1;
        String str;
        System.Test.startTest();
        str = options.toString();
        System.Test.stopTest();
        System.assertEquals('(SELECT Name FROM Account WHERE Name = test LIMIT 1 OFFSET 1)', str);
    }
}
