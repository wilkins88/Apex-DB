/**
 * @File Name          : SimpleSoqlConditionTest.cls
 * @Description        : 
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/1/2020, 11:51:04 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/1/2020   Thomas Wilkins     Initial Version
**/
@IsTest
private class SimpleSoqlConditionTest {

    // These test will provide various inputs to make sure the helpers work
    // the query condition might not be valid (type mismatch), but that is not
    // the purpose

    @IsTest
    private static void constructor_valuesProvided_valuesSet() {
        SimpleSoqlCondition condition;
        System.Test.startTest();
        condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        System.Test.stopTest();

        System.assertEquals('Id', condition.fieldName);
        System.assertEquals(false, condition.isNotLike);
    }

    @IsTest
    private static void getConditionString_Equals_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        // test with a string
        strValue = condition.isEqualTo('12345').getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id = \'12345\'', strValue);
    }

    @IsTest
    private static void getConditionString_NotEquals_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.isNotEqualTo(1).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id != 1', strValue);
    }

    @IsTest
    private static void getConditionString_gt_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.isGreaterThan(Date.newInstance(2019, 5, 10)).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id > 2019-05-10', strValue);
    }

    @IsTest
    private static void getConditionString_gte_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        Datetime dt = Datetime.newInstanceGmt(2019, 5, 10, 15, 30, 55);
        System.debug(dt);
        String strValue;
        System.Test.startTest();
        strValue = condition.isGreaterThanOrEqualTo(dt).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id >= 2019-05-10T15:30:55Z', strValue);
    }

    @IsTest
    private static void getConditionString_isInList_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsIn(new List<Integer> { 1 }).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id IN (1)', strValue);
    }

    @IsTest
    private static void getConditionString_isInSetId_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        Id mockId = PSVC_MockUtils.getMockId(ServiceAppointment.getSObjectType());
        String strValue;
        System.Test.startTest();
        strValue = condition.IsIn(new Set<Id> { mockId }).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id IN (\'' + mockId + '\')', strValue);
    }

    @IsTest
    private static void getConditionString_isInSetString_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsIn(new Set<String> { '1234' }).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id IN (\'1234\')', strValue);
    }

    @IsTest
    private static void getConditionString_isInSetInteger_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsIn(new Set<Integer> { 1 }).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id IN (1)', strValue);
    }

    @IsTest
    private static void getConditionString_isInSetDouble_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsIn(new Set<Double> { 1.0 }).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id IN (1.0)', strValue);
    }

    @IsTest
    private static void getConditionString_isInSetDecimal_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsIn(new Set<Double> { 1.0 }).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id IN (1.0)', strValue);
    }

    @IsTest
    private static void getConditionString_isInSetDate_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        Date d1 = Date.newInstance(2019, 5 ,10);
        Date d2 = Date.newInstance(2020, 6, 3);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsIn(new Set<Date> { d1, d2 }).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id IN (2019-05-10,2020-06-03)', strValue);
    }

    @IsTest
    private static void getConditionString_isInSetDatetime_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        Datetime d1 = Datetime.newInstanceGmt(2019, 5 ,10, 5, 0, 0);
        Datetime d2 = Datetime.newInstanceGmt(2020, 6, 3, 0, 0, 0);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsIn(new Set<Datetime> { d1, d2 }).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id IN (2019-05-10T05:00:00Z,2020-06-03T00:00:00Z)', strValue);
    }

    @IsTest
    private static void getConditionString_isInSetBoolean_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsIn(new Set<Boolean> { true, false }).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id IN (true,false)', strValue);
    }

    @IsTest
    private static void getConditionString_IsNotInList_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.isNotIn(new List<Integer> { 1 }).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id NOT IN (1)', strValue);
    }

    @IsTest
    private static void getConditionString_IsNotInSetId_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        Id mockId = PSVC_MockUtils.getMockId(ServiceAppointment.getSObjectType());
        String strValue;
        System.Test.startTest();
        strValue = condition.IsNotIn(new Set<Id> { mockId }).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id NOT IN (\'' + mockId + '\')', strValue);
    }

    @IsTest
    private static void getConditionString_IsNotInSetString_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsNotIn(new Set<String> { '1234' }).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id NOT IN (\'1234\')', strValue);
    }

    @IsTest
    private static void getConditionString_IsNotInSetInteger_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsNotIn(new Set<Integer> { 1 }).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id NOT IN (1)', strValue);
    }

    @IsTest
    private static void getConditionString_IsNotInSetDouble_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsNotIn(new Set<Double> { 1.0 }).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id NOT IN (1.0)', strValue);
    }

    @IsTest
    private static void getConditionString_IsNotInSetDecimal_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsNotIn(new Set<Double> { 1.0 }).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id NOT IN (1.0)', strValue);
    }

    @IsTest
    private static void getConditionString_IsNotInSetDate_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        Date d1 = Date.newInstance(2019, 5 ,10);
        Date d2 = Date.newInstance(2020, 6, 3);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsNotIn(new Set<Date> { d1, d2 }).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id NOT IN (2019-05-10,2020-06-03)', strValue);
    }

    @IsTest
    private static void getConditionString_IsNotInSetDatetime_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        Datetime d1 = Datetime.newInstanceGmt(2019, 5 ,10, 5, 0, 0);
        Datetime d2 = Datetime.newInstanceGmt(2020, 6, 3, 0, 0, 0);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsNotIn(new Set<Datetime> { d1, d2 }).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id NOT IN (2019-05-10T05:00:00Z,2020-06-03T00:00:00Z)', strValue);
    }

    @IsTest
    private static void getConditionString_isNotInSetBoolean_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsNotIn(new Set<Boolean> { true, false }).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id NOT IN (true,false)', strValue);
    }

    @IsTest
    private static void getConditionString_isLike_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.isLike('%item%').getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id LIKE \'%item%\'', strValue);
    }

    @IsTest
    private static void getConditionString_lt_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.isLessThan(1).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id < 1', strValue);
    }

    @IsTest
    private static void getConditionString_includes_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.includes(new Set<String> { '\'A value' }).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id INCLUDES (\'\\\'A value\')', strValue);
    }

    @IsTest
    private static void getConditionString_lte_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.isLessThanOrEqualTo(1.0).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id <= 1.0', strValue);
    }

    @IsTest
    private static void getConditionString_excludes_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.excludes(new Set<String> { 'a value' }).getConditionString();
        System.Test.stopTest();

        System.assertEquals('Id EXCLUDES (\'a value\')', strValue);
    }

    @IsTest
    private static void getConditionString_NotLike_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.isNotLike('string').getConditionString();
        System.Test.stopTest();

        System.assertEquals('NOT Id LIKE \'string\'', strValue);
    }

	@IsTest
	private static void getConditionString_notAllFieldsPopulated_throwException() {
		SimpleSoqlCondition condition = new SimpleSoqlCondition(ServiceAppointment.Id);
		String msg;
		System.Test.startTest();
		try {
			condition.getConditionString();
		} catch (SimpleSoqlConditionException e) {
			msg = e.getMessage();
		}
		System.Test.stopTest();

		System.assertEquals(SimpleSoqlCondition.MISSING_CONDITION_DETAILS, msg);
	}
}