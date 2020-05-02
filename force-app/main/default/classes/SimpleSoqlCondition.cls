/**
 * @File Name          : SimpleSoqlCondition.cls
 * @Description        : Simple soql condition e.g. Id IN :idSet
 * @Author             : Thomas Wilkins
 * @Group              : 
 * @Last Modified By   : Thomas Wilkins
 * @Last Modified On   : 5/2/2020, 9:58:57 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    3/23/2020   Thomas Wilkins     Initial Version
**/
public inherited sharing class SimpleSoqlCondition implements ISoqlCondition {

    @TestVisible
    private static final String MISSING_CONDITION_DETAILS = 'Missing condition details.';
    @TestVisible
    private static final String SOQL_EXPRESSION = '{0} {1} {2}';

    @TestVisible
    private String fieldName;
	@TestVisible 
	private String relation;
    @TestVisible
    private String operation;
    @TestVisible
    private String conditionValue;
    @TestVisible
    private Boolean isNotLike;

    public SimpleSoqlCondition(Schema.SObjectField sObjField) {
        this.fieldName = String.valueOf(sObjField);
        this.isNotLike = false;    
    }

    public SimpleSoqlCondition(Schema.SObjectField sObjField, String relation) {
        this.fieldName = relation + '.' + String.valueOf(sObjField);
        this.isNotLike = false;
    }

    /**
    * @description = operation
    * @author Thomas Wilkins | 3/23/2020 
    * @param o Object to be compared to
    * @return SimpleSoqlCondition 
    **/
    public SimpleSoqlCondition isEqualTo(Object o) {
        this.setValues('=', o, false);
        return this;
    }

    /**
    * @description != operation
    * @author Thomas Wilkins | 5/2/2020 
    * @param o Object to be compared to
    * @return SimpleSoqlCondition 
    **/
    public SimpleSoqlCondition isNotEqualTo(Object o) {
        this.setValues('!=', o, false);
        return this;
    }

    /**
    * @description IN operation
    * @author Thomas Wilkins | 3/24/2020 
    * @param o List to look in
    * @return SimpleSoqlCondition 
    **/
    public SimpleSoqlCondition isIn(List<Object> o) {
        this.setValues('IN', o, false);
        return this;
    }

    /** see overloaded method for List<Object> */
    public SimpleSoqlCondition isIn(Set<Id> o) {
        return this.isIn((List<Object>)(new List<Id>(o)));
    }

    /** see overloaded method for List<Object> */
    public SimpleSoqlCondition isIn(Set<String> o) {
        return this.isIn((List<Object>)(new List<String>(o)));
    }

    /** see overloaded method for List<Object> */
    public SimpleSoqlCondition isIn(Set<Integer> o) {
        return this.isIn((List<Object>)(new List<Integer>(o)));
    }

    /** see overloaded method for List<Object> */
    public SimpleSoqlCondition isIn(Set<Decimal> o) {
        return this.isIn((List<Object>)(new List<Decimal>(o)));
    }

    /** see overloaded method for List<Object> */
    public SimpleSoqlCondition isIn(Set<Double> o) {
        return this.isIn((List<Object>)(new List<Double>(o)));
    }

    /** see overloaded method for List<Object> */
    public SimpleSoqlCondition isIn(Set<Boolean> o) {
        return this.isIn((List<Object>)(new List<Boolean>(o)));
    }

    /** see overloaded method for List<Object> */
    public SimpleSoqlCondition isIn(Set<Date> o) {
        return this.isIn((List<Object>)(new List<Date>(o)));
    }

    /** see overloaded method for List<Object> */
    public SimpleSoqlCondition isIn(Set<Datetime> o) {
        return this.isIn((List<Object>)(new List<Datetime>(o)));
    }

    /**
    * @description NOT IN operation
    * @author Thomas Wilkins | 3/24/2020 
    * @param o the list to check in
    * @return SimpleSoqlCondition 
    **/
    public SimpleSoqlCondition isNotIn(List<Object> o) {
        this.setValues('NOT IN', o, false);
        return this;
    }

    /** see overloaded method for List<Object> */
    public SimpleSoqlCondition isNotIn(Set<Id> o) {
        return this.isNotIn((List<Object>)(new List<Id>(o)));
    }

    /** see overloaded method for List<Object> */
    public SimpleSoqlCondition isNotIn(Set<String> o) {
        return this.isNotIn((List<Object>)(new List<String>(o)));
    }

    /** see overloaded method for List<Object> */
    public SimpleSoqlCondition isNotIn(Set<Integer> o) {
        return this.isNotIn((List<Object>)(new List<Integer>(o)));
    }

    /** see overloaded method for List<Object> */
    public SimpleSoqlCondition isNotIn(Set<Decimal> o) {
        return this.isNotIn((List<Object>)(new List<Decimal>(o)));
    }

    /** see overloaded method for List<Object> */
    public SimpleSoqlCondition isNotIn(Set<Double> o) {
        return this.isNotIn((List<Object>)(new List<Double>(o)));
    }

    /** see overloaded method for List<Object> */
    public SimpleSoqlCondition isNotIn(Set<Boolean> o) {
        return this.isNotIn((List<Object>)(new List<Boolean>(o)));
    }

    /** see overloaded method for List<Object> */
    public SimpleSoqlCondition isNotIn(Set<Date> o) {
        return this.isNotIn((List<Object>)(new List<Date>(o)));
    }

    /** see overloaded method for List<Object> */
    public SimpleSoqlCondition isNotIn(Set<Datetime> o) {
        return this.isNotIn((List<Object>)(new List<Datetime>(o)));
    }

    /**
    * @description LIKE operation
    * @author Thomas Wilkins | 3/24/2020 
    * @param o object to compare to
    * @return SimpleSoqlCondition 
    **/
    public SimpleSoqlCondition isLike(Object o) {
        this.setValues('LIKE', o, false);
        return this;
    }

    /**
    * @description NOT LIKE operation
    * @author Thomas Wilkins | 3/24/2020 
    * @param o object to compare to
    * @return SimpleSoqlCondition 
    **/
    public SimpleSoqlCondition isNotLike(Object o) {
        this.setValues('LIKE', o, true);
        return this;
    }

    /**
    * @description INCLUDES operation
    * @author Thomas Wilkins | 3/24/2020 
    * @param o set to check against
    * @return SimpleSoqlCondition 
    **/
    public SimpleSoqlCondition includes(Set<String> o) {
        this.setValues('INCLUDES', (List<Object>)(new List<String>(o)), false);
        return this;
    }

    /**
    * @description EXCLUDES operation
    * @author Thomas Wilkins | 3/24/2020 
    * @param o set to check against
    * @return SimpleSoqlCondition 
    **/
    public SimpleSoqlCondition excludes(Set<String> o) {
        this.setValues('EXCLUDES', (List<Object>)(new List<String>(o)), false);
        return this;
    }
 
    /**
    * @description > operation
    * @author Thomas Wilkins | 3/24/2020 
    * @param o object to compare to
    * @return SimpleSoqlCondition 
    **/
    public SimpleSoqlCondition isGreaterThan(Object o) {
        this.setValues('>', o, false);
        return this;
    }

    /**
    * @description >= operation
    * @author Thomas Wilkins | 3/24/2020 
    * @param o the object to compare to
    * @return SimpleSoqlCondition 
    **/
    public SimpleSoqlCondition isGreaterThanOrEqualTo(Object o) {
        this.setValues('>=', o, false);
        return this;
    }

    /**
    * @description < operation
    * @author Thomas Wilkins | 3/24/2020 
    * @param o the object to compare to
    * @return SimpleSoqlCondition 
    **/
    public SimpleSoqlCondition isLessThan(Object o) {
        this.setValues('<', o, false);
        return this;
    }

    /**
    * @description <= operation
    * @author Thomas Wilkins | 3/24/2020 
    * @param o the object to compare to
    * @return SimpleSoqlCondition 
    **/
    public SimpleSoqlCondition isLessThanOrEqualTo(Object o) {
        this.setValues('<=', o, false);
        return this;
    }

    /**
    * @description Generates SOQL string for the condition
    * @author Thomas Wilkins | 3/24/2020 
    * @return String 
    **/
    public String toSoql() {
        if (
            String.isBlank(this.fieldName) || 
            String.isBlank(this.operation) || 
            String.isBlank(this.conditionValue)
        ) {
            throw new SoqlException(MISSING_CONDITION_DETAILS);
        }
        String firstArg = this.isNotLike ? 'NOT ' + this.fieldName : this.fieldName;
        List<String> args = new List<String> {
            firstArg,
            this.operation,
            this.conditionValue
        };
        return String.format(SOQL_EXPRESSION, args);
    }

    /**
    * @description helper to set various internval values
    * @author Thomas Wilkins | 3/24/2020 
    * @param op the operation to set
    * @param value the value to use for the operation
    * @param isNotLike flag to handle the special case NOT LIKE
    * @return void 
    **/
    private void setValues(String op, Object value, Boolean isNotLike) {
        this.operation = op;
        this.conditionValue = this.getValueStringFromObject(value);
        this.isNotLike = isNotLike;
    }

    /**
    * @description Return the string value for any object
    * @author Thomas Wilkins | 3/24/2020 
    * @param o object to get the string value for
    * @return String 
    **/
    private String getValueStringFromObject(Object o) {
        String valueString = '';
        if (o == null) {
            valueString += 'null';
        } else if (o instanceOf String || o instanceOf Id) {
            String value = (String)o;
            valueString += '\'' + String.escapeSingleQuotes(value) + '\'';
        } else if (o instanceOf Date) {
            Date value = (Date)o; 
            valueString += Datetime.newInstance((value).year(), (value).month(), (value).day()).format('yyyy-MM-dd');
        } else if (o instanceOf Datetime) {
            // think I might need to revisit this being in GMT
            Datetime value = (Datetime)o;
            valueString += value.formatGmt('yyyy-MM-dd') + 'T' + value.formatGmt('HH:mm:ss') + 'Z';
        } else if (o instanceOf List<Object>) {
            List<Object> values = (List<Object>)o;
            List<String> valueStrings = new List<String>();
            for (Object value : values) {
                valueStrings.add(this.getValueStringFromObject(value));
            }
            valueString = '(' + String.join(valueStrings, ',') + ')';
        } else {
            valueString += String.valueOf(o);
        }
        return valueString;
    }
}
