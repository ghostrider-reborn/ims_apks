.class public Lorg/codeaurora/ims/QtiImsExtManager;
.super Ljava/lang/Object;
.source "QtiImsExtManager.java"


# static fields
.field private static LOG_TAG:Ljava/lang/String; = null

.field public static final SERVICE_ID:Ljava/lang/String; = "qti.ims.ext"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    const-string/jumbo v0, "QtiImsExtManager"

    sput-object v0, Lorg/codeaurora/ims/QtiImsExtManager;->LOG_TAG:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput-object p1, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mContext:Landroid/content/Context;

    .line 74
    return-void
.end method

.method private checkFeatureStatus(I)V
    .locals 4
    .param p1, "phoneId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 290
    iget-object v1, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mContext:Landroid/content/Context;

    if-nez v1, :cond_0

    new-instance v1, Lorg/codeaurora/ims/QtiImsException;

    const-string/jumbo v2, "Context is null"

    invoke-direct {v1, v2}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 293
    :cond_0
    :try_start_0
    iget-object v1, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mContext:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/android/ims/ImsManager;->getInstance(Landroid/content/Context;I)Lcom/android/ims/ImsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/ims/ImsManager;->getImsServiceStatus()I

    move-result v1

    .line 294
    const/4 v2, 0x2

    .line 293
    if-eq v1, v2, :cond_1

    .line 295
    sget-object v1, Lorg/codeaurora/ims/QtiImsExtManager;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Feature status for phoneId "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " is not ready"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    new-instance v1, Lorg/codeaurora/ims/QtiImsException;

    const-string/jumbo v2, "Feature state is NOT_READY"

    invoke-direct {v1, v2}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Lcom/android/ims/ImsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 298
    :catch_0
    move-exception v0

    .line 299
    .local v0, "e":Lcom/android/ims/ImsException;
    sget-object v1, Lorg/codeaurora/ims/QtiImsExtManager;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Got ImsException for phoneId "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 300
    new-instance v1, Lorg/codeaurora/ims/QtiImsException;

    const-string/jumbo v2, "Feature state is NOT_READY"

    invoke-direct {v1, v2}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 302
    .end local v0    # "e":Lcom/android/ims/ImsException;
    :cond_1
    return-void
.end method

