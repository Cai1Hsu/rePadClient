package com.mongodb;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.regex.Pattern;

/* loaded from: classes.dex */
public class QueryBuilder {
    private String _currentKey;
    private boolean _hasNot;
    private DBObject _query = new BasicDBObject();

    public static QueryBuilder start() {
        return new QueryBuilder();
    }

    public static QueryBuilder start(String key) {
        return new QueryBuilder().put(key);
    }

    public QueryBuilder put(String key) {
        this._currentKey = key;
        if (this._query.get(key) == null) {
            this._query.put(this._currentKey, new NullObject());
        }
        return this;
    }

    public QueryBuilder and(String key) {
        return put(key);
    }

    public QueryBuilder greaterThan(Object object) {
        addOperand(QueryOperators.GT, object);
        return this;
    }

    public QueryBuilder greaterThanEquals(Object object) {
        addOperand(QueryOperators.GTE, object);
        return this;
    }

    public QueryBuilder lessThan(Object object) {
        addOperand(QueryOperators.LT, object);
        return this;
    }

    public QueryBuilder lessThanEquals(Object object) {
        addOperand(QueryOperators.LTE, object);
        return this;
    }

    public QueryBuilder is(Object object) {
        addOperand(null, object);
        return this;
    }

    public QueryBuilder notEquals(Object object) {
        addOperand(QueryOperators.NE, object);
        return this;
    }

    public QueryBuilder in(Object object) {
        addOperand(QueryOperators.IN, object);
        return this;
    }

    public QueryBuilder notIn(Object object) {
        addOperand(QueryOperators.NIN, object);
        return this;
    }

    public QueryBuilder mod(Object object) {
        addOperand(QueryOperators.MOD, object);
        return this;
    }

    public QueryBuilder all(Object object) {
        addOperand(QueryOperators.ALL, object);
        return this;
    }

    public QueryBuilder size(Object object) {
        addOperand(QueryOperators.SIZE, object);
        return this;
    }

    public QueryBuilder exists(Object object) {
        addOperand(QueryOperators.EXISTS, object);
        return this;
    }

    public QueryBuilder regex(Pattern regex) {
        addOperand(null, regex);
        return this;
    }

    public QueryBuilder elemMatch(DBObject match) {
        addOperand(QueryOperators.ELEM_MATCH, match);
        return this;
    }

    public QueryBuilder withinCenter(double x, double y, double radius) {
        addOperand(QueryOperators.WITHIN, new BasicDBObject(QueryOperators.CENTER, new Object[]{new Double[]{Double.valueOf(x), Double.valueOf(y)}, Double.valueOf(radius)}));
        return this;
    }

    public QueryBuilder near(double x, double y) {
        addOperand(QueryOperators.NEAR, Arrays.asList(Double.valueOf(x), Double.valueOf(y)));
        return this;
    }

    public QueryBuilder near(double x, double y, double maxDistance) {
        addOperand(QueryOperators.NEAR, Arrays.asList(Double.valueOf(x), Double.valueOf(y)));
        addOperand(QueryOperators.MAX_DISTANCE, Double.valueOf(maxDistance));
        return this;
    }

    public QueryBuilder nearSphere(double longitude, double latitude) {
        addOperand(QueryOperators.NEAR_SPHERE, Arrays.asList(Double.valueOf(longitude), Double.valueOf(latitude)));
        return this;
    }

    public QueryBuilder nearSphere(double longitude, double latitude, double maxDistance) {
        addOperand(QueryOperators.NEAR_SPHERE, Arrays.asList(Double.valueOf(longitude), Double.valueOf(latitude)));
        addOperand(QueryOperators.MAX_DISTANCE, Double.valueOf(maxDistance));
        return this;
    }

    public QueryBuilder withinCenterSphere(double longitude, double latitude, double maxDistance) {
        addOperand(QueryOperators.WITHIN, new BasicDBObject(QueryOperators.CENTER_SPHERE, new Object[]{new Double[]{Double.valueOf(longitude), Double.valueOf(latitude)}, Double.valueOf(maxDistance)}));
        return this;
    }

    public QueryBuilder withinBox(double x, double y, double x2, double y2) {
        addOperand(QueryOperators.WITHIN, new BasicDBObject(QueryOperators.BOX, new Object[]{new Double[]{Double.valueOf(x), Double.valueOf(y)}, new Double[]{Double.valueOf(x2), Double.valueOf(y2)}}));
        return this;
    }

    public QueryBuilder withinPolygon(List<Double[]> points) {
        if (points == null || points.isEmpty() || points.size() < 3) {
            throw new IllegalArgumentException("Polygon insufficient number of vertices defined");
        }
        addOperand(QueryOperators.WITHIN, new BasicDBObject(QueryOperators.POLYGON, points));
        return this;
    }

    public QueryBuilder text(String search) {
        return text(search, null);
    }

    public QueryBuilder text(String search, String language) {
        if (this._currentKey != null) {
            throw new QueryBuilderException("The text operand may only occur at the top-level of a query. It does not apply to a specific element, but rather to a document as a whole.");
        }
        put(QueryOperators.TEXT);
        addOperand(QueryOperators.SEARCH, search);
        if (language != null) {
            addOperand(QueryOperators.LANGUAGE, language);
        }
        return this;
    }

    public QueryBuilder not() {
        this._hasNot = true;
        return this;
    }

    public QueryBuilder or(DBObject... ors) {
        List l = (List) this._query.get(QueryOperators.OR);
        if (l == null) {
            l = new ArrayList();
            this._query.put(QueryOperators.OR, l);
        }
        Collections.addAll(l, ors);
        return this;
    }

    public QueryBuilder and(DBObject... ands) {
        List l = (List) this._query.get(QueryOperators.AND);
        if (l == null) {
            l = new ArrayList();
            this._query.put(QueryOperators.AND, l);
        }
        Collections.addAll(l, ands);
        return this;
    }

    public DBObject get() {
        for (String key : this._query.keySet()) {
            if (this._query.get(key) instanceof NullObject) {
                throw new QueryBuilderException("No operand for key:" + key);
            }
        }
        return this._query;
    }

    private void addOperand(String op, Object value) {
        BasicDBObject operand;
        if (op == null) {
            if (this._hasNot) {
                BasicDBObject value2 = new BasicDBObject(QueryOperators.NOT, value);
                this._hasNot = false;
                value = value2;
            }
            this._query.put(this._currentKey, value);
            return;
        }
        Object storedValue = this._query.get(this._currentKey);
        if (!(storedValue instanceof DBObject)) {
            operand = new BasicDBObject();
            if (this._hasNot) {
                DBObject notOperand = new BasicDBObject(QueryOperators.NOT, operand);
                this._query.put(this._currentKey, notOperand);
                this._hasNot = false;
            } else {
                this._query.put(this._currentKey, operand);
            }
        } else {
            operand = (BasicDBObject) this._query.get(this._currentKey);
            if (operand.get(QueryOperators.NOT) != null) {
                operand = (BasicDBObject) operand.get(QueryOperators.NOT);
            }
        }
        operand.put(op, value);
    }

    /* loaded from: classes.dex */
    static class QueryBuilderException extends RuntimeException {
        QueryBuilderException(String message) {
            super(message);
        }
    }

    /* loaded from: classes.dex */
    private static class NullObject {
        private NullObject() {
        }
    }
}
