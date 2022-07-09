package com.google.gson;

import java.lang.reflect.Field;

/* loaded from: classes.jar:com/google/gson/FieldNamingStrategy.class */
public interface FieldNamingStrategy {
    String translateName(Field field);
}