.method private checkPhoneId(I)V
    .locals 3
    .param p1, "phoneId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 283
    invoke-static {p1}, Landroid/telephony/SubscriptionManager;->isValidPhoneId(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 284
    sget-object v0, Lorg/codeaurora/ims/QtiImsExtManager;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "phoneId "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " is not valid"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 285
    new-instance v0, Lorg/codeaurora/ims/QtiImsException;

    const-string/jumbo v1, "invalid phoneId"

    invoke-direct {v0, v1}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 287
    :cond_0
    return-void
.end method

.method private handleQtiImsExtServiceDeath()V
    .locals 2

    .prologue
    .line 278
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 279
    sget-object v0, Lorg/codeaurora/ims/QtiImsExtManager;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v1, "qtiImsExtDeathListener QtiImsExt binder died"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 280
    return-void
.end method

.method private obtainBinder()Lorg/codeaurora/ims/internal/IQtiImsExt;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 258
    iget-object v2, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    if-nez v2, :cond_1

    .line 259
    const-string/jumbo v2, "qti.ims.ext"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 260
    .local v0, "b":Landroid/os/IBinder;
    invoke-static {v0}, Lorg/codeaurora/ims/internal/IQtiImsExt$Stub;->asInterface(Landroid/os/IBinder;)Lorg/codeaurora/ims/internal/IQtiImsExt;

    move-result-object v2

    iput-object v2, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 262
    iget-object v2, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    if-nez v2, :cond_0

    .line 263
    new-instance v2, Lorg/codeaurora/ims/QtiImsException;

    const-string/jumbo v3, "ImsService is not running"

    invoke-direct {v2, v3}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 267
    :cond_0
    :try_start_0
    new-instance v2, Lorg/codeaurora/ims/-$Lambda$wtkba8Bd1_tkkSOmbS18RK4QCQY;

    invoke-direct {v2, p0}, Lorg/codeaurora/ims/-$Lambda$wtkba8Bd1_tkkSOmbS18RK4QCQY;-><init>(Ljava/lang/Object;)V

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 272
    :goto_0
    iget-object v2, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    return-object v2

    .line 268
    :catch_0
    move-exception v1

    .line 269
    .local v1, "e":Landroid/os/RemoteException;
    sget-object v2, Lorg/codeaurora/ims/QtiImsExtManager;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v3, "Unable to listen for QtiImsExt service death"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 274
    .end local v0    # "b":Landroid/os/IBinder;
    .end local v1    # "e":Landroid/os/RemoteException;
    :cond_1
    iget-object v2, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    return-object v2
.end method


# virtual methods
.method public getCallForwardUncondTimer(IIILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "reason"    # I
    .param p3, "serviceClass"    # I
    .param p4, "listener"    # Lorg/codeaurora/ims/internal/IQtiImsExtListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 92
    invoke-direct {p0}, Lorg/codeaurora/ims/QtiImsExtManager;->obtainBinder()Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 93
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkPhoneId(I)V

    .line 94
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkFeatureStatus(I)V

    .line 96
    :try_start_0
    iget-object v1, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    invoke-interface {v1, p1, p2, p3, p4}, Lorg/codeaurora/ims/internal/IQtiImsExt;->getCallForwardUncondTimer(IIILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    return-void

    .line 97
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v1, Lorg/codeaurora/ims/QtiImsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Remote ImsService getCallForwardUncondTimer : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getHandoverConfig(ILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "listener"    # Lorg/codeaurora/ims/internal/IQtiImsExtListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 231
    invoke-direct {p0}, Lorg/codeaurora/ims/QtiImsExtManager;->obtainBinder()Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 232
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkPhoneId(I)V

    .line 233
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkFeatureStatus(I)V

    .line 235
    :try_start_0
    iget-object v1, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    invoke-interface {v1, p1, p2}, Lorg/codeaurora/ims/internal/IQtiImsExt;->getHandoverConfig(ILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 239
    return-void

    .line 236
    :catch_0
    move-exception v0

    .line 237
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v1, Lorg/codeaurora/ims/QtiImsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Remote ImsService getHandoverConfig : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getPacketCount(ILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "listener"    # Lorg/codeaurora/ims/internal/IQtiImsExtListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 103
    invoke-direct {p0}, Lorg/codeaurora/ims/QtiImsExtManager;->obtainBinder()Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 104
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkPhoneId(I)V

    .line 105
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkFeatureStatus(I)V

    .line 107
    :try_start_0
    iget-object v1, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    invoke-interface {v1, p1, p2}, Lorg/codeaurora/ims/internal/IQtiImsExt;->getPacketCount(ILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    return-void

    .line 108
    :catch_0
    move-exception v0

    .line 109
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v1, Lorg/codeaurora/ims/QtiImsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Remote ImsService getPacketCount : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getPacketErrorCount(ILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "listener"    # Lorg/codeaurora/ims/internal/IQtiImsExtListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 115
    invoke-direct {p0}, Lorg/codeaurora/ims/QtiImsExtManager;->obtainBinder()Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 116
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkPhoneId(I)V

    .line 117
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkFeatureStatus(I)V

    .line 119
    :try_start_0
    iget-object v1, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    invoke-interface {v1, p1, p2}, Lorg/codeaurora/ims/internal/IQtiImsExt;->getPacketErrorCount(ILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 123
    return-void

    .line 120
    :catch_0
    move-exception v0

    .line 121
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v1, Lorg/codeaurora/ims/QtiImsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Remote ImsService getPacketErrorCount : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getRcsAppConfig(I)I
    .locals 5
    .param p1, "phoneId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 318
    invoke-direct {p0}, Lorg/codeaurora/ims/QtiImsExtManager;->obtainBinder()Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 319
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkPhoneId(I)V

    .line 320
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkFeatureStatus(I)V

    .line 321
    const/4 v1, -0x1

    .line 324
    .local v1, "ret":I
    :try_start_0
    iget-object v2, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    invoke-interface {v2, p1}, Lorg/codeaurora/ims/internal/IQtiImsExt;->getRcsAppConfig(I)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 329
    return v1

    .line 325
    :catch_0
    move-exception v0

    .line 326
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v2, Lorg/codeaurora/ims/QtiImsException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Remote ImsService getRcsAppConfig : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getVvmAppConfig(I)I
    .locals 5
    .param p1, "phoneId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 385
    invoke-direct {p0}, Lorg/codeaurora/ims/QtiImsExtManager;->obtainBinder()Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 386
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkPhoneId(I)V

    .line 387
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkFeatureStatus(I)V

    .line 388
    const/4 v1, -0x1

    .line 391
    .local v1, "ret":I
    :try_start_0
    iget-object v2, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    invoke-interface {v2, p1}, Lorg/codeaurora/ims/internal/IQtiImsExt;->getVvmAppConfig(I)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 396
    return v1

    .line 392
    :catch_0
    move-exception v0

    .line 393
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v2, Lorg/codeaurora/ims/QtiImsException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Remote ImsService getVvmAppConfig : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public isConnected(III)Z
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "serviceType"    # I
    .param p3, "callType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 351
    :try_start_0
    iget-object v1, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mContext:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/android/ims/ImsManager;->getInstance(Landroid/content/Context;I)Lcom/android/ims/ImsManager;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Lcom/android/ims/ImsManager;->isConnected(II)Z
    :try_end_0
    .catch Lcom/android/ims/ImsException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 352
    :catch_0
    move-exception v0

    .line 353
    .local v0, "e":Lcom/android/ims/ImsException;
    new-instance v1, Lorg/codeaurora/ims/QtiImsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Exception in Ims isConnected : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public isOpened(I)Z
    .locals 4
    .param p1, "phoneId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 365
    :try_start_0
    iget-object v1, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mContext:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/android/ims/ImsManager;->getInstance(Landroid/content/Context;I)Lcom/android/ims/ImsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/ims/ImsManager;->isOpened()Z
    :try_end_0
    .catch Lcom/android/ims/ImsException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 366
    :catch_0
    move-exception v0

    .line 367
    .local v0, "e":Lcom/android/ims/ImsException;
    new-instance v1, Lorg/codeaurora/ims/QtiImsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Exception in Ims isOpened : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method synthetic lambda$-org_codeaurora_ims_QtiImsExtManager_10473()V
    .locals 0

    .prologue
    .line 267
    invoke-direct {p0}, Lorg/codeaurora/ims/QtiImsExtManager;->handleQtiImsExtServiceDeath()V

    return-void
.end method

.method public querySsacStatus(ILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "listener"    # Lorg/codeaurora/ims/internal/IQtiImsExtListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 184
    invoke-direct {p0}, Lorg/codeaurora/ims/QtiImsExtManager;->obtainBinder()Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 185
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkPhoneId(I)V

    .line 186
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkFeatureStatus(I)V

    .line 188
    :try_start_0
    iget-object v1, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    invoke-interface {v1, p1, p2}, Lorg/codeaurora/ims/internal/IQtiImsExt;->querySsacStatus(ILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 192
    return-void

    .line 189
    :catch_0
    move-exception v0

    .line 190
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v1, Lorg/codeaurora/ims/QtiImsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Remote ImsService querySsacStatus : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public queryVoltePreference(ILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "listener"    # Lorg/codeaurora/ims/internal/IQtiImsExtListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 220
    invoke-direct {p0}, Lorg/codeaurora/ims/QtiImsExtManager;->obtainBinder()Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 221
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkPhoneId(I)V

    .line 222
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkFeatureStatus(I)V

    .line 224
    :try_start_0
    iget-object v1, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    invoke-interface {v1, p1, p2}, Lorg/codeaurora/ims/internal/IQtiImsExt;->queryVoltePreference(ILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 228
    return-void

    .line 225
    :catch_0
    move-exception v0

    .line 226
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v1, Lorg/codeaurora/ims/QtiImsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Remote ImsService queryVoltePreference : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public queryVopsStatus(ILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "listener"    # Lorg/codeaurora/ims/internal/IQtiImsExtListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 173
    invoke-direct {p0}, Lorg/codeaurora/ims/QtiImsExtManager;->obtainBinder()Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 174
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkPhoneId(I)V

    .line 175
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkFeatureStatus(I)V

    .line 177
    :try_start_0
    iget-object v1, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    invoke-interface {v1, p1, p2}, Lorg/codeaurora/ims/internal/IQtiImsExt;->queryVopsStatus(ILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 181
    return-void

    .line 178
    :catch_0
    move-exception v0

    .line 179
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v1, Lorg/codeaurora/ims/QtiImsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Remote ImsService queryVopsStatus : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public registerForParticipantStatusInfo(ILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "listener"    # Lorg/codeaurora/ims/internal/IQtiImsExtListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 196
    invoke-direct {p0}, Lorg/codeaurora/ims/QtiImsExtManager;->obtainBinder()Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 197
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkPhoneId(I)V

    .line 198
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkFeatureStatus(I)V

    .line 200
    :try_start_0
    iget-object v1, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    invoke-interface {v1, p1, p2}, Lorg/codeaurora/ims/internal/IQtiImsExt;->registerForParticipantStatusInfo(ILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 204
    return-void

    .line 201
    :catch_0
    move-exception v0

    .line 202
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v1, Lorg/codeaurora/ims/QtiImsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Remote ImsService registerForParticipantStatusInfo : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public resumePendingCall(II)V
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "videoState"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 138
    invoke-direct {p0}, Lorg/codeaurora/ims/QtiImsExtManager;->obtainBinder()Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 139
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkPhoneId(I)V

    .line 140
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkFeatureStatus(I)V

    .line 142
    :try_start_0
    iget-object v1, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    invoke-interface {v1, p1, p2}, Lorg/codeaurora/ims/internal/IQtiImsExt;->resumePendingCall(II)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    return-void

    .line 143
    :catch_0
    move-exception v0

    .line 144
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v1, Lorg/codeaurora/ims/QtiImsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Remote ImsService resumePendingCall : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public sendCallDeflectRequest(ILjava/lang/String;Lorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "deflectNumber"    # Ljava/lang/String;
    .param p3, "listener"    # Lorg/codeaurora/ims/internal/IQtiImsExtListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 127
    invoke-direct {p0}, Lorg/codeaurora/ims/QtiImsExtManager;->obtainBinder()Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 128
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkPhoneId(I)V

    .line 129
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkFeatureStatus(I)V

    .line 131
    :try_start_0
    iget-object v1, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    invoke-interface {v1, p1, p2, p3}, Lorg/codeaurora/ims/internal/IQtiImsExt;->sendCallDeflectRequest(ILjava/lang/String;Lorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 135
    return-void

    .line 132
    :catch_0
    move-exception v0

    .line 133
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v1, Lorg/codeaurora/ims/QtiImsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Remote ImsService sendCallDeflectRequestCount : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public sendCallTransferRequest(IILjava/lang/String;Lorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "type"    # I
    .param p3, "number"    # Ljava/lang/String;
    .param p4, "listener"    # Lorg/codeaurora/ims/internal/IQtiImsExtListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 150
    invoke-direct {p0}, Lorg/codeaurora/ims/QtiImsExtManager;->obtainBinder()Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 151
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkPhoneId(I)V

    .line 152
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkFeatureStatus(I)V

    .line 154
    :try_start_0
    iget-object v1, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    invoke-interface {v1, p1, p2, p3, p4}, Lorg/codeaurora/ims/internal/IQtiImsExt;->sendCallTransferRequest(IILjava/lang/String;Lorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    return-void

    .line 155
    :catch_0
    move-exception v0

    .line 156
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v1, Lorg/codeaurora/ims/QtiImsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Remote ImsService sendCallTransferRequest : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public sendCancelModifyCall(ILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "listener"    # Lorg/codeaurora/ims/internal/IQtiImsExtListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 162
    invoke-direct {p0}, Lorg/codeaurora/ims/QtiImsExtManager;->obtainBinder()Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 163
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkPhoneId(I)V

    .line 164
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkFeatureStatus(I)V

    .line 166
    :try_start_0
    iget-object v1, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    invoke-interface {v1, p1, p2}, Lorg/codeaurora/ims/internal/IQtiImsExt;->sendCancelModifyCall(ILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 170
    return-void

    .line 167
    :catch_0
    move-exception v0

    .line 168
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v1, Lorg/codeaurora/ims/QtiImsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Remote ImsService sendCancelModifyCall : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setCallForwardUncondTimer(IIIIIIIILjava/lang/String;Lorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    .locals 12
    .param p1, "phoneId"    # I
    .param p2, "startHour"    # I
    .param p3, "startMinute"    # I
    .param p4, "endHour"    # I
    .param p5, "endMinute"    # I
    .param p6, "action"    # I
    .param p7, "condition"    # I
    .param p8, "serviceClass"    # I
    .param p9, "number"    # Ljava/lang/String;
    .param p10, "listener"    # Lorg/codeaurora/ims/internal/IQtiImsExtListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 79
    invoke-direct {p0}, Lorg/codeaurora/ims/QtiImsExtManager;->obtainBinder()Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 80
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkPhoneId(I)V

    .line 81
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkFeatureStatus(I)V

    .line 83
    :try_start_0
    iget-object v0, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    move v1, p1

    move v2, p2

    move v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    invoke-interface/range {v0 .. v10}, Lorg/codeaurora/ims/internal/IQtiImsExt;->setCallForwardUncondTimer(IIIIIIIILjava/lang/String;Lorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    return-void

    .line 85
    :catch_0
    move-exception v11

    .line 86
    .local v11, "e":Landroid/os/RemoteException;
    new-instance v0, Lorg/codeaurora/ims/QtiImsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Remote ImsService setCallForwardUncondTimer : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setHandoverConfig(IILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "hoConfig"    # I
    .param p3, "listener"    # Lorg/codeaurora/ims/internal/IQtiImsExtListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 243
    invoke-direct {p0}, Lorg/codeaurora/ims/QtiImsExtManager;->obtainBinder()Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 244
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkPhoneId(I)V

    .line 245
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkFeatureStatus(I)V

    .line 247
    :try_start_0
    iget-object v1, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    invoke-interface {v1, p1, p2, p3}, Lorg/codeaurora/ims/internal/IQtiImsExt;->setHandoverConfig(IILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 251
    return-void

    .line 248
    :catch_0
    move-exception v0

    .line 249
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v1, Lorg/codeaurora/ims/QtiImsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Remote ImsService setHandoverConfig : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setRcsAppConfig(II)I
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "defaultSmsApp"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 305
    invoke-direct {p0}, Lorg/codeaurora/ims/QtiImsExtManager;->obtainBinder()Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 306
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkPhoneId(I)V

    .line 307
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkFeatureStatus(I)V

    .line 308
    const/4 v1, -0x1

    .line 310
    .local v1, "ret":I
    :try_start_0
    iget-object v2, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    invoke-interface {v2, p1, p2}, Lorg/codeaurora/ims/internal/IQtiImsExt;->setRcsAppConfig(II)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 314
    return v1

    .line 311
    :catch_0
    move-exception v0

    .line 312
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v2, Lorg/codeaurora/ims/QtiImsException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Remote ImsService setRcsAppConfig : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public setVvmAppConfig(II)I
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "defaultVvmApp"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 372
    invoke-direct {p0}, Lorg/codeaurora/ims/QtiImsExtManager;->obtainBinder()Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 373
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkPhoneId(I)V

    .line 374
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkFeatureStatus(I)V

    .line 375
    const/4 v1, -0x1

    .line 377
    .local v1, "ret":I
    :try_start_0
    iget-object v2, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    invoke-interface {v2, p1, p2}, Lorg/codeaurora/ims/internal/IQtiImsExt;->setVvmAppConfig(II)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 381
    return v1

    .line 378
    :catch_0
    move-exception v0

    .line 379
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v2, Lorg/codeaurora/ims/QtiImsException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Remote ImsService setVvmAppConfig : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public updateVoltePreference(IILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    .locals 4
    .param p1, "phoneId"    # I
    .param p2, "preference"    # I
    .param p3, "listener"    # Lorg/codeaurora/ims/internal/IQtiImsExtListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/codeaurora/ims/QtiImsException;
        }
    .end annotation

    .prologue
    .line 208
    invoke-direct {p0}, Lorg/codeaurora/ims/QtiImsExtManager;->obtainBinder()Lorg/codeaurora/ims/internal/IQtiImsExt;

    .line 209
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkPhoneId(I)V

    .line 210
    invoke-direct {p0, p1}, Lorg/codeaurora/ims/QtiImsExtManager;->checkFeatureStatus(I)V

    .line 212
    :try_start_0
    iget-object v1, p0, Lorg/codeaurora/ims/QtiImsExtManager;->mQtiImsExt:Lorg/codeaurora/ims/internal/IQtiImsExt;

    invoke-interface {v1, p1, p2, p3}, Lorg/codeaurora/ims/internal/IQtiImsExt;->updateVoltePreference(IILorg/codeaurora/ims/internal/IQtiImsExtListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 216
    return-void

    .line 213
    :catch_0
    move-exception v0

    .line 214
    .local v0, "e":Landroid/os/RemoteException;
    new-instance v1, Lorg/codeaurora/ims/QtiImsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Remote ImsService updateVoltePreference : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/codeaurora/ims/QtiImsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
