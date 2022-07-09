.class Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;
.super Ljava/lang/Object;
.source "XMPPError.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/packet/XMPPError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ErrorSpecification"
.end annotation


# static fields
.field private static instances:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/jivesoftware/smack/packet/XMPPError$Condition;",
            "Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private code:I

.field private condition:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

.field private type:Lorg/jivesoftware/smack/packet/XMPPError$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 360
    invoke-static {}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;->errorSpecifications()Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;->instances:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V
    .locals 0
    .param p1, "condition"    # Lorg/jivesoftware/smack/packet/XMPPError$Condition;
    .param p2, "type"    # Lorg/jivesoftware/smack/packet/XMPPError$Type;
    .param p3, "code"    # I

    .prologue
    .line 362
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 363
    iput p3, p0, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;->code:I

    .line 364
    iput-object p2, p0, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;->type:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    .line 365
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;->condition:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    .line 366
    return-void
.end method

.method private static errorSpecifications()Ljava/util/Map;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lorg/jivesoftware/smack/packet/XMPPError$Condition;",
            "Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v10, 0x197

    const/16 v9, 0x12e

    const/16 v8, 0x1f4

    const/16 v7, 0x194

    const/16 v6, 0x190

    .line 369
    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x16

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 370
    .local v0, "instances":Ljava/util/Map;, "Ljava/util/Map<Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;>;"
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->interna_server_error:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->interna_server_error:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->WAIT:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    invoke-direct {v2, v3, v4, v8}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 372
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->forbidden:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->forbidden:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->AUTH:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    const/16 v5, 0x193

    invoke-direct {v2, v3, v4, v5}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 374
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->bad_request:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->bad_request:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->MODIFY:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    invoke-direct {v2, v3, v4, v6}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 376
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->item_not_found:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->item_not_found:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->CANCEL:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    invoke-direct {v2, v3, v4, v7}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->conflict:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->conflict:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->CANCEL:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    const/16 v5, 0x199

    invoke-direct {v2, v3, v4, v5}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 380
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->feature_not_implemented:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->feature_not_implemented:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->CANCEL:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    const/16 v5, 0x1f5

    invoke-direct {v2, v3, v4, v5}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 382
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->gone:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->gone:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->MODIFY:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    invoke-direct {v2, v3, v4, v9}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 384
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->jid_malformed:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->jid_malformed:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->MODIFY:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    invoke-direct {v2, v3, v4, v6}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 386
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->no_acceptable:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->no_acceptable:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->MODIFY:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    const/16 v5, 0x196

    invoke-direct {v2, v3, v4, v5}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 388
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->not_allowed:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->not_allowed:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->CANCEL:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    const/16 v5, 0x195

    invoke-direct {v2, v3, v4, v5}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 390
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->not_authorized:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->not_authorized:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->AUTH:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    const/16 v5, 0x191

    invoke-direct {v2, v3, v4, v5}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 392
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->payment_required:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->payment_required:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->AUTH:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    const/16 v5, 0x192

    invoke-direct {v2, v3, v4, v5}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->recipient_unavailable:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->recipient_unavailable:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->WAIT:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    invoke-direct {v2, v3, v4, v7}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->redirect:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->redirect:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->MODIFY:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    invoke-direct {v2, v3, v4, v9}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 398
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->registration_required:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->registration_required:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->AUTH:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    invoke-direct {v2, v3, v4, v10}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 400
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->remote_server_not_found:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->remote_server_not_found:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->CANCEL:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    invoke-direct {v2, v3, v4, v7}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 402
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->remote_server_timeout:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->remote_server_timeout:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->WAIT:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    const/16 v5, 0x1f8

    invoke-direct {v2, v3, v4, v5}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->remote_server_error:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->remote_server_error:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->CANCEL:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    const/16 v5, 0x1f6

    invoke-direct {v2, v3, v4, v5}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 406
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->resource_constraint:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->resource_constraint:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->WAIT:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    invoke-direct {v2, v3, v4, v8}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 408
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->service_unavailable:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->service_unavailable:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->CANCEL:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    const/16 v5, 0x1f7

    invoke-direct {v2, v3, v4, v5}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->subscription_required:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->subscription_required:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->AUTH:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    invoke-direct {v2, v3, v4, v10}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 412
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->undefined_condition:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->undefined_condition:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->WAIT:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    invoke-direct {v2, v3, v4, v8}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 414
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->unexpected_request:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->unexpected_request:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->WAIT:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    invoke-direct {v2, v3, v4, v6}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 416
    sget-object v1, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->request_timeout:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->request_timeout:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Type;->CANCEL:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    const/16 v5, 0x198

    invoke-direct {v2, v3, v4, v5}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Lorg/jivesoftware/smack/packet/XMPPError$Type;I)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 419
    return-object v0
.end method

.method protected static specFor(Lorg/jivesoftware/smack/packet/XMPPError$Condition;)Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;
    .locals 1
    .param p0, "condition"    # Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    .prologue
    .line 423
    sget-object v0, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;->instances:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    return-object v0
.end method


# virtual methods
.method protected getCode()I
    .locals 1

    .prologue
    .line 450
    iget v0, p0, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;->code:I

    return v0
.end method

.method protected getCondition()Lorg/jivesoftware/smack/packet/XMPPError$Condition;
    .locals 1

    .prologue
    .line 432
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;->condition:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    return-object v0
.end method

.method protected getType()Lorg/jivesoftware/smack/packet/XMPPError$Type;
    .locals 1

    .prologue
    .line 441
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;->type:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    return-object v0
.end method
