.class Lcom/edutech/appmanage/MainActivity$AppInfo;
.super Ljava/lang/Object;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/appmanage/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AppInfo"
.end annotation


# instance fields
.field public apkname:Ljava/lang/String;

.field public appicon:Landroid/graphics/drawable/Drawable;

.field public appname:Ljava/lang/String;

.field public appsize:Ljava/lang/String;

.field public apptype:I

.field public classname:Ljava/lang/String;

.field public doing:Z

.field public iconurl:Ljava/lang/String;

.field public islocal:Z

.field public local_versionName:Ljava/lang/String;

.field public packagename:Ljava/lang/String;

.field final synthetic this$0:Lcom/edutech/appmanage/MainActivity;

.field public update:Z

.field public versionCode:I

.field public versionName:Ljava/lang/String;

.field public webpath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/MainActivity;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 155
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$AppInfo;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 157
    iput v1, p0, Lcom/edutech/appmanage/MainActivity$AppInfo;->apptype:I

    .line 159
    iput v1, p0, Lcom/edutech/appmanage/MainActivity$AppInfo;->versionCode:I

    .line 161
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity$AppInfo;->local_versionName:Ljava/lang/String;

    .line 163
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity$AppInfo;->apkname:Ljava/lang/String;

    .line 165
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity$AppInfo;->appname:Ljava/lang/String;

    .line 167
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    .line 169
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity$AppInfo;->appsize:Ljava/lang/String;

    .line 171
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity$AppInfo;->versionName:Ljava/lang/String;

    .line 173
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity$AppInfo;->webpath:Ljava/lang/String;

    .line 175
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity$AppInfo;->iconurl:Ljava/lang/String;

    .line 177
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity$AppInfo;->classname:Ljava/lang/String;

    .line 179
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity$AppInfo;->appicon:Landroid/graphics/drawable/Drawable;

    .line 181
    iput-boolean v1, p0, Lcom/edutech/appmanage/MainActivity$AppInfo;->update:Z

    .line 183
    iput-boolean v1, p0, Lcom/edutech/appmanage/MainActivity$AppInfo;->doing:Z

    .line 185
    iput-boolean v1, p0, Lcom/edutech/appmanage/MainActivity$AppInfo;->islocal:Z

    return-void
.end method
