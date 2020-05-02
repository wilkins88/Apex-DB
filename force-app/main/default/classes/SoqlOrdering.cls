/**
 * @File Name          : SoqlOrdering.cls
 * @Description        : Ordering compoenent for standard soql queries
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/2/2020, 2:57:56 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/2/2020   Thomas Wilkins     Initial Version
**/
public with sharing class SoqlOrdering {
    public enum SortOrder { ASCENDING, DESCENDING }
    public enum NullsOrder { FIRST, LAST }

    private static final String TEMPLATE = '{0}{1}{2}';

    @TestVisible
    private SoqlOrdering.SortOrder direction;
    @TestVisible
    private SoqlOrdering.NullsOrder nullOrdering;
    @TestVisible
    private String fieldToSortBy;

    public SoqlOrdering(Schema.SObjectField fieldToSortBy, SoqlOrdering.SortOrder direction) {
        this(fieldToSortBy, direction, null);
    }

    public SoqlOrdering(
        Schema.SObjectField fieldToSortBy, 
        SoqlOrdering.SortOrder direction,
        SoqlOrdering.NullsOrder nullOrdering 
    ) {
        this.fieldToSortBy = String.valueOf(fieldToSortBy);
        this.direction = direction;
        this.nullOrdering = nullOrdering;
    }

    public override String toString() {
        return String.format(TEMPLATE, new List<String> {
            this.fieldToSortBy, 
            this.direction == SoqlOrdering.SortOrder.DESCENDING ? ' DESC' : ' ASC',
            nullOrdering == null ? 
                '' : (this.nullOrdering == SoqlOrdering.NullsOrder.FIRST ? 
                ' NULLS FIRST' : ' NULLS LAST')
        });
    }
}
