.class public abstract Lorg/apache/tools/ant/types/EnumeratedAttribute;
.super Ljava/lang/Object;
.source "EnumeratedAttribute.java"


# static fields
.field static class$org$apache$tools$ant$types$EnumeratedAttribute:Ljava/lang/Class;


# instance fields
.field private index:I

.field protected value:Ljava/lang/String;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/tools/ant/types/EnumeratedAttribute;->index:I

    .line 56
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 72
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method public static getInstance(Ljava/lang/Class;Ljava/lang/String;)Lorg/apache/tools/ant/types/EnumeratedAttribute;
    .locals 4
    .param p0, "clazz"    # Ljava/lang/Class;
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 72
    sget-object v2, Lorg/apache/tools/ant/types/EnumeratedAttribute;->class$org$apache$tools$ant$types$EnumeratedAttribute:Ljava/lang/Class;

    if-nez v2, :cond_0

    const-string/jumbo v2, "org.apache.tools.ant.types.EnumeratedAttribute"

    invoke-static {v2}, Lorg/apache/tools/ant/types/EnumeratedAttribute;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/types/EnumeratedAttribute;->class$org$apache$tools$ant$types$EnumeratedAttribute:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v2, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 73
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "You have to provide a subclass from EnumeratedAttribut as clazz-parameter."

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 72
    :cond_0
    sget-object v2, Lorg/apache/tools/ant/types/EnumeratedAttribute;->class$org$apache$tools$ant$types$EnumeratedAttribute:Ljava/lang/Class;

    goto :goto_0

    .line 76
    :cond_1
    const/4 v1, 0x0

    .line 78
    .local v1, "ea":Lorg/apache/tools/ant/types/EnumeratedAttribute;
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "ea":Lorg/apache/tools/ant/types/EnumeratedAttribute;
    check-cast v1, Lorg/apache/tools/ant/types/EnumeratedAttribute;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    .restart local v1    # "ea":Lorg/apache/tools/ant/types/EnumeratedAttribute;
    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/types/EnumeratedAttribute;->setValue(Ljava/lang/String;)V

    .line 83
    return-object v1

    .line 79
    .end local v1    # "ea":Lorg/apache/tools/ant/types/EnumeratedAttribute;
    :catch_0
    move-exception v0

    .line 80
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method


# virtual methods
.method public final containsValue(Ljava/lang/String;)Z
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 106
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/EnumeratedAttribute;->indexOfValue(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final getIndex()I
    .locals 1

    .prologue
    .line 141
    iget v0, p0, Lorg/apache/tools/ant/types/EnumeratedAttribute;->index:I

    return v0
.end method

.method public final getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lorg/apache/tools/ant/types/EnumeratedAttribute;->value:Ljava/lang/String;

    return-object v0
.end method

.method public abstract getValues()[Ljava/lang/String;
.end method

.method public final indexOfValue(Ljava/lang/String;)I
    .locals 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v2, -0x1

    .line 117
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;->getValues()[Ljava/lang/String;

    move-result-object v1

    .line 118
    .local v1, "values":[Ljava/lang/String;
    if-eqz v1, :cond_0

    if-nez p1, :cond_2

    :cond_0
    move v0, v2

    .line 126
    :cond_1
    :goto_0
    return v0

    .line 121
    :cond_2
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v3, v1

    if-ge v0, v3, :cond_3

    .line 122
    aget-object v3, v1, v0

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 121
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    move v0, v2

    .line 126
    goto :goto_0
.end method

.method public final setValue(Ljava/lang/String;)V
    .locals 4
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 92
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/EnumeratedAttribute;->indexOfValue(Ljava/lang/String;)I

    move-result v0

    .line 93
    .local v0, "idx":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 94
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " is not a legal value for this attribute"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 96
    :cond_0
    iput v0, p0, Lorg/apache/tools/ant/types/EnumeratedAttribute;->index:I

    .line 97
    iput-object p1, p0, Lorg/apache/tools/ant/types/EnumeratedAttribute;->value:Ljava/lang/String;

    .line 98
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 150
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
