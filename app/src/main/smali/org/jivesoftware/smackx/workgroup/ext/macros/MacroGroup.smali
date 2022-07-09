.class public Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;
.super Ljava/lang/Object;
.source "MacroGroup.java"


# instance fields
.field private macroGroups:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;",
            ">;"
        }
    .end annotation
.end field

.field private macros:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;",
            ">;"
        }
    .end annotation
.end field

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->macros:Ljava/util/List;

    .line 41
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->macroGroups:Ljava/util/List;

    .line 42
    return-void
.end method


# virtual methods
.method public addMacro(Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;)V
    .locals 1
    .param p1, "macro"    # Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;

    .prologue
    .line 45
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->macros:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    return-void
.end method

.method public addMacroGroup(Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;)V
    .locals 1
    .param p1, "group"    # Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->macroGroups:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    return-void
.end method

.method public getMacro(I)Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;
    .locals 1
    .param p1, "location"    # I

    .prologue
    .line 73
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->macros:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;

    return-object v0
.end method

.method public getMacroByTitle(Ljava/lang/String;)Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;
    .locals 4
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 53
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->macros:Ljava/util/List;

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 54
    .local v0, "col":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;>;"
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 55
    .local v1, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;>;"
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 56
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;

    .line 57
    .local v2, "macro":Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;->getTitle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 61
    .end local v2    # "macro":Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;
    :goto_0
    return-object v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public getMacroGroup(I)Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;
    .locals 1
    .param p1, "location"    # I

    .prologue
    .line 89
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->macroGroups:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;

    return-object v0
.end method

.method public getMacroGroupByTitle(Ljava/lang/String;)Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;
    .locals 4
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 77
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->macroGroups:Ljava/util/List;

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 78
    .local v0, "col":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;>;"
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 79
    .local v2, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;>;"
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 80
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;

    .line 81
    .local v1, "group":Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->getTitle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 85
    .end local v1    # "group":Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;
    :goto_0
    return-object v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getMacroGroups()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;",
            ">;"
        }
    .end annotation

    .prologue
    .line 102
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->macroGroups:Ljava/util/List;

    return-object v0
.end method

.method public getMacros()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;",
            ">;"
        }
    .end annotation

    .prologue
    .line 94
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->macros:Ljava/util/List;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->title:Ljava/lang/String;

    return-object v0
.end method

.method public removeMacro(Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;)V
    .locals 1
    .param p1, "macro"    # Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;

    .prologue
    .line 49
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->macros:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 50
    return-void
.end method

.method public removeMacroGroup(Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;)V
    .locals 1
    .param p1, "group"    # Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;

    .prologue
    .line 69
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->macroGroups:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 70
    return-void
.end method

.method public setMacroGroups(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 106
    .local p1, "macroGroups":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;>;"
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->macroGroups:Ljava/util/List;

    .line 107
    return-void
.end method

.method public setMacros(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 98
    .local p1, "macros":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;>;"
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->macros:Ljava/util/List;

    .line 99
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 114
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->title:Ljava/lang/String;

    .line 115
    return-void
.end method

.method public toXML()Ljava/lang/String;
    .locals 6

    .prologue
    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 119
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v4, "<macrogroup>"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "<title>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->getTitle()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "</title>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    const-string/jumbo v4, "<macros>"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->getMacros()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;

    .line 124
    .local v3, "macro":Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;
    const-string/jumbo v4, "<macro>"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "<title>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;->getTitle()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "</title>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "<type>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;->getType()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "</type>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "<description>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;->getDescription()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "</description>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "<response>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;->getResponse()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "</response>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    const-string/jumbo v4, "</macro>"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 131
    .end local v3    # "macro":Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;
    :cond_0
    const-string/jumbo v4, "</macros>"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->getMacroGroups()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_2

    .line 134
    const-string/jumbo v4, "<macroGroups>"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->getMacroGroups()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;

    .line 136
    .local v1, "groups":Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->toXML()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 138
    .end local v1    # "groups":Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;
    :cond_1
    const-string/jumbo v4, "</macroGroups>"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    :cond_2
    const-string/jumbo v4, "</macrogroup>"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method
