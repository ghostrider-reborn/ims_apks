.class Lorg/codeaurora/ims/ImsServiceSub$1;
.super Ljava/lang/Object;
.source "ImsServiceSub.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/codeaurora/ims/ImsServiceSub;->notifyFeatureCapabilityChange()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/codeaurora/ims/ImsServiceSub;


# direct methods
.method constructor <init>(Lorg/codeaurora/ims/ImsServiceSub;)V
    .locals 0
    .param p1, "this$0"    # Lorg/codeaurora/ims/ImsServiceSub;

    .line 574
    iput-object p1, p0, Lorg/codeaurora/ims/ImsServiceSub$1;->this$0:Lorg/codeaurora/ims/ImsServiceSub;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 577
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "notifyFeatureCapabilityChange :: mMmtelCapabilities="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/codeaurora/ims/ImsServiceSub$1;->this$0:Lorg/codeaurora/ims/ImsServiceSub;

    .line 578
    invoke-static {v1}, Lorg/codeaurora/ims/ImsServiceSub;->access$000(Lorg/codeaurora/ims/ImsServiceSub;)Landroid/telephony/ims/feature/MmTelFeature$MmTelCapabilities;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 577
    invoke-static {p0, v0}, Lcom/qualcomm/ims/utils/Log;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 579
    iget-object v0, p0, Lorg/codeaurora/ims/ImsServiceSub$1;->this$0:Lorg/codeaurora/ims/ImsServiceSub;

    iget-object v1, p0, Lorg/codeaurora/ims/ImsServiceSub$1;->this$0:Lorg/codeaurora/ims/ImsServiceSub;

    invoke-static {v1}, Lorg/codeaurora/ims/ImsServiceSub;->access$000(Lorg/codeaurora/ims/ImsServiceSub;)Landroid/telephony/ims/feature/MmTelFeature$MmTelCapabilities;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/codeaurora/ims/ImsServiceSub;->notifyCapabilitiesStatusChanged(Landroid/telephony/ims/feature/MmTelFeature$MmTelCapabilities;)V

    .line 580
    return-void
.end method