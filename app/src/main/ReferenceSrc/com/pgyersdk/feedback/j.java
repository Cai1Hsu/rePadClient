package com.pgyersdk.feedback;

import android.content.Context;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class j implements m {
    final /* synthetic */ PgyFeedbackShakeManager a;
    private final /* synthetic */ Context b;

    public j(PgyFeedbackShakeManager pgyFeedbackShakeManager, Context context) {
        this.a = pgyFeedbackShakeManager;
        this.b = context;
    }

    @Override // com.pgyersdk.feedback.m
    public final void a() {
        try {
            c a = c.a().a(new k(this, this.b));
            a.a(PgyFeedbackShakeManager.c(this.a).booleanValue());
            a.a(this.b);
        } catch (Exception e) {
        }
    }
}
