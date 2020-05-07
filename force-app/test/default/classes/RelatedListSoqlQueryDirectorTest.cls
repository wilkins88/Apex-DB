/**
 * @File Name          : RelatedListSoqlQueryDirectorTest.cls
 * @Description        : 
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/7/2020, 4:00:50 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/7/2020   Thomas Wilkins     Initial Version
**/
@IsTest
private class RelatedListSoqlQueryDirectorTest {
    @IsTest
    private static void testConstruct_mockBuilder_buildSuccess() {
        StandardQueryOptionsBuilderMock mock = new StandardQueryOptionsBuilderMock();
        RelatedListSoqlQueryDirector director = new RelatedListSoqlQueryDirector(mock);
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
        System.assert(mock.hasSetRelatedListQuery);
    }
}