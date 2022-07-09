.class public final Lorg/apache/tools/ant/filters/SortFilter;
.super Lorg/apache/tools/ant/filters/BaseParamFilterReader;
.source "SortFilter.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/ChainableReader;


# static fields
.field private static final COMPARATOR_KEY:Ljava/lang/String; = "comparator"

.field private static final REVERSE_KEY:Ljava/lang/String; = "reverse"


# instance fields
.field private comparator:Ljava/util/Comparator;

.field private iterator:Ljava/util/Iterator;

.field private line:Ljava/lang/String;

.field private lines:Ljava/util/List;

.field private reverse:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 168
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>()V

    .line 138
    iput-object v0, p0, Lorg/apache/tools/ant/filters/SortFilter;->comparator:Ljava/util/Comparator;

    .line 158
    iput-object v0, p0, Lorg/apache/tools/ant/filters/SortFilter;->line:Ljava/lang/String;

    .line 160
    iput-object v0, p0, Lorg/apache/tools/ant/filters/SortFilter;->iterator:Ljava/util/Iterator;

    .line 169
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 1
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    const/4 v0, 0x0

    .line 179
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>(Ljava/io/Reader;)V

    .line 138
    iput-object v0, p0, Lorg/apache/tools/ant/filters/SortFilter;->comparator:Ljava/util/Comparator;

    .line 158
    iput-object v0, p0, Lorg/apache/tools/ant/filters/SortFilter;->line:Ljava/lang/String;

    .line 160
    iput-object v0, p0, Lorg/apache/tools/ant/filters/SortFilter;->iterator:Ljava/util/Iterator;

    .line 180
    return-void
.end method

