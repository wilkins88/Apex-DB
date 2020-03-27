/**
 * @File Name          : ComplexSoqlCondition.cls
 * @Description        : Class for creating complex soql where clauses
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 3/24/2020, 12:12:27 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/24/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class ComplexSoqlCondition implements ISoqlCondition {

    @TestVisible
    private ISoqlCondition primaryCondition;
    @TestVisible
    private List<ISoqlCondition> andConditions {
        get {
            if (this.andConditions == null) this.andConditions = new List<ISoqlCondition>();
            return this.andConditions;
        } set;
    }
    public ComplexSoqlCondition(ISoqlCondition primaryCondition) {
        this.primaryCondition = primaryCondition;
    }

    public ComplexSoqlCondition addAndCondition(ISoqlCondition condition) {
        this.andConditions.add(condition);
        return this;
    }

    public String toSoql() {
        return '';
    }
}
