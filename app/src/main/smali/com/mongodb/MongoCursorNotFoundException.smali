.class public Lcom/mongodb/MongoCursorNotFoundException;
.super Lcom/mongodb/MongoException;
.source "MongoCursorNotFoundException.java"


# static fields
.field private static final serialVersionUID:J = -0x3d463948dc511dfeL


# instance fields
.field private final cursorId:J

.field private final serverAddress:Lcom/mongodb/ServerAddress;


# direct methods
.method constructor <init>(JLcom/mongodb/ServerAddress;)V
    .locals 3
    .param p1, "cursorId"    # J
    .param p3, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 36
    const/4 v0, -0x5

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Cursor "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " not found on server "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/mongodb/MongoException;-><init>(ILjava/lang/String;)V

    .line 37
    iput-wide p1, p0, Lcom/mongodb/MongoCursorNotFoundException;->cursorId:J

    .line 38
    iput-object p3, p0, Lcom/mongodb/MongoCursorNotFoundException;->serverAddress:Lcom/mongodb/ServerAddress;

    .line 39
    return-void
.end method


# virtual methods
.method public getCursorId()J
    .locals 2

    .prologue
    .line 47
    iget-wide v0, p0, Lcom/mongodb/MongoCursorNotFoundException;->cursorId:J

    return-wide v0
.end method

.method public getServerAddress()Lcom/mongodb/ServerAddress;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/mongodb/MongoCursorNotFoundException;->serverAddress:Lcom/mongodb/ServerAddress;

    return-object v0
.end method
