.class public final enum Lorg/jivesoftware/smackx/pubsub/PubSubElementType;
.super Ljava/lang/Enum;
.source "PubSubElementType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/jivesoftware/smackx/pubsub/PubSubElementType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum AFFILIATIONS:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum CONFIGURATION:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum CONFIGURE:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum CONFIGURE_OWNER:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum CREATE:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum DEFAULT:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum DELETE:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum DELETE_EVENT:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum ITEM:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum ITEMS:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum ITEMS_EVENT:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum ITEM_EVENT:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum OPTIONS:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum PUBLISH:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum PUBLISH_OPTIONS:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum PURGE_EVENT:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum PURGE_OWNER:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum RETRACT:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum SUBSCRIBE:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum SUBSCRIPTION:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum SUBSCRIPTIONS:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

.field public static final enum UNSUBSCRIBE:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;


# instance fields
.field private eName:Ljava/lang/String;

.field private nSpace:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 26
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "CREATE"

    const-string/jumbo v2, "create"

    sget-object v3, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->BASIC:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v5, v2, v3}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->CREATE:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 27
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "DELETE"

    const-string/jumbo v2, "delete"

    sget-object v3, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->OWNER:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v6, v2, v3}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->DELETE:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 28
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "DELETE_EVENT"

    const-string/jumbo v2, "delete"

    sget-object v3, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->EVENT:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v7, v2, v3}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->DELETE_EVENT:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 29
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "CONFIGURE"

    const-string/jumbo v2, "configure"

    sget-object v3, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->BASIC:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v8, v2, v3}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->CONFIGURE:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 30
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "CONFIGURE_OWNER"

    const-string/jumbo v2, "configure"

    sget-object v3, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->OWNER:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v9, v2, v3}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->CONFIGURE_OWNER:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 31
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "CONFIGURATION"

    const/4 v2, 0x5

    const-string/jumbo v3, "configuration"

    sget-object v4, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->EVENT:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->CONFIGURATION:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 32
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "OPTIONS"

    const/4 v2, 0x6

    const-string/jumbo v3, "options"

    sget-object v4, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->BASIC:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->OPTIONS:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 33
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "DEFAULT"

    const/4 v2, 0x7

    const-string/jumbo v3, "default"

    sget-object v4, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->OWNER:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->DEFAULT:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 34
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "ITEMS"

    const/16 v2, 0x8

    const-string/jumbo v3, "items"

    sget-object v4, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->BASIC:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->ITEMS:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 35
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "ITEMS_EVENT"

    const/16 v2, 0x9

    const-string/jumbo v3, "items"

    sget-object v4, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->EVENT:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->ITEMS_EVENT:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 36
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "ITEM"

    const/16 v2, 0xa

    const-string/jumbo v3, "item"

    sget-object v4, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->BASIC:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->ITEM:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 37
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "ITEM_EVENT"

    const/16 v2, 0xb

    const-string/jumbo v3, "item"

    sget-object v4, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->EVENT:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->ITEM_EVENT:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 38
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "PUBLISH"

    const/16 v2, 0xc

    const-string/jumbo v3, "publish"

    sget-object v4, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->BASIC:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->PUBLISH:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 39
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "PUBLISH_OPTIONS"

    const/16 v2, 0xd

    const-string/jumbo v3, "publish-options"

    sget-object v4, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->BASIC:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->PUBLISH_OPTIONS:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 40
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "PURGE_OWNER"

    const/16 v2, 0xe

    const-string/jumbo v3, "purge"

    sget-object v4, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->OWNER:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->PURGE_OWNER:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 41
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "PURGE_EVENT"

    const/16 v2, 0xf

    const-string/jumbo v3, "purge"

    sget-object v4, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->EVENT:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->PURGE_EVENT:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 42
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "RETRACT"

    const/16 v2, 0x10

    const-string/jumbo v3, "retract"

    sget-object v4, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->BASIC:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->RETRACT:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 43
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "AFFILIATIONS"

    const/16 v2, 0x11

    const-string/jumbo v3, "affiliations"

    sget-object v4, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->BASIC:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->AFFILIATIONS:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 44
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "SUBSCRIBE"

    const/16 v2, 0x12

    const-string/jumbo v3, "subscribe"

    sget-object v4, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->BASIC:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->SUBSCRIBE:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 45
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "SUBSCRIPTION"

    const/16 v2, 0x13

    const-string/jumbo v3, "subscription"

    sget-object v4, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->BASIC:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->SUBSCRIPTION:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 46
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "SUBSCRIPTIONS"

    const/16 v2, 0x14

    const-string/jumbo v3, "subscriptions"

    sget-object v4, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->BASIC:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->SUBSCRIPTIONS:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 47
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    const-string/jumbo v1, "UNSUBSCRIBE"

    const/16 v2, 0x15

    const-string/jumbo v3, "unsubscribe"

    sget-object v4, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->BASIC:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->UNSUBSCRIBE:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    .line 24
    const/16 v0, 0x16

    new-array v0, v0, [Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    sget-object v1, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->CREATE:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v1, v0, v5

    sget-object v1, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->DELETE:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v1, v0, v6

    sget-object v1, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->DELETE_EVENT:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v1, v0, v7

    sget-object v1, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->CONFIGURE:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v1, v0, v8

    sget-object v1, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->CONFIGURE_OWNER:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v1, v0, v9

    const/4 v1, 0x5

    sget-object v2, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->CONFIGURATION:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->OPTIONS:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->DEFAULT:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->ITEMS:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->ITEMS_EVENT:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->ITEM:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->ITEM_EVENT:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->PUBLISH:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->PUBLISH_OPTIONS:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->PURGE_OWNER:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->PURGE_EVENT:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->RETRACT:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->AFFILIATIONS:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->SUBSCRIBE:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v2, v0, v1

    const/16 v1, 0x13

    sget-object v2, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->SUBSCRIPTION:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v2, v0, v1

    const/16 v1, 0x14

    sget-object v2, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->SUBSCRIPTIONS:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v2, v0, v1

    const/16 v1, 0x15

    sget-object v2, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->UNSUBSCRIBE:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    aput-object v2, v0, v1

    sput-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->$VALUES:[Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V
    .locals 0
    .param p3, "elemName"    # Ljava/lang/String;
    .param p4, "ns"    # Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;",
            ")V"
        }
    .end annotation

    .prologue
    .line 53
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 54
    iput-object p3, p0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->eName:Ljava/lang/String;

    .line 55
    iput-object p4, p0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->nSpace:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    .line 56
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/jivesoftware/smackx/pubsub/PubSubElementType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 24
    const-class v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    return-object v0
.end method

.method public static valueOfFromElemName(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/pubsub/PubSubElementType;
    .locals 5
    .param p0, "elemName"    # Ljava/lang/String;
    .param p1, "namespace"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0x5f

    .line 70
    const/16 v2, 0x23

    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 71
    .local v1, "index":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    const/4 v0, 0x0

    .line 73
    .local v0, "fragment":Ljava/lang/String;
    :goto_0
    if-eqz v0, :cond_1

    .line 75
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    move-result-object v2

    .line 77
    :goto_1
    return-object v2

    .line 71
    .end local v0    # "fragment":Ljava/lang/String;
    :cond_0
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 77
    .restart local v0    # "fragment":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2d

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    move-result-object v2

    goto :goto_1
.end method

.method public static values()[Lorg/jivesoftware/smackx/pubsub/PubSubElementType;
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->$VALUES:[Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    invoke-virtual {v0}, [Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    return-object v0
.end method


# virtual methods
.method public getElementName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->eName:Ljava/lang/String;

    return-object v0
.end method

.method public getNamespace()Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->nSpace:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    return-object v0
.end method