.method private initialize()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 315
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/SortFilter;->getParameters()[Lorg/apache/tools/ant/types/Parameter;

    move-result-object v4

    .line 316
    .local v4, "params":[Lorg/apache/tools/ant/types/Parameter;
    if-eqz v4, :cond_2

    .line 317
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v5, v4

    if-ge v2, v5, :cond_2

    .line 318
    aget-object v5, v4, v2

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Parameter;->getName()Ljava/lang/String;

    move-result-object v3

    .line 319
    .local v3, "paramName":Ljava/lang/String;
    const-string/jumbo v5, "reverse"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 320
    aget-object v5, v4, v2

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/filters/SortFilter;->setReverse(Z)V

    .line 317
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 324
    :cond_1
    const-string/jumbo v5, "comparator"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 326
    :try_start_0
    aget-object v5, v4, v2

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 327
    .local v0, "className":Ljava/lang/String;
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Comparator;

    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/filters/SortFilter;->setComparator(Ljava/util/Comparator;)V
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    goto :goto_1

    .line 330
    .end local v0    # "className":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 331
    .local v1, "e":Ljava/lang/InstantiationException;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v5, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 332
    .end local v1    # "e":Ljava/lang/InstantiationException;
    :catch_1
    move-exception v1

    .line 337
    .local v1, "e":Ljava/lang/IllegalAccessException;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v5, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 338
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v1

    .line 339
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v5, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 340
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    :catch_3
    move-exception v1

    .line 341
    .local v1, "e":Ljava/lang/ClassCastException;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "Value of comparator attribute should implement java.util.Comparator interface"

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 345
    .end local v1    # "e":Ljava/lang/ClassCastException;
    :catch_4
    move-exception v1

    .line 346
    .local v1, "e":Ljava/lang/Exception;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v5, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 351
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "i":I
    .end local v3    # "paramName":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method private sort()V
    .locals 2

    .prologue
    .line 359
    iget-object v0, p0, Lorg/apache/tools/ant/filters/SortFilter;->comparator:Ljava/util/Comparator;

    if-nez v0, :cond_1

    .line 360
    iget-boolean v0, p0, Lorg/apache/tools/ant/filters/SortFilter;->reverse:Z

    if-eqz v0, :cond_0

    .line 361
    iget-object v0, p0, Lorg/apache/tools/ant/filters/SortFilter;->lines:Ljava/util/List;

    new-instance v1, Lorg/apache/tools/ant/filters/SortFilter$1;

    invoke-direct {v1, p0}, Lorg/apache/tools/ant/filters/SortFilter$1;-><init>(Lorg/apache/tools/ant/filters/SortFilter;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 374
    :goto_0
    return-void

    .line 369
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/filters/SortFilter;->lines:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    goto :goto_0

    .line 372
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/filters/SortFilter;->lines:Ljava/util/List;

    iget-object v1, p0, Lorg/apache/tools/ant/filters/SortFilter;->comparator:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    goto :goto_0
.end method


# virtual methods
.method public add(Ljava/util/Comparator;)V
    .locals 2
    .param p1, "comparator"    # Ljava/util/Comparator;

    .prologue
    .line 304
    iget-object v0, p0, Lorg/apache/tools/ant/filters/SortFilter;->comparator:Ljava/util/Comparator;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 305
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "can\'t have more than one comparator"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 307
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/filters/SortFilter;->setComparator(Ljava/util/Comparator;)V

    .line 308
    return-void
.end method

.method public chain(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 2
    .param p1, "rdr"    # Ljava/io/Reader;

    .prologue
    .line 249
    new-instance v0, Lorg/apache/tools/ant/filters/SortFilter;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/filters/SortFilter;-><init>(Ljava/io/Reader;)V

    .line 250
    .local v0, "newFilter":Lorg/apache/tools/ant/filters/SortFilter;
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/SortFilter;->isReverse()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/SortFilter;->setReverse(Z)V

    .line 251
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/SortFilter;->getComparator()Ljava/util/Comparator;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/SortFilter;->setComparator(Ljava/util/Comparator;)V

    .line 252
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/SortFilter;->setInitialized(Z)V

    .line 253
    return-object v0
.end method

.method public getComparator()Ljava/util/Comparator;
    .locals 1

    .prologue
    .line 284
    iget-object v0, p0, Lorg/apache/tools/ant/filters/SortFilter;->comparator:Ljava/util/Comparator;

    return-object v0
.end method

.method public isReverse()Z
    .locals 1

    .prologue
    .line 264
    iget-boolean v0, p0, Lorg/apache/tools/ant/filters/SortFilter;->reverse:Z

    return v0
.end method

.method public read()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 196
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/SortFilter;->getInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 197
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/SortFilter;->initialize()V

    .line 198
    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/filters/SortFilter;->setInitialized(Z)V

    .line 201
    :cond_0
    const/4 v0, -0x1

    .line 202
    .local v0, "ch":I
    iget-object v1, p0, Lorg/apache/tools/ant/filters/SortFilter;->line:Ljava/lang/String;

    if-eqz v1, :cond_3

    .line 207
    iget-object v1, p0, Lorg/apache/tools/ant/filters/SortFilter;->line:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 208
    iget-object v1, p0, Lorg/apache/tools/ant/filters/SortFilter;->line:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ne v1, v4, :cond_2

    .line 209
    iput-object v3, p0, Lorg/apache/tools/ant/filters/SortFilter;->line:Ljava/lang/String;

    :cond_1
    :goto_0
    move v1, v0

    .line 235
    :goto_1
    return v1

    .line 211
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/filters/SortFilter;->line:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/filters/SortFilter;->line:Ljava/lang/String;

    goto :goto_0

    .line 214
    :cond_3
    iget-object v1, p0, Lorg/apache/tools/ant/filters/SortFilter;->lines:Ljava/util/List;

    if-nez v1, :cond_5

    .line 216
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/apache/tools/ant/filters/SortFilter;->lines:Ljava/util/List;

    .line 217
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/SortFilter;->readLine()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/filters/SortFilter;->line:Ljava/lang/String;

    :goto_2
    iget-object v1, p0, Lorg/apache/tools/ant/filters/SortFilter;->line:Ljava/lang/String;

    if-eqz v1, :cond_4

    .line 218
    iget-object v1, p0, Lorg/apache/tools/ant/filters/SortFilter;->lines:Ljava/util/List;

    iget-object v2, p0, Lorg/apache/tools/ant/filters/SortFilter;->line:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/SortFilter;->readLine()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/filters/SortFilter;->line:Ljava/lang/String;

    goto :goto_2

    .line 220
    :cond_4
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/SortFilter;->sort()V

    .line 221
    iget-object v1, p0, Lorg/apache/tools/ant/filters/SortFilter;->lines:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/filters/SortFilter;->iterator:Ljava/util/Iterator;

    .line 224
    :cond_5
    iget-object v1, p0, Lorg/apache/tools/ant/filters/SortFilter;->iterator:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 225
    iget-object v1, p0, Lorg/apache/tools/ant/filters/SortFilter;->iterator:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lorg/apache/tools/ant/filters/SortFilter;->line:Ljava/lang/String;

    .line 231
    :goto_3
    iget-object v1, p0, Lorg/apache/tools/ant/filters/SortFilter;->line:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 232
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/SortFilter;->read()I

    move-result v1

    goto :goto_1

    .line 227
    :cond_6
    iput-object v3, p0, Lorg/apache/tools/ant/filters/SortFilter;->line:Ljava/lang/String;

    .line 228
    iput-object v3, p0, Lorg/apache/tools/ant/filters/SortFilter;->lines:Ljava/util/List;

    .line 229
    iput-object v3, p0, Lorg/apache/tools/ant/filters/SortFilter;->iterator:Ljava/util/Iterator;

    goto :goto_3
.end method

.method public setComparator(Ljava/util/Comparator;)V
    .locals 0
    .param p1, "comparator"    # Ljava/util/Comparator;

    .prologue
    .line 294
    iput-object p1, p0, Lorg/apache/tools/ant/filters/SortFilter;->comparator:Ljava/util/Comparator;

    .line 295
    return-void
.end method

.method public setReverse(Z)V
    .locals 0
    .param p1, "reverse"    # Z

    .prologue
    .line 275
    iput-boolean p1, p0, Lorg/apache/tools/ant/filters/SortFilter;->reverse:Z

    .line 276
    return-void
.end method
