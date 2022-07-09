.class Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;
.super Lorg/apache/tools/ant/types/resources/Restrict;
.source "Checksum.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Checksum;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FileUnion"
.end annotation


# instance fields
.field private u:Lorg/apache/tools/ant/types/resources/Union;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 72
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/Restrict;-><init>()V

    .line 73
    new-instance v0, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;->u:Lorg/apache/tools/ant/types/resources/Union;

    .line 74
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;->u:Lorg/apache/tools/ant/types/resources/Union;

    invoke-super {p0, v0}, Lorg/apache/tools/ant/types/resources/Restrict;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 75
    sget-object v0, Lorg/apache/tools/ant/types/resources/selectors/Type;->FILE:Lorg/apache/tools/ant/types/resources/selectors/Type;

    invoke-super {p0, v0}, Lorg/apache/tools/ant/types/resources/Restrict;->add(Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V

    .line 76
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 78
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Checksum$FileUnion;->u:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 79
    return-void
.end method
