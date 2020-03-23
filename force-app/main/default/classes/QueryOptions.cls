/**
 * @File Name          : QueryOptions.cls
 * @Description        : Query options that are fed into database queries
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/23/2020, 1:57:21 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/23/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class QueryOptions implements IQueryOptions {

    private ISelector primarySelector;

    private List<CrossObjectQueryOptions> crossObjectQueries {
        get {
            if (this.crossObjectQueries == null) this.crossObjectQueries = new List<CrossObjectQueryOptions>();
            return this.crossObjectQueries;
        } set;
    }

    private List<RelatedListQueryOptions> relatedListQueries {
        get {
            if (this.relatedListQueries == null) this.relatedListQueries = new List<RelatedListQueryOptions>();
            return this.relatedListQueries;
        } set;
    }

    private ISoqlCondition condition;

    private Integer offset; 

    public QueryOptions(ISelector primarySelector) {
        this.primarySelector = primarySelector;
    }

    public QueryOptions setCrossObjectQuery(CrossObjectQueryOptions crossObjectQueryOptions) {
        this.crossObjectQueries.add(crossObjectQueryOptions);
        return this;
    }

    public QueryOptions clearCrossObjectQueries() {
        this.crossObjectQueries.clear();
        return this;
    }

    public QueryOptions setRelatedListQuery(RelatedListQueryOptions relatedListQueryOptions) {
        this.relatedListQueries.add(relatedListQueryOptions);
        return this;
    }

    public QueryOptions clearRelatedListQueries() {
        this.relatedListQueries.clear();
        return this;
    }

    public String toSoql() {
        return '';
    }
}
