.class Lorg/apache/tools/ant/taskdefs/Zip$6;
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
    .line 2012
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Zip$6;->this$0:Lorg/apache/tools/ant/taskdefs/Zip;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isSelected(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 3
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 2013
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2014
    const/4 v0, 0x1

    .line 2022
    :goto_0
    return v0

    .line 2015
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip$6;->this$0:Lorg/apache/tools/ant/taskdefs/Zip;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Zip;->access$100(Lorg/apache/tools/ant/taskdefs/Zip;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2016
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip$6;->this$0:Lorg/apache/tools/ant/taskdefs/Zip;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Ignoring directory "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " as only files will"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " be added."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Zip;->logWhenWriting(Ljava/lang/String;I)V

    .line 2022
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
