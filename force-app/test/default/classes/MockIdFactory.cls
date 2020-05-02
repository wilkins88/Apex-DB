/**
 * @File Name          : MockIdFactory.cls
 * @Description        : Factory for generating mock ids, useful when wanting to test logic without conducting DML
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/2/2020, 10:14:01 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/2/2020   Thomas Wilkins     Initial Version
**/
@IsTest
public inherited sharing class MockIdFactory {

    private static Integer counter = 1;

    /**
    * @description Returns a mock id for the provided sobject type
    * @author Thomas Wilkins | 5/2/2020 
    * @param sObjType the type of sobject to generate a mock id for
    * @return Id 
    **/
    public Id getMockId(Schema.SObjectType sObjType) {
        String result = String.valueOf(counter++);
        return sObjType.getDescribe().getKeyPrefix() + 
            '0'.repeat(12 - result.length()) + result;
    }
}
