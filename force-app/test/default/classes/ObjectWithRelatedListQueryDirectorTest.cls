/**
 * @File Name          : ObjectWithRelatedListQueryDirectorTest.cls
 * @Description        : 
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/14/2020, 8:18:12 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/7/2020   Thomas Wilkins     Initial Version
**/
@IsTest
private class ObjectWithRelatedListQueryDirectorTest {
    @IsTest
    private static void testConstruct_mockBuilder_buildSuccess() {
        StandardQueryOptionsBuilderMock mock = new StandardQueryOptionsBuilderMock();
        ObjectWithRelatedListQueryDirector director = new ObjectWithRelatedListQueryDirector(mock);
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