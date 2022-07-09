.class final Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;
.super Ljava/lang/Object;
.source "EchoProperties.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Tuple"
.end annotation


# instance fields
.field private key:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 430
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 431
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;->key:Ljava/lang/String;

    .line 432
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;->value:Ljava/lang/String;

    .line 433
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$1;

    .prologue
    .line 426
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static access$100(Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;

    .prologue
    .line 426
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;->key:Ljava/lang/String;

    return-object v0
.end method

.method static access$200(Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;

    .prologue
    .line 426
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;->value:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public compareTo(Ljava/lang/Object;)I
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 444
    move-object v0, p1

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;

    .line 445
    .local v0, "that":Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;->key:Ljava/lang/String;

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;->key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    return v1
.end method
