/**
 * @File Name          : QueryResultsTest.cls
 * @Description        : 
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/2/2020, 9:55:15 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    4/23/2020   Thomas Wilkins     Initial Version
**/
@IsTest
private class QueryResultsTest {
    @IsTest
    private static void constructor_initCorrect() {
        QueryResults res;
        List<SObject> objs = new List<SObject> { new Account() };
        System.Test.startTest();
        res = new QueryResults(objs);
        System.Test.stopTest();
        System.assertEquals(res.count, 1);
        System.assertNotEquals(null, res.results);
    }

    @IsTest
    private static void hasResults_hasResult_returnTrue() {
        List<SObject> objs = new List<SObject> { new Account() };
        QueryResults res = new QueryResults(objs);
        Boolean hasResults;
        System.Test.startTest();
        hasResults = res.hasResults();
        System.Test.stopTest();
        System.assertEquals(true, hasResults);
    }

    @IsTest
    private static void hasResults_noResults_returnFalse() {
        List<SObject> objs = new List<SObject>();
        QueryResults res = new QueryResults(objs);
        Boolean hasResults;
        System.Test.startTest();
        hasResults = res.hasResults();
        System.Test.stopTest();
        System.assertEquals(false, hasResults);
    }

    @IsTest
    private static void getResults_hasResults_returnList() {
        List<SObject> objs = new List<SObject> { new Account() };
        QueryResults res = new QueryResults(objs);
        List<SObject> results;
        System.Test.startTest();
        results = res.getResults();
        System.Test.stopTest();
        System.assertNotEquals(null, results);
        System.assertEquals(1, results.size());
    }

    @IsTest
    private static void getCount_singleArray_return1() {
        List<SObject> objs = new List<SObject> { new Account() };
        QueryResults res = new QueryResults(objs);
        Integer count;
        System.Test.startTest();
        count = res.getCount();
        System.Test.stopTest();
        System.assertEquals(1, count);
    }
}
