/**
 * @File Name          : QueryResults.cls
 * @Description        : 
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 4/19/2020, 7:49:08 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    4/18/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class QueryResults {
    @TestVisible
    private List<SObject> results;
    @TestVisible
    private List<QueryError> errors;
    @TestVisible
    private Integer count, errorCount;

    public QueryResults(List<SObject> results, List<QueryError> errors) {
        this.results = results;
        this.errors = errors;
        this.setCounts();
    }

    public QueryResults(List<SObject> results) {
        this.results = results;
        this.errors = new List<QueryError>();
        this.setCounts();
    }

    public QueryResults(List<QueryError> errors) {
        this.results = new list<SObject>();
        this.errors = errors;
        this.setCounts();
    }

    /**
    * @description returns whether or not the query has an error
    * @author Thomas Wilkins | 4/19/2020 
    * @return Boolean 
    **/
    public Boolean hasError() {
        return this.errorCount > 0;
    }

    /**
    * @description returns the query results
    * @author Thomas Wilkins | 4/19/2020 
    * @return List<SObject> 
    **/
    public List<SObject> getResults() {
        return this.results;
    }

    /**
    * @description returns the query errors
    * @author Thomas Wilkins | 4/19/2020 
    * @return List<QueryError> 
    **/
    public List<QueryError> getErrors() {
        return this.errors;
    }

    /**
    * @description returns the number of results
    * @author Thomas Wilkins | 4/19/2020 
    * @return Integer 
    **/
    public Integer getCount() {
        return this.count;
    }

    /**
    * @description returns the number of errors
    * @author Thomas Wilkins | 4/19/2020 
    * @return Integer 
    **/
    public Integer getErrorCount() {
        return this.errorCount;
    }

    /**
    * @description helper to set the counts based off lists
    * @author Thomas Wilkins | 4/19/2020 
    * @return void 
    **/
    private void setCounts() {
        this.count = this.results.size();
        this.errorCount = this.errors.size();
    }
}
