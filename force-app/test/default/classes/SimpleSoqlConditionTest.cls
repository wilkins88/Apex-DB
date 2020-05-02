/**
 * @File Name          : SimpleSoqlConditionTest.cls
 * @Description        : 
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/2/2020, 10:09:16 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/1/2020   Thomas Wilkins     Initial Version
**/
@IsTest
private class SimpleSoqlConditionTest {

    private static MockIdFactory fact = new MockIdFactory();

    // These test will provide various inputs to make sure the helpers work
    // the query condition might not be valid (type mismatch), but that is not
    // the purpose

    @IsTest
    private static void constructor_valuesProvided_valuesSet() {
        SimpleSoqlCondition condition;
        System.Test.startTest();
        condition = new SimpleSoqlCondition(Account.Id);
        System.Test.stopTest();

        System.assertEquals('Id', condition.fieldName);
        System.assertEquals(false, condition.isNotLike);
    }

    @IsTest
    private static void toSoql_Equals_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        // test with a string
        strValue = condition.isEqualTo('12345').toSoql();
        System.Test.stopTest();

        System.assertEquals('Id = \'12345\'', strValue);
    }

    @IsTest
    private static void toSoql_NotEquals_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.isNotEqualTo(1).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id != 1', strValue);
    }

    @IsTest
    private static void toSoql_gt_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.isGreaterThan(Date.newInstance(2019, 5, 10)).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id > 2019-05-10', strValue);
    }

    @IsTest
    private static void toSoql_gte_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        Datetime dt = Datetime.newInstanceGmt(2019, 5, 10, 15, 30, 55);
        System.debug(dt);
        String strValue;
        System.Test.startTest();
        strValue = condition.isGreaterThanOrEqualTo(dt).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id >= 2019-05-10T15:30:55Z', strValue);
    }

    @IsTest
    private static void toSoql_isInList_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsIn(new List<Integer> { 1 }).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id IN (1)', strValue);
    }

    @IsTest
    private static void toSoql_isInSetId_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        Id mockId = fact.getMockId(Account.getSObjectType());
        String strValue;
        System.Test.startTest();
        strValue = condition.IsIn(new Set<Id> { mockId }).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id IN (\'' + mockId + '\')', strValue);
    }

    @IsTest
    private static void toSoql_isInSetString_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsIn(new Set<String> { '1234' }).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id IN (\'1234\')', strValue);
    }

    @IsTest
    private static void toSoql_isInSetInteger_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsIn(new Set<Integer> { 1 }).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id IN (1)', strValue);
    }

    @IsTest
    private static void toSoql_isInSetDouble_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsIn(new Set<Double> { 1.0 }).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id IN (1.0)', strValue);
    }

    @IsTest
    private static void toSoql_isInSetDecimal_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsIn(new Set<Double> { 1.0 }).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id IN (1.0)', strValue);
    }

    @IsTest
    private static void toSoql_isInSetDate_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        Date d1 = Date.newInstance(2019, 5 ,10);
        Date d2 = Date.newInstance(2020, 6, 3);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsIn(new Set<Date> { d1, d2 }).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id IN (2019-05-10,2020-06-03)', strValue);
    }

    @IsTest
    private static void toSoql_isInSetDatetime_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        Datetime d1 = Datetime.newInstanceGmt(2019, 5 ,10, 5, 0, 0);
        Datetime d2 = Datetime.newInstanceGmt(2020, 6, 3, 0, 0, 0);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsIn(new Set<Datetime> { d1, d2 }).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id IN (2019-05-10T05:00:00Z,2020-06-03T00:00:00Z)', strValue);
    }

    @IsTest
    private static void toSoql_isInSetBoolean_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsIn(new Set<Boolean> { true, false }).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id IN (true,false)', strValue);
    }

    @IsTest
    private static void toSoql_IsNotInList_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.isNotIn(new List<Integer> { 1 }).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id NOT IN (1)', strValue);
    }

    @IsTest
    private static void toSoql_IsNotInSetId_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        Id mockId = fact.getMockId(Account.getSObjectType());
        String strValue;
        System.Test.startTest();
        strValue = condition.IsNotIn(new Set<Id> { mockId }).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id NOT IN (\'' + mockId + '\')', strValue);
    }

    @IsTest
    private static void toSoql_IsNotInSetString_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsNotIn(new Set<String> { '1234' }).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id NOT IN (\'1234\')', strValue);
    }

    @IsTest
    private static void toSoql_IsNotInSetInteger_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsNotIn(new Set<Integer> { 1 }).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id NOT IN (1)', strValue);
    }

    @IsTest
    private static void toSoql_IsNotInSetDouble_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsNotIn(new Set<Double> { 1.0 }).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id NOT IN (1.0)', strValue);
    }

    @IsTest
    private static void toSoql_IsNotInSetDecimal_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsNotIn(new Set<Double> { 1.0 }).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id NOT IN (1.0)', strValue);
    }

    @IsTest
    private static void toSoql_IsNotInSetDate_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        Date d1 = Date.newInstance(2019, 5 ,10);
        Date d2 = Date.newInstance(2020, 6, 3);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsNotIn(new Set<Date> { d1, d2 }).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id NOT IN (2019-05-10,2020-06-03)', strValue);
    }

    @IsTest
    private static void toSoql_IsNotInSetDatetime_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        Datetime d1 = Datetime.newInstanceGmt(2019, 5 ,10, 5, 0, 0);
        Datetime d2 = Datetime.newInstanceGmt(2020, 6, 3, 0, 0, 0);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsNotIn(new Set<Datetime> { d1, d2 }).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id NOT IN (2019-05-10T05:00:00Z,2020-06-03T00:00:00Z)', strValue);
    }

    @IsTest
    private static void toSoql_isNotInSetBoolean_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.IsNotIn(new Set<Boolean> { true, false }).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id NOT IN (true,false)', strValue);
    }

    @IsTest
    private static void toSoql_isLike_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.isLike('%item%').toSoql();
        System.Test.stopTest();

        System.assertEquals('Id LIKE \'%item%\'', strValue);
    }

    @IsTest
    private static void toSoql_lt_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.isLessThan(1).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id < 1', strValue);
    }

    @IsTest
    private static void toSoql_includes_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.includes(new Set<String> { '\'A value' }).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id INCLUDES (\'\\\'A value\')', strValue);
    }

    @IsTest
    private static void toSoql_lte_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.isLessThanOrEqualTo(1.0).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id <= 1.0', strValue);
    }

    @IsTest
    private static void toSoql_excludes_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.excludes(new Set<String> { 'a value' }).toSoql();
        System.Test.stopTest();

        System.assertEquals('Id EXCLUDES (\'a value\')', strValue);
    }

    @IsTest
    private static void toSoql_NotLike_ValidString() {
        SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
        String strValue;
        System.Test.startTest();
        strValue = condition.isNotLike('string').toSoql();
        System.Test.stopTest();

        System.assertEquals('NOT Id LIKE \'string\'', strValue);
    }

	@IsTest
	private static void toSoql_notAllFieldsPopulated_throwException() {
		SimpleSoqlCondition condition = new SimpleSoqlCondition(Account.Id);
		String msg;
		System.Test.startTest();
		try {
			condition.toSoql();
		} catch (SoqlException e) {
			msg = e.getMessage();
		}
		System.Test.stopTest();

		System.assertEquals(SimpleSoqlCondition.MISSING_CONDITION_DETAILS, msg);
	}
}