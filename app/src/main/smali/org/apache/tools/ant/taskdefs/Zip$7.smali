.class Lorg/apache/tools/ant/taskdefs/Zip$7;
.super Ljava/lang/Object;
.source "Zip.java"

# interfaces
.implements Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/Zip;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Zip;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Zip;

    .prologue
    .line 2036
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Zip$7;->this$0:Lorg/apache/tools/ant/taskdefs/Zip;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isSelected(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 2037
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v0

    return v0
.end method
