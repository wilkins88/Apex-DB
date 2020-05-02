/**
 * @File Name          : SoqlOrderingTest.cls
 * @Description        : 
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/2/2020, 2:56:35 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/2/2020   Thomas Wilkins     Initial Version
**/
@IsTest
private class SoqlOrderingTest {
    @IsTest 
    private static void constructor_noNullOrder_setVars() {
        SoqlOrdering ordering;
        System.Test.startTest();
        ordering = new SoqlOrdering(ServiceAppointment.Id, SoqlOrdering.SortOrder.ASCENDING);
        System.Test.stopTest();
        System.assertEquals('Id', ordering.fieldToSortBy);
        System.assertEquals(SoqlOrdering.SortOrder.ASCENDING, ordering.direction);
        System.assertEquals(null, ordering.nullOrdering);
    }

    @IsTest
    private static void constructor_withNullOrder_setVars() {
        SoqlOrdering ordering;
        System.Test.startTest();
        ordering = new SoqlOrdering(
            ServiceAppointment.Id, 
            SoqlOrdering.SortOrder.ASCENDING,
            SoqlOrdering.NullsOrder.FIRST
        );
        System.Test.stopTest();
        System.assertEquals('Id', ordering.fieldToSortBy);
        System.assertEquals(SoqlOrdering.SortOrder.ASCENDING, ordering.direction);
        System.assertEquals(SoqlOrdering.NullsOrder.FIRST, ordering.nullOrdering);
    }

    @IsTest 
    private static void toString_ascNoNull_ValidString() {
        SoqlOrdering ordering = new SoqlOrdering(
            ServiceAppointment.Id, 
            SoqlOrdering.SortOrder.ASCENDING,
            null
        );
        String orderString;
        System.Test.startTest();
        orderString = ordering.toString();
        System.Test.stopTest();

        System.assertEquals('Id ASC', orderString);
    }

    @IsTest 
    private static void toString_NoDirectionNoNull_ValidString() {
        SoqlOrdering ordering = new SoqlOrdering(
            ServiceAppointment.Id, 
            null,
            null
        );
        String orderString;
        System.Test.startTest();
        orderString = ordering.toString();
        System.Test.stopTest();

        System.assertEquals('Id ASC', orderString);
    }

    @IsTest 
    private static void toString_descNoNull_ValidString() {
        SoqlOrdering ordering = new SoqlOrdering(
            ServiceAppointment.Id, 
            SoqlOrdering.SortOrder.DESCENDING,
            null
        );
        String orderString;
        System.Test.startTest();
        orderString = ordering.toString();
        System.Test.stopTest();

        System.assertEquals('Id DESC', orderString);
    }

    @IsTest 
    private static void toString_ascNullsFirst_ValidString() {
        SoqlOrdering ordering = new SoqlOrdering(
            ServiceAppointment.Id, 
            SoqlOrdering.SortOrder.ASCENDING,
            SoqlOrdering.NullsOrder.FIRST
        );
        String orderString;
        System.Test.startTest();
        orderString = ordering.toString();
        System.Test.stopTest();

        System.assertEquals('Id ASC NULLS FIRST', orderString);
    }

    @IsTest 
    private static void toString_ascNullsLast_ValidString() {
        SoqlOrdering ordering = new SoqlOrdering(
            ServiceAppointment.Id, 
            SoqlOrdering.SortOrder.ASCENDING,
            SoqlOrdering.NullsOrder.LAST
        );
        String orderString;
        System.Test.startTest();
        orderString = ordering.toString();
        System.Test.stopTest();

        System.assertEquals('Id ASC NULLS LAST', orderString);
    }
}
