/**
 * @File Name          : StandardQueryOptionsBuilder.cls
 * @Description        : Base class that all standard soql query (read not aggregate) builders should inherit from
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/14/2020, 8:21:39 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/2/2020   Thomas Wilkins     Initial Version
**/
public abstract class StandardQueryOptionsBuilder implements IQueryOptionsBuilder {
    @TestVisible
    protected IFieldSet fieldSet;
    @TestVisible
    protected List<ParentObjectQueryOptions> parentObjectQueries;
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
    public abstract StandardQueryOptionsBuilder setPrimaryFieldSet();

    /**
    * @description Builds the query options based off set values
    * @author Thomas Wilkins | 5/3/2020 
    * @return IQueryOptions 
    **/
    public IQueryOptions getQueryOptions() {
        StandardQueryOptions options = new StandardQueryOptions();
        return options.setFieldSet(this.fieldSet)
            .setParentObjectQueries(this.parentObjectQueries)
            .setRelatedListQueries(this.relatedListQueries)
            .setSoqlCondition(this.condition)
            .setOffset(this.recordOffset)
            .setLimit(this.recordLimit)
            .setSoqlOrderings(this.orderings);
    }

    /**
    * @description Override to add parent object queries for parent relationships
    * @author Thomas Wilkins | 5/2/2020 
    * @return StandardQueryOptionsBuilder
    **/
    public virtual StandardQueryOptionsBuilder setParentObjectQueryOptions() {
        return this;
    }
    /**
    * @description Override for related list queries for child relationships
    * @author Thomas Wilkins | 5/2/2020 
    * @return StandardQueryOptionsBuilder
    **/
    public virtual StandardQueryOptionsBuilder setRelatedListQueryOptions() {
        return this;
    }
    /**
    * @description Override to set a soql condition
    * @author Thomas Wilkins | 5/2/2020 
    * @return StandardQueryOptionsBuilder 
    **/
    public virtual StandardQueryOptionsBuilder setSoqlCondition() {
        return this;
    }
    /**
    * @description Override to set an offset
    * @author Thomas Wilkins | 5/2/2020 
    * @return StandardQueryOptionsBuilder 
    **/
    public virtual StandardQueryOptionsBuilder setOffset() {
        return this;
    }
    /**
    * @description Override to set a limit
    * @author Thomas Wilkins | 5/2/2020 
    * @return StandardQueryOptionsBuilder
    **/
    public virtual StandardQueryOptionsBuilder setLimit() {
        return this;
    }
    /**
    * @description Override to set an ordering
    * @author Thomas Wilkins | 5/2/2020 
    * @return StandardQueryOptionsBuilder
    **/
    public virtual StandardQueryOptionsBuilder setOrdering() {
        return this;
    }
}
