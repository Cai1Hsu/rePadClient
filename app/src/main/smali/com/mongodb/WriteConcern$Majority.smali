.class public Lcom/mongodb/WriteConcern$Majority;
.super Lcom/mongodb/WriteConcern;
.source "WriteConcern.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/WriteConcern;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Majority"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x394aa689063d0b8cL


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 600
    const-string/jumbo v0, "majority"

    invoke-direct {p0, v0, v1, v1, v1}, Lcom/mongodb/WriteConcern;-><init>(Ljava/lang/String;IZZ)V

    .line 601
    return-void
.end method

.method public constructor <init>(IZZ)V
    .locals 1
    .param p1, "wtimeout"    # I
    .param p2, "fsync"    # Z
    .param p3, "j"    # Z

    .prologue
    .line 604
    const-string/jumbo v0, "majority"

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/mongodb/WriteConcern;-><init>(Ljava/lang/String;IZZ)V

    .line 605
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 609
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[Majority] WriteConcern "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mongodb/WriteConcern$Majority;->getCommand()Lcom/mongodb/BasicDBObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
