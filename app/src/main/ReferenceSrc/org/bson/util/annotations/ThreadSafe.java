package org.bson.util.annotations;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE})
@Deprecated
@Documented
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: classes.jar:org/bson/util/annotations/ThreadSafe.class */
public @interface ThreadSafe {
}
