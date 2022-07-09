.class abstract Lcom/mongodb/DBPort$Authenticator;
.super Ljava/lang/Object;
.source "DBPort.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DBPort;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "Authenticator"
.end annotation


# instance fields
.field protected final credential:Lcom/mongodb/MongoCredential;

.field protected final mongo:Lcom/mongodb/Mongo;

.field final synthetic this$0:Lcom/mongodb/DBPort;


# direct methods
.method constructor <init>(Lcom/mongodb/DBPort;Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)V
    .locals 0
    .param p2, "mongo"    # Lcom/mongodb/Mongo;
    .param p3, "credential"    # Lcom/mongodb/MongoCredential;

    .prologue
    .line 664
    iput-object p1, p0, Lcom/mongodb/DBPort$Authenticator;->this$0:Lcom/mongodb/DBPort;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 665
    iput-object p2, p0, Lcom/mongodb/DBPort$Authenticator;->mongo:Lcom/mongodb/Mongo;

    .line 666
    iput-object p3, p0, Lcom/mongodb/DBPort$Authenticator;->credential:Lcom/mongodb/MongoCredential;

    .line 667
    return-void
.end method


# virtual methods
.method abstract authenticate()Lcom/mongodb/CommandResult;
.end method
