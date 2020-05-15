/**
 * @File Name          : StringUtilsTest.cls
 * @Description        : 
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/14/2020, 8:13:26 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/14/2020   Thomas Wilkins     Initial Version
**/
@IsTest
private class StringUtilsTest {
    @IsTest
    private static void join_schemaTypesMultipleObjects_commaDelimitedString() {
        List<Schema.SObjectField> fields = new List<Schema.SObjectField> { Account.Id, Account.Name };
        String str;
        System.Test.startTest();
        str = StringUtils.join(fields, ',');
        System.Test.stopTest();
        System.assertEquals('Id,Name', str);
    }

    @IsTest
    private static void join_schemaTypesSingleObject_commaDelimitedString() {
        List<Schema.SObjectField> fields = new List<Schema.SObjectField> { Account.Id };
        String str;
        System.Test.startTest();
        str = StringUtils.join(fields, ',');
        System.Test.stopTest();
        System.assertEquals('Id', str);
    }

    @IsTest
    private static void join_schemaTypesNoObjects_commaDelimitedString() {
        List<Schema.SObjectField> fields = new List<Schema.SObjectField>();
        String str;
        System.Test.startTest();
        str = StringUtils.join(fields, ',');
        System.Test.stopTest();
        System.assertEquals('', str);
    }
}
