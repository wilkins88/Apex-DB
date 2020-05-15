/**
 * @File Name          : QueryOptions.cls
 * @Description        : Query options that are fed into database queries
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/14/2020, 8:21:07 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/23/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class StandardQueryOptions implements IQueryOptions {

    @TestVisible
    private static final String FIELDSET_REQUIRED = 'FieldSet cannot be null.';

    @TestVisible
    private IFieldSet fieldSet;
    @TestVisible
    private ISoqlCondition condition;
    @TestVisible
    private Integer offset, recordLimit;
    @TestVisible 
    private List<ParentObjectQueryOptions> parentObjectQueries {
        get {
            if (this.parentObjectQueries == null) this.parentObjectQueries = new List<ParentObjectQueryOptions>();
            return this.parentObjectQueries;
        } set;
    }
    @TestVisible
    private List<RelatedListQueryOptions> relatedListQueries {
        get {
            if (this.relatedListQueries == null) this.relatedListQueries = new List<RelatedListQueryOptions>();
            return this.relatedListQueries;
        } set;
    }
    @TestVisible
    private List<SoqlOrdering> ordering {
        get {
            if (this.ordering == null) this.ordering = new List<SoqlOrdering>();
            return this.ordering;
        } set;
    }

    public StandardQueryOptions setFieldSet(IFieldSet fieldSet) {
        if (fieldSet == null) throw new SoqlException(FIELDSET_REQUIRED);
        this.fieldSet = fieldSet;
        return this;
    }

    public StandardQueryOptions setParentObjectQuery(ParentObjectQueryOptions option) {
        return this.setparentObjectQueries(new List<ParentObjectQueryOptions> { option });
    }

    public StandardQueryOptions setParentObjectQueries(List<ParentObjectQueryOptions> options) {
        this.parentObjectQueries = options;
        return this;
    }

    public StandardQueryOptions clearParentObjectQueries() {
        this.parentObjectQueries.clear();
        return this;
    }

    public StandardQueryOptions setRelatedListQuery(RelatedListQueryOptions option) {
        return this.setRelatedListQueries(new List<RelatedListQueryOptions> { option });
    }

    public StandardQueryOptions setRelatedListQueries(List<RelatedListQueryOptions> options) {
        this.relatedListQueries = options;
        return this;
    }

    public StandardQueryOptions clearRelatedListQueries() {
        this.relatedListQueries.clear();
        return this;
    }

    public StandardQueryOptions setSoqlOrdering(SoqlOrdering ordering) {
        return this.setSoqlOrderings(new List<SoqlOrdering> { ordering });
    }

    public StandardQueryOptions setSoqlOrderings(List<SoqlOrdering> ordering) {
        this.ordering = ordering;
        return this;
    }

    public StandardQueryOptions setSoqlCondition(ISoqlCondition condition) {
        this.condition = condition;
        return this;
    }

    public StandardQueryOptions setOffset(Integer offset) {
        this.offset = offset;
        return this;
    }

    public StandardQueryOptions clearOffset() {
        this.offset = null;
        return this;
    }

    public StandardQueryOptions setLimit(Integer recordLimit) {
        this.recordLimit = recordLimit;
        return this;
    }

    public StandardQueryOptions clearLimit() {
        this.recordLimit = null;
        return this;
    }

    public String toSoql() {
        return '';
    }
}
