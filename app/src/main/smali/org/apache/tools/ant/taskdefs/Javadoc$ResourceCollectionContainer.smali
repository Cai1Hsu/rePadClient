.class public Lorg/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer;
.super Ljava/lang/Object;
.source "Javadoc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Javadoc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ResourceCollectionContainer"
.end annotation


# instance fields
.field private rcs:Ljava/util/ArrayList;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Javadoc;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/Javadoc;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Javadoc;

    .prologue
    .line 368
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer;->this$0:Lorg/apache/tools/ant/taskdefs/Javadoc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 369
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer;->rcs:Ljava/util/ArrayList;

    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer;)Ljava/util/Iterator;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer;

    .prologue
    .line 368
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method private iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 383
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer;->rcs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 375
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer;->rcs:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 376
    return-void
.end method
