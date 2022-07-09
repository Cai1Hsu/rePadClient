.class public Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "Macros.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros$InternalProvider;
    }
.end annotation


# static fields
.field public static final ELEMENT_NAME:Ljava/lang/String; = "macros"

.field public static final NAMESPACE:Ljava/lang/String; = "http://jivesoftware.com/protocol/workgroup"


# instance fields
.field private personal:Z

.field private personalMacroGroup:Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;

.field private rootGroup:Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 97
    return-void
.end method


# virtual methods
.method public getChildElementXML()Ljava/lang/String;
    .locals 3

    .prologue
    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "macros"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " xmlns=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "http://jivesoftware.com/protocol/workgroup"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->isPersonal()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 80
    const-string/jumbo v1, "<personal>true</personal>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->getPersonalMacroGroup()Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 83
    const-string/jumbo v1, "<personalMacro>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->getPersonalMacroGroup()Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->toXML()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    const-string/jumbo v1, "</personalMacro>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    :cond_1
    const-string/jumbo v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "macros"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getPersonalMacroGroup()Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->personalMacroGroup:Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;

    return-object v0
.end method

.method public getRootGroup()Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->rootGroup:Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;

    return-object v0
.end method

.method public isPersonal()Z
    .locals 1

    .prologue
    .line 49
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->personal:Z

    return v0
.end method

.method public setPersonal(Z)V
    .locals 0
    .param p1, "personal"    # Z

    .prologue
    .line 53
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->personal:Z

    .line 54
    return-void
.end method

.method public setPersonalMacroGroup(Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;)V
    .locals 0
    .param p1, "personalMacroGroup"    # Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;

    .prologue
    .line 61
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->personalMacroGroup:Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;

    .line 62
    return-void
.end method

.method public setRootGroup(Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;)V
    .locals 0
    .param p1, "rootGroup"    # Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;

    .prologue
    .line 45
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->rootGroup:Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;

    .line 46
    return-void
.end method
