/**
 * @File Name          : RelatedListQueryOptions.cls
 * @Description        : Class to encapsulated related list query options
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 4/18/2020, 2:07:44 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/23/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class RelatedListQueryOptions {
    @TestVisible
    private String relatedListName;
    @TestVisible
    private IFieldSet fieldSet;

    public RelatedListQueryOptions(String relatedListName, IFieldSet fieldSet) {
        this.relatedListName = relatedListName;
        this.fieldSet = fieldSet;
    }
}
