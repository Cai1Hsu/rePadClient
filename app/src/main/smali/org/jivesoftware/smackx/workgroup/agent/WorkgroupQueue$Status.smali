.class public Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;
.super Ljava/lang/Object;
.source "WorkgroupQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Status"
.end annotation


# static fields
.field public static final ACTIVE:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

.field public static final CLOSED:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

.field public static final OPEN:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;


# instance fields
.field private value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 174
    new-instance v0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    const-string/jumbo v1, "open"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;->OPEN:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    .line 181
    new-instance v0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    const-string/jumbo v1, "active"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;->ACTIVE:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    .line 186
    new-instance v0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    const-string/jumbo v1, "closed"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;->CLOSED:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 217
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;->value:Ljava/lang/String;

    .line 218
    return-void
.end method

.method public static fromString(Ljava/lang/String;)Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;
    .locals 2
    .param p0, "type"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 196
    if-nez p0, :cond_1

    .line 210
    :cond_0
    :goto_0
    return-object v0

    .line 199
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 200
    sget-object v1, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;->OPEN:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 201
    sget-object v0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;->OPEN:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    goto :goto_0

    .line 203
    :cond_2
    sget-object v1, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;->ACTIVE:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 204
    sget-object v0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;->ACTIVE:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    goto :goto_0

    .line 206
    :cond_3
    sget-object v1, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;->CLOSED:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 207
    sget-object v0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;->CLOSED:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    goto :goto_0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 221
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;->value:Ljava/lang/String;

    return-object v0
.end method
