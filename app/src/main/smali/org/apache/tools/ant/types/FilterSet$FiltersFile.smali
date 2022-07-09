.class public Lorg/apache/tools/ant/types/FilterSet$FiltersFile;
.super Ljava/lang/Object;
.source "FilterSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/FilterSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FiltersFile"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/tools/ant/types/FilterSet;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/types/FilterSet;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/types/FilterSet;

    .prologue
    .line 116
    iput-object p1, p0, Lorg/apache/tools/ant/types/FilterSet$FiltersFile;->this$0:Lorg/apache/tools/ant/types/FilterSet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    return-void
.end method


# virtual methods
.method public setFile(Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 125
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterSet$FiltersFile;->this$0:Lorg/apache/tools/ant/types/FilterSet;

    invoke-static {v0}, Lorg/apache/tools/ant/types/FilterSet;->access$000(Lorg/apache/tools/ant/types/FilterSet;)Ljava/util/Vector;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 126
    return-void
.end method
