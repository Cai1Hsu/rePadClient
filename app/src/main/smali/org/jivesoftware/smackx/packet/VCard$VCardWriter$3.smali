.class Lorg/jivesoftware/smackx/packet/VCard$VCardWriter$3;
.super Ljava/lang/Object;
.source "VCard.java"

# interfaces
.implements Lorg/jivesoftware/smackx/packet/VCard$ContentBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;->appendEmail(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;

.field final synthetic val$email:Ljava/lang/String;

.field final synthetic val$type:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 770
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/VCard$VCardWriter$3;->this$1:Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;

    iput-object p2, p0, Lorg/jivesoftware/smackx/packet/VCard$VCardWriter$3;->val$type:Ljava/lang/String;

    iput-object p3, p0, Lorg/jivesoftware/smackx/packet/VCard$VCardWriter$3;->val$email:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addTagContent()V
    .locals 3

    .prologue
    .line 772
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard$VCardWriter$3;->this$1:Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;

    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/VCard$VCardWriter$3;->val$type:Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;->access$1200(Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;Ljava/lang/Object;)V

    .line 773
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard$VCardWriter$3;->this$1:Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;

    const-string/jumbo v1, "INTERNET"

    invoke-static {v0, v1}, Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;->access$1200(Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;Ljava/lang/Object;)V

    .line 774
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard$VCardWriter$3;->this$1:Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;

    const-string/jumbo v1, "PREF"

    invoke-static {v0, v1}, Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;->access$1200(Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;Ljava/lang/Object;)V

    .line 775
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/VCard$VCardWriter$3;->this$1:Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;

    const-string/jumbo v1, "USERID"

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/VCard$VCardWriter$3;->val$email:Ljava/lang/String;

    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;->access$1000(Lorg/jivesoftware/smackx/packet/VCard$VCardWriter;Ljava/lang/String;Ljava/lang/String;)V

    .line 776
    return-void
.end method
