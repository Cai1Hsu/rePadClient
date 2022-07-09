.class final Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;
.super Ljava/lang/Object;
.source "Ant.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Ant;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PropertyType"
.end annotation


# static fields
.field private static final INHERITED:Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;

.field private static final PLAIN:Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;

.field private static final USER:Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 839
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;->PLAIN:Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;

    .line 840
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;->INHERITED:Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;

    .line 841
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;->USER:Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 838
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static access$000()Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;
    .locals 1

    .prologue
    .line 837
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;->USER:Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;

    return-object v0
.end method

.method static access$100()Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;
    .locals 1

    .prologue
    .line 837
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;->PLAIN:Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;

    return-object v0
.end method

.method static access$200()Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;
    .locals 1

    .prologue
    .line 837
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;->INHERITED:Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;

    return-object v0
.end method
