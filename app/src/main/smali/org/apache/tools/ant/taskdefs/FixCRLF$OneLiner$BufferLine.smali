.class Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;
.super Ljava/lang/Object;
.source "FixCRLF.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BufferLine"
.end annotation


# instance fields
.field private column:I

.field private eolStr:Ljava/lang/String;

.field private line:Ljava/lang/String;

.field private lookahead:I

.field private next:I

.field private final this$1:Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "this$1"    # Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;
    .param p2, "line"    # Ljava/lang/String;
    .param p3, "eolStr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 589
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->this$1:Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 582
    iput v1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->next:I

    .line 583
    iput v1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->column:I

    .line 584
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->lookahead:I

    .line 590
    iput v1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->next:I

    .line 591
    iput v1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->column:I

    .line 592
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->line:Ljava/lang/String;

    .line 593
    iput-object p3, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->eolStr:Ljava/lang/String;

    .line 594
    return-void
.end method


# virtual methods
.method public getChar(I)C
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 613
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->line:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0
.end method

.method public getColumn()I
    .locals 1

    .prologue
    .line 625
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->column:I

    return v0
.end method

.method public getEol()Ljava/lang/String;
    .locals 1

    .prologue
    .line 649
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->eolStr:Ljava/lang/String;

    return-object v0
.end method

.method public getEolLength()I
    .locals 1

    .prologue
    .line 641
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->eolStr:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    return v0
.end method

.method public getLineString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 645
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->line:Ljava/lang/String;

    return-object v0
.end method

.method public getLookahead()I
    .locals 1

    .prologue
    .line 605
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->lookahead:I

    return v0
.end method

.method public getNext()I
    .locals 1

    .prologue
    .line 597
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->next:I

    return v0
.end method

.method public getNextChar()C
    .locals 1

    .prologue
    .line 617
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->next:I

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->getChar(I)C

    move-result v0

    return v0
.end method

.method public getNextCharInc()C
    .locals 2

    .prologue
    .line 621
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->next:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->next:I

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->getChar(I)C

    move-result v0

    return v0
.end method

.method public getState()I
    .locals 1

    .prologue
    .line 665
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->this$1:Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->getState()I

    move-result v0

    return v0
.end method

.method public incColumn()I
    .locals 2

    .prologue
    .line 633
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->column:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->column:I

    return v0
.end method

.method public length()I
    .locals 1

    .prologue
    .line 637
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->line:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    return v0
.end method

.method public setColumn(I)V
    .locals 0
    .param p1, "col"    # I

    .prologue
    .line 629
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->column:I

    .line 630
    return-void
.end method

.method public setLookahead(I)V
    .locals 0
    .param p1, "lookahead"    # I

    .prologue
    .line 609
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->lookahead:I

    .line 610
    return-void
.end method

.method public setNext(I)V
    .locals 0
    .param p1, "next"    # I

    .prologue
    .line 601
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->next:I

    .line 602
    return-void
.end method

.method public setState(I)V
    .locals 1
    .param p1, "state"    # I

    .prologue
    .line 661
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->this$1:Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;->setState(I)V

    .line 662
    return-void
.end method

.method public substring(I)Ljava/lang/String;
    .locals 1
    .param p1, "begin"    # I

    .prologue
    .line 653
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->line:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public substring(II)Ljava/lang/String;
    .locals 1
    .param p1, "begin"    # I
    .param p2, "end"    # I

    .prologue
    .line 657
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine;->line:Ljava/lang/String;

    invoke-virtual {v0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
