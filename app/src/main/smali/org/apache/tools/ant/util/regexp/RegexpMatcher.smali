.class public interface abstract Lorg/apache/tools/ant/util/regexp/RegexpMatcher;
.super Ljava/lang/Object;
.source "RegexpMatcher.java"


# static fields
.field public static final MATCH_CASE_INSENSITIVE:I = 0x100

.field public static final MATCH_DEFAULT:I = 0x0

.field public static final MATCH_MULTILINE:I = 0x1000

.field public static final MATCH_SINGLELINE:I = 0x10000


# virtual methods
.method public abstract getGroups(Ljava/lang/String;)Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation
.end method

.method public abstract getGroups(Ljava/lang/String;I)Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation
.end method

.method public abstract getPattern()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation
.end method

.method public abstract matches(Ljava/lang/String;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation
.end method

.method public abstract matches(Ljava/lang/String;I)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation
.end method

.method public abstract setPattern(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation
.end method
