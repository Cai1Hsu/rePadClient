package com.google.gson;

import java.lang.reflect.Type;

/* loaded from: classes.jar:com/google/gson/InstanceCreator.class */
public interface InstanceCreator<T> {
    T createInstance(Type type);
}
