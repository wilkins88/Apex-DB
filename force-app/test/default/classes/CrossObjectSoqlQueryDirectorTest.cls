/**
 * @File Name          : CrossObjectSoqlQueryDirectorTest.cls
 * @Description        : 
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/7/2020, 4:01:23 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/7/2020   Thomas Wilkins     Initial Version
**/
@IsTest
private class CrossObjectSoqlQueryDirectorTest {
    @IsTest
    private static void testConstruct_mockBuilder_buildSuccess() {
        StandardQueryOptionsBuilderMock mock = new StandardQueryOptionsBuilderMock();
        CrossObjectSoqlQueryDirector director = new CrossObjectSoqlQueryDirector(mock);
        IQueryOptions options;
        System.Test.startTest();
        options = director.construct();
        System.Test.stopTest();
        System.assertNotEquals(null, options);
        mock = (StandardQueryOptionsBuilderMock)director.builder;
        System.assert(mock.hasSetFields);
        System.assert(mock.hasSetSoqlCondition);
        System.assert(mock.hasSetOffset);
        System.assert(mock.hasSetLimit);
        System.assert(mock.hasSetOrdering);
        System.assert(mock.hasSetCrossObjectQuery);
    }
}