/**
 * @File Name          : StandardQueryOptionsBuilder.cls
 * @Description        : Base class that all standard soql query (read not aggregate) builders should inherit from
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/3/2020, 12:16:56 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/2/2020   Thomas Wilkins     Initial Version
**/
public abstract class StandardQueryOptionsBuilder implements IQueryOptionsBuilder {
    @TestVisible
    protected IFieldSet fieldSet;
    @TestVisible
    protected List<CrossObjectQueryOptions> crossObjectQueries;
    @TestVisible
    protected List<RelatedListQueryOptions> relatedListQueries;
    @TestVisible
    protected ISoqlCondition condition; 
    @TestVisible
    protected Integer recordOffset;
    @TestVisible
    protected Integer recordLimit;
    @TestVisible
    protected List<SoqlOrdering> orderings;

    /**
    * @description Returns the fields to be queried for -- the only methodthat requires implementation
    * @author Thomas Wilkins | 5/2/2020 
    * @return StandardQueryOptionsBuilder 
    **/
    public abstract StandardQueryOptionsBuilder getPrimaryFieldSet();

    /**
    * @description Builds the query options based off set values
    * @author Thomas Wilkins | 5/3/2020 
    * @return IQueryOptions 
    **/
    public IQueryOptions getQueryOptions() {
        StandardQueryOptions options = new StandardQueryOptions();
        return options.setFieldSet(this.fieldSet)
            .setCrossObjectQueries(this.crossObjectQueries)
            .setRelatedListQueries(this.relatedListQueries)
            .setSoqlCondition(this.condition)
            .setOffset(this.recordOffset)
            .setLimit(this.recordLimit)
            .setSoqlOrderings(this.orderings);
    }

    /**
    * @description Override to add cross object queries for parent relationships
    * @author Thomas Wilkins | 5/2/2020 
    * @return StandardQueryOptionsBuilder
    **/
    public virtual StandardQueryOptionsBuilder getCrossObjectQueryOptions() {
        return this;
    }
    /**
    * @description Override for related list queries for child relationships
    * @author Thomas Wilkins | 5/2/2020 
    * @return StandardQueryOptionsBuilder
    **/
    public virtual StandardQueryOptionsBuilder getRelatedListQueryOptions() {
        return this;
    }
    /**
    * @description Override to set a soql condition
    * @author Thomas Wilkins | 5/2/2020 
    * @return StandardQueryOptionsBuilder 
    **/
    public virtual StandardQueryOptionsBuilder getSoqlCondition() {
        return this;
    }
    /**
    * @description Override to set an offset
    * @author Thomas Wilkins | 5/2/2020 
    * @return StandardQueryOptionsBuilder 
    **/
    public virtual StandardQueryOptionsBuilder getOffset() {
        return this;
    }
    /**
    * @description Override to set a limit
    * @author Thomas Wilkins | 5/2/2020 
    * @return StandardQueryOptionsBuilder
    **/
    public virtual StandardQueryOptionsBuilder getLimit() {
        return this;
    }
    /**
    * @description Override to set an ordering
    * @author Thomas Wilkins | 5/2/2020 
    * @return StandardQueryOptionsBuilder
    **/
    public virtual StandardQueryOptionsBuilder getOrdering() {
        return this;
    }
}
