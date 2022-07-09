.class Lorg/apache/tools/ant/taskdefs/Concat$2;
.super Ljava/lang/Object;
.source "Concat.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/Concat$ReaderFactory;


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/Concat;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Concat;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Concat;

    .prologue
    .line 503
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Concat$2;->this$0:Lorg/apache/tools/ant/taskdefs/Concat;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getReader(Ljava/lang/Object;)Ljava/io/Reader;
    .locals 0
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 504
    check-cast p1, Ljava/io/Reader;

    .end local p1    # "o":Ljava/lang/Object;
    return-object p1
.end method
