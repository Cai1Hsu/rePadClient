.class public Lorg/apache/tools/ant/BuildException;
.super Ljava/lang/RuntimeException;
.source "BuildException.java"


# static fields
.field private static final serialVersionUID:J = -0x4b34350938a1f130L


# instance fields
.field private location:Lorg/apache/tools/ant/Location;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 28
    sget-object v0, Lorg/apache/tools/ant/Location;->UNKNOWN_LOCATION:Lorg/apache/tools/ant/Location;

    iput-object v0, p0, Lorg/apache/tools/ant/BuildException;->location:Lorg/apache/tools/ant/Location;

    .line 35
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 28
    sget-object v0, Lorg/apache/tools/ant/Location;->UNKNOWN_LOCATION:Lorg/apache/tools/ant/Location;

    iput-object v0, p0, Lorg/apache/tools/ant/BuildException;->location:Lorg/apache/tools/ant/Location;

    .line 45
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 28
    sget-object v0, Lorg/apache/tools/ant/Location;->UNKNOWN_LOCATION:Lorg/apache/tools/ant/Location;

    iput-object v0, p0, Lorg/apache/tools/ant/BuildException;->location:Lorg/apache/tools/ant/Location;

    .line 58
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/BuildException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;
    .param p3, "location"    # Lorg/apache/tools/ant/Location;

    .prologue
    .line 73
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 74
    iput-object p3, p0, Lorg/apache/tools/ant/BuildException;->location:Lorg/apache/tools/ant/Location;

    .line 75
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "location"    # Lorg/apache/tools/ant/Location;

    .prologue
    .line 97
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 28
    sget-object v0, Lorg/apache/tools/ant/Location;->UNKNOWN_LOCATION:Lorg/apache/tools/ant/Location;

    iput-object v0, p0, Lorg/apache/tools/ant/BuildException;->location:Lorg/apache/tools/ant/Location;

    .line 98
    iput-object p2, p0, Lorg/apache/tools/ant/BuildException;->location:Lorg/apache/tools/ant/Location;

    .line 99
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 84
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 28
    sget-object v0, Lorg/apache/tools/ant/Location;->UNKNOWN_LOCATION:Lorg/apache/tools/ant/Location;

    iput-object v0, p0, Lorg/apache/tools/ant/BuildException;->location:Lorg/apache/tools/ant/Location;

    .line 85
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V
    .locals 0
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "location"    # Lorg/apache/tools/ant/Location;

    .prologue
    .line 111
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    .line 112
    iput-object p2, p0, Lorg/apache/tools/ant/BuildException;->location:Lorg/apache/tools/ant/Location;

    .line 113
    return-void
.end method


# virtual methods
.method public getException()Ljava/lang/Throwable;
    .locals 1

    .prologue
    .line 123
    invoke-virtual {p0}, Lorg/apache/tools/ant/BuildException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    return-object v0
.end method

.method public getLocation()Lorg/apache/tools/ant/Location;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lorg/apache/tools/ant/BuildException;->location:Lorg/apache/tools/ant/Location;

    return-object v0
.end method

.method public setLocation(Lorg/apache/tools/ant/Location;)V
    .locals 0
    .param p1, "location"    # Lorg/apache/tools/ant/Location;

    .prologue
    .line 142
    iput-object p1, p0, Lorg/apache/tools/ant/BuildException;->location:Lorg/apache/tools/ant/Location;

    .line 143
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 132
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/BuildException;->location:Lorg/apache/tools/ant/Location;

    invoke-virtual {v1}, Lorg/apache/tools/ant/Location;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/BuildException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
