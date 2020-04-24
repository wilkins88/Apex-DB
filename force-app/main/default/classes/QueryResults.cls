/**
 * @File Name          : QueryResults.cls
 * @Description        : Class for encapsulating query results
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 4/23/2020, 10:22:28 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    4/18/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class QueryResults {
    @TestVisible
    private List<SObject> results;
    @TestVisible
    private Integer count;

    public QueryResults(List<SObject> results) {
        this.results = results;
        this.count = this.results.size();
    }

    /**
    * @description returns whether or not the query has an results
    * @author Thomas Wilkins | 4/19/2020 
    * @return Boolean 
    **/
    public Boolean hasResults() {
        return this.count > 0;
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
    * @description returns the number of results
    * @author Thomas Wilkins | 4/19/2020 
    * @return Integer 
    **/
    public Integer getCount() {
        return this.count;
    }
}
