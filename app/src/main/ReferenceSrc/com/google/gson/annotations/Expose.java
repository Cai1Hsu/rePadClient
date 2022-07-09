package com.google.gson.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: classes.jar:com/google/gson/annotations/Expose.class */
public @interface Expose {
    boolean deserialize() default true;

    boolean serialize() default true;
}
