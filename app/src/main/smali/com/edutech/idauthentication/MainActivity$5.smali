.class Lcom/edutech/idauthentication/MainActivity$5;
.super Ljava/lang/Thread;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/idauthentication/MainActivity;->settingPwdUpdateHttp()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/idauthentication/MainActivity;


# direct methods
.method constructor <init>(Lcom/edutech/idauthentication/MainActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/idauthentication/MainActivity$5;->this$0:Lcom/edutech/idauthentication/MainActivity;

    .line 751
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 755
    invoke-static {}, Lcom/edutech/utils/XmlLoadHelper;->loadIpXml()Ljava/util/HashMap;

    move-result-object v0

    .line 756
    .local v0, "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v6, "ip"

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 757
    .local v1, "ip":Ljava/lang/String;
    const-string/jumbo v6, "username"

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 758
    .local v5, "username":Ljava/lang/String;
    if-eqz v1, :cond_1

    if-eqz v5, :cond_1

    const-string/jumbo v6, ""

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    const-string/jumbo v6, ""

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 760
    invoke-static {v1, v5}, Lcom/edutech/idauthentication/AppEnvironment;->SETTING_PWD_UPDATE_HTTPPOST_URL(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 762
    .local v4, "url":Ljava/lang/String;
    iget-object v6, p0, Lcom/edutech/idauthentication/MainActivity$5;->this$0:Lcom/edutech/idauthentication/MainActivity;

    invoke-virtual {v6, v4}, Lcom/edutech/idauthentication/MainActivity;->getUpdateJson(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 764
    .local v2, "json":Ljava/lang/String;
    invoke-static {v2}, Lcom/edutech/idauthentication/JsonHelper;->parseSetPwdReturnJson(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 767
    .local v3, "password":Ljava/lang/String;
    if-eqz v3, :cond_0

    const-string/jumbo v6, ""

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 768
    iget-object v6, p0, Lcom/edutech/idauthentication/MainActivity$5;->this$0:Lcom/edutech/idauthentication/MainActivity;

    const-string/jumbo v7, "0"

    invoke-virtual {v6, v7, v3}, Lcom/edutech/idauthentication/MainActivity;->settingPwdUpdate(Ljava/lang/String;Ljava/lang/String;)V

    .line 769
    :cond_0
    const/4 v6, 0x0

    sput-boolean v6, Lcom/edutech/idauthentication/MainActivity;->isUpdatePwd:Z

    .line 771
    .end local v2    # "json":Ljava/lang/String;
    .end local v3    # "password":Ljava/lang/String;
    .end local v4    # "url":Ljava/lang/String;
    :cond_1
    return-void
.end method
