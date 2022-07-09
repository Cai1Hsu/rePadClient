.class public Lorg/apache/tools/ant/taskdefs/optional/testing/BuildTimeoutException;
.super Lorg/apache/tools/ant/BuildException;
.source "BuildTimeoutException.java"


# static fields
.field private static final serialVersionUID:J = -0x6fd281134ed6c1daL


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Lorg/apache/tools/ant/BuildException;-><init>()V

    .line 39
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 61
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 62
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;
    .param p3, "location"    # Lorg/apache/tools/ant/Location;

    .prologue
    .line 76
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    .line 77
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "location"    # Lorg/apache/tools/ant/Location;

    .prologue
    .line 99
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    .line 100
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    .line 87
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V
    .locals 0
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "location"    # Lorg/apache/tools/ant/Location;

    .prologue
    .line 112
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    .line 113
    return-void
.end method
