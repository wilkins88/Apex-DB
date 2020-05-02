/**
 * @File Name          : StandardQueryOptionsBuilder.cls
 * @Description        : Base class that all standard soql query (read not aggregate) builders should inherit from
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/2/2020, 4:01:22 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    5/2/2020   Thomas Wilkins     Initial Version
**/
public abstract class StandardQueryOptionsBuilder implements IQueryOptionsBuilder {
    public IQueryOptions getQueryOptions() {
        StandardQueryOptions options = new StandardQueryOptions();
        options.setFieldSet(this.getPrimaryFieldSet())
            .setCrossObjectQueries(this.getCrossObjectQueryOptions())
            .setRelatedListQueries(this.getRelatedListQueryOptions())
            .setSoqlCondition(this.getSoqlCondition())
            .setOffset(this.getOffset())
            .setLimit(this.getLimit())
            .setSoqlOrderings(this.getOrdering());
        return options;
    }

    /**
    * @description Returns the fields to be queried for -- the only methodthat requires implementation
    * @author Thomas Wilkins | 5/2/2020 
    * @return IFieldSet 
    **/
    protected abstract IFieldSet getPrimaryFieldSet();
    /**
    * @description Override to add cross object queries for parent relationships
    * @author Thomas Wilkins | 5/2/2020 
    * @return List<CrossObjectQueryOptions> 
    **/
    protected virtual List<CrossObjectQueryOptions> getCrossObjectQueryOptions() {
        return new List<CrossObjectQueryOptions>();
    }
    /**
    * @description Override for related list queries for child relationships
    * @author Thomas Wilkins | 5/2/2020 
    * @return List<RelatedListQueryOptions> 
    **/
    protected virtual List<RelatedListQueryOptions> getRelatedListQueryOptions() {
        return new List<RelatedListQueryOptions>();
    }
    /**
    * @description Override to set a soql condition
    * @author Thomas Wilkins | 5/2/2020 
    * @return ISoqlCondition 
    **/
    protected virtual ISoqlCondition getSoqlCondition() {
        return null;
    }
    /**
    * @description Override to set an offset
    * @author Thomas Wilkins | 5/2/2020 
    * @return Integer 
    **/
    protected virtual Integer getOffset() {
        return null;
    }
    /**
    * @description Override to set a limit
    * @author Thomas Wilkins | 5/2/2020 
    * @return Integer
    **/
    protected virtual Integer getLimit() {
        return null;
    }
    /**
    * @description Override to set an ordering
    * @author Thomas Wilkins | 5/2/2020 
    * @return List<SoqlOrdering>
    **/
    protected virtual List<SoqlOrdering> getOrdering() {
        return new List<SoqlOrdering>();
    }
}
