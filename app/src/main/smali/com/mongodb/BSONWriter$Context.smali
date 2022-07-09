.class Lcom/mongodb/BSONWriter$Context;
.super Ljava/lang/Object;
.source "BSONWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/BSONWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Context"
.end annotation


# instance fields
.field private final contextType:Lcom/mongodb/BSONContextType;

.field private final parentContext:Lcom/mongodb/BSONWriter$Context;

.field final synthetic this$0:Lcom/mongodb/BSONWriter;


# direct methods
.method public constructor <init>(Lcom/mongodb/BSONWriter;Lcom/mongodb/BSONWriter$Context;)V
    .locals 1
    .param p2, "from"    # Lcom/mongodb/BSONWriter$Context;

    .prologue
    .line 558
    iput-object p1, p0, Lcom/mongodb/BSONWriter$Context;->this$0:Lcom/mongodb/BSONWriter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 559
    iget-object v0, p2, Lcom/mongodb/BSONWriter$Context;->parentContext:Lcom/mongodb/BSONWriter$Context;

    iput-object v0, p0, Lcom/mongodb/BSONWriter$Context;->parentContext:Lcom/mongodb/BSONWriter$Context;

    .line 560
    iget-object v0, p2, Lcom/mongodb/BSONWriter$Context;->contextType:Lcom/mongodb/BSONContextType;

    iput-object v0, p0, Lcom/mongodb/BSONWriter$Context;->contextType:Lcom/mongodb/BSONContextType;

    .line 561
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/BSONWriter;Lcom/mongodb/BSONWriter$Context;Lcom/mongodb/BSONContextType;)V
    .locals 0
    .param p2, "parentContext"    # Lcom/mongodb/BSONWriter$Context;
    .param p3, "contextType"    # Lcom/mongodb/BSONContextType;

    .prologue
    .line 563
    iput-object p1, p0, Lcom/mongodb/BSONWriter$Context;->this$0:Lcom/mongodb/BSONWriter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 564
    iput-object p2, p0, Lcom/mongodb/BSONWriter$Context;->parentContext:Lcom/mongodb/BSONWriter$Context;

    .line 565
    iput-object p3, p0, Lcom/mongodb/BSONWriter$Context;->contextType:Lcom/mongodb/BSONContextType;

    .line 566
    return-void
.end method


# virtual methods
.method public copy()Lcom/mongodb/BSONWriter$Context;
    .locals 2

    .prologue
    .line 577
    new-instance v0, Lcom/mongodb/BSONWriter$Context;

    iget-object v1, p0, Lcom/mongodb/BSONWriter$Context;->this$0:Lcom/mongodb/BSONWriter;

    invoke-direct {v0, v1, p0}, Lcom/mongodb/BSONWriter$Context;-><init>(Lcom/mongodb/BSONWriter;Lcom/mongodb/BSONWriter$Context;)V

    return-object v0
.end method

.method public getContextType()Lcom/mongodb/BSONContextType;
    .locals 1

    .prologue
    .line 573
    iget-object v0, p0, Lcom/mongodb/BSONWriter$Context;->contextType:Lcom/mongodb/BSONContextType;

    return-object v0
.end method

.method public getParentContext()Lcom/mongodb/BSONWriter$Context;
    .locals 1

    .prologue
    .line 569
    iget-object v0, p0, Lcom/mongodb/BSONWriter$Context;->parentContext:Lcom/mongodb/BSONWriter$Context;

    return-object v0
.end method
