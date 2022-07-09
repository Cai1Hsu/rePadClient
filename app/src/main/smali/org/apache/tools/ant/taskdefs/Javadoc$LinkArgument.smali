.class public Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;
.super Ljava/lang/Object;
.source "Javadoc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Javadoc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LinkArgument"
.end annotation


# instance fields
.field private href:Ljava/lang/String;

.field private offline:Z

.field private packagelistLoc:Ljava/io/File;

.field private packagelistURL:Ljava/net/URL;

.field private resolveLink:Z

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Javadoc;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/Javadoc;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Javadoc;

    .prologue
    const/4 v0, 0x0

    .line 1188
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->this$0:Lorg/apache/tools/ant/taskdefs/Javadoc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1182
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->offline:Z

    .line 1185
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->resolveLink:Z

    .line 1190
    return-void
.end method


# virtual methods
.method public getHref()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1205
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->href:Ljava/lang/String;

    return-object v0
.end method

.method public getPackagelistLoc()Ljava/io/File;
    .locals 1

    .prologue
    .line 1221
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->packagelistLoc:Ljava/io/File;

    return-object v0
.end method

.method public getPackagelistURL()Ljava/net/URL;
    .locals 1

    .prologue
    .line 1237
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->packagelistURL:Ljava/net/URL;

    return-object v0
.end method

.method public isLinkOffline()Z
    .locals 1

    .prologue
    .line 1253
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->offline:Z

    return v0
.end method

.method public setHref(Ljava/lang/String;)V
    .locals 0
    .param p1, "hr"    # Ljava/lang/String;

    .prologue
    .line 1197
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->href:Ljava/lang/String;

    .line 1198
    return-void
.end method

.method public setOffline(Z)V
    .locals 0
    .param p1, "offline"    # Z

    .prologue
    .line 1245
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->offline:Z

    .line 1246
    return-void
.end method

.method public setPackagelistLoc(Ljava/io/File;)V
    .locals 0
    .param p1, "src"    # Ljava/io/File;

    .prologue
    .line 1213
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->packagelistLoc:Ljava/io/File;

    .line 1214
    return-void
.end method

.method public setPackagelistURL(Ljava/net/URL;)V
    .locals 0
    .param p1, "src"    # Ljava/net/URL;

    .prologue
    .line 1229
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->packagelistURL:Ljava/net/URL;

    .line 1230
    return-void
.end method

.method public setResolveLink(Z)V
    .locals 0
    .param p1, "resolve"    # Z

    .prologue
    .line 1262
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->resolveLink:Z

    .line 1263
    return-void
.end method

.method public shouldResolveLink()Z
    .locals 1

    .prologue
    .line 1271
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->resolveLink:Z

    return v0
.end method
