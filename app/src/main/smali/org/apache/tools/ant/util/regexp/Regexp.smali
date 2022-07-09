.class public interface abstract Lorg/apache/tools/ant/util/regexp/Regexp;
.super Ljava/lang/Object;
.source "Regexp.java"

# interfaces
.implements Lorg/apache/tools/ant/util/regexp/RegexpMatcher;


# static fields
.field public static final REPLACE_ALL:I = 0x10

.field public static final REPLACE_FIRST:I = 0x1


# virtual methods
.method public abstract substitute(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation
.end method
