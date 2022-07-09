.class Lcom/mongodb/ReflectionDBObject$FieldInfo;
.super Ljava/lang/Object;
.source "ReflectionDBObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/ReflectionDBObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "FieldInfo"
.end annotation


# instance fields
.field final _class:Ljava/lang/Class;

.field _getter:Ljava/lang/reflect/Method;

.field final _name:Ljava/lang/String;

.field _setter:Ljava/lang/reflect/Method;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/Class;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "c"    # Ljava/lang/Class;

    .prologue
    .line 236
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 237
    iput-object p1, p0, Lcom/mongodb/ReflectionDBObject$FieldInfo;->_name:Ljava/lang/String;

    .line 238
    iput-object p2, p0, Lcom/mongodb/ReflectionDBObject$FieldInfo;->_class:Ljava/lang/Class;

    .line 239
    return-void
.end method


# virtual methods
.method ok()Z
    .locals 1

    .prologue
    .line 242
    iget-object v0, p0, Lcom/mongodb/ReflectionDBObject$FieldInfo;->_getter:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mongodb/ReflectionDBObject$FieldInfo;->_setter:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
