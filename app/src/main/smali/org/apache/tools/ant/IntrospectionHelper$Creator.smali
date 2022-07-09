.class public final Lorg/apache/tools/ant/IntrospectionHelper$Creator;
.super Ljava/lang/Object;
.source "IntrospectionHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/IntrospectionHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Creator"
.end annotation


# instance fields
.field private nestedCreator:Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;

.field private nestedObject:Ljava/lang/Object;

.field private parent:Ljava/lang/Object;

.field private polyType:Ljava/lang/String;

.field private project:Lorg/apache/tools/ant/Project;


# direct methods
.method private constructor <init>(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;)V
    .locals 0
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "parent"    # Ljava/lang/Object;
    .param p3, "nestedCreator"    # Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;

    .prologue
    .line 1305
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1306
    iput-object p1, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->project:Lorg/apache/tools/ant/Project;

    .line 1307
    iput-object p2, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->parent:Ljava/lang/Object;

    .line 1308
    iput-object p3, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->nestedCreator:Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;

    .line 1309
    return-void
.end method

.method constructor <init>(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;Lorg/apache/tools/ant/IntrospectionHelper$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/tools/ant/Project;
    .param p2, "x1"    # Ljava/lang/Object;
    .param p3, "x2"    # Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;
    .param p4, "x3"    # Lorg/apache/tools/ant/IntrospectionHelper$1;

    .prologue
    .line 1285
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/tools/ant/IntrospectionHelper$Creator;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;)V

    return-void
.end method


# virtual methods
.method public create()Ljava/lang/Object;
    .locals 6

    .prologue
    .line 1326
    iget-object v2, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->polyType:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 1327
    iget-object v2, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->nestedCreator:Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;

    invoke-virtual {v2}, Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;->isPolyMorphic()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1328
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "Not allowed to use the polymorphic form for this element"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1331
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->project:Lorg/apache/tools/ant/Project;

    invoke-static {v2}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v1

    .line 1332
    .local v1, "helper":Lorg/apache/tools/ant/ComponentHelper;
    iget-object v2, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->polyType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/ComponentHelper;->createComponent(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->nestedObject:Ljava/lang/Object;

    .line 1333
    iget-object v2, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->nestedObject:Ljava/lang/Object;

    if-nez v2, :cond_1

    .line 1334
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Unable to create object of type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->polyType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1338
    .end local v1    # "helper":Lorg/apache/tools/ant/ComponentHelper;
    :cond_1
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->nestedCreator:Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;

    iget-object v3, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->project:Lorg/apache/tools/ant/Project;

    iget-object v4, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->parent:Ljava/lang/Object;

    iget-object v5, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->nestedObject:Ljava/lang/Object;

    invoke-virtual {v2, v3, v4, v5}, Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;->create(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->nestedObject:Ljava/lang/Object;

    .line 1339
    iget-object v2, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->project:Lorg/apache/tools/ant/Project;

    if-eqz v2, :cond_2

    .line 1340
    iget-object v2, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->project:Lorg/apache/tools/ant/Project;

    iget-object v3, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->nestedObject:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/Project;->setProjectReference(Ljava/lang/Object;)V

    .line 1342
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->nestedObject:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_3

    return-object v2

    .line 1343
    :catch_0
    move-exception v0

    .line 1344
    .local v0, "ex":Ljava/lang/IllegalAccessException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 1345
    .end local v0    # "ex":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v0

    .line 1346
    .local v0, "ex":Ljava/lang/InstantiationException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 1347
    .end local v0    # "ex":Ljava/lang/InstantiationException;
    :catch_2
    move-exception v0

    .line 1348
    .local v0, "ex":Ljava/lang/IllegalArgumentException;
    iget-object v2, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->polyType:Ljava/lang/String;

    if-nez v2, :cond_3

    .line 1349
    throw v0

    .line 1351
    :cond_3
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Invalid type used "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->polyType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1352
    .end local v0    # "ex":Ljava/lang/IllegalArgumentException;
    :catch_3
    move-exception v0

    .line 1353
    .local v0, "ex":Ljava/lang/reflect/InvocationTargetException;
    invoke-static {v0}, Lorg/apache/tools/ant/IntrospectionHelper;->access$400(Ljava/lang/reflect/InvocationTargetException;)Lorg/apache/tools/ant/BuildException;

    move-result-object v2

    throw v2
.end method

.method public getRealObject()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1361
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->nestedCreator:Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;

    invoke-virtual {v0}, Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;->getRealObject()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public setPolyType(Ljava/lang/String;)V
    .locals 0
    .param p1, "polyType"    # Ljava/lang/String;

    .prologue
    .line 1317
    iput-object p1, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->polyType:Ljava/lang/String;

    .line 1318
    return-void
.end method

.method public store()V
    .locals 4

    .prologue
    .line 1370
    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->nestedCreator:Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;

    iget-object v2, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->parent:Ljava/lang/Object;

    iget-object v3, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->nestedObject:Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;->store(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_3

    .line 1383
    return-void

    .line 1371
    :catch_0
    move-exception v0

    .line 1372
    .local v0, "ex":Ljava/lang/IllegalAccessException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 1373
    .end local v0    # "ex":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v0

    .line 1374
    .local v0, "ex":Ljava/lang/InstantiationException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 1375
    .end local v0    # "ex":Ljava/lang/InstantiationException;
    :catch_2
    move-exception v0

    .line 1376
    .local v0, "ex":Ljava/lang/IllegalArgumentException;
    iget-object v1, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->polyType:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 1377
    throw v0

    .line 1379
    :cond_0
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Invalid type used "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->polyType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1380
    .end local v0    # "ex":Ljava/lang/IllegalArgumentException;
    :catch_3
    move-exception v0

    .line 1381
    .local v0, "ex":Ljava/lang/reflect/InvocationTargetException;
    invoke-static {v0}, Lorg/apache/tools/ant/IntrospectionHelper;->access$400(Ljava/lang/reflect/InvocationTargetException;)Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1
.end method
