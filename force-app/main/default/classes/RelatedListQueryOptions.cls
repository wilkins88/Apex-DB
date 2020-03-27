/**
 * @File Name          : RelatedListQueryOptions.cls
 * @Description        : Class to encapsulated related list query options
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/23/2020, 4:49:20 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/23/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class RelatedListQueryOptions {
    @TestVisible
    private String relatedListName;
    @TestVisible
    private ISelector relatedListSelector;

    public RelatedListQueryOptions(String relatedListName, ISelector relatedListSelector) {
        this.relatedListName = relatedListName;
        this.relatedListSelector = relatedListSelector;
    }
}
