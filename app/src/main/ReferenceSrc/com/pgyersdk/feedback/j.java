package com.pgyersdk.feedback;

import android.content.Context;

/* loaded from: classes.jar:com/pgyersdk/feedback/j.class */
final class j implements m {
    final /* synthetic */ PgyFeedbackShakeManager a;
    private final /* synthetic */ Context b;

    j(PgyFeedbackShakeManager pgyFeedbackShakeManager, Context context) {
        this.a = pgyFeedbackShakeManager;
        this.b = context;
    }

    @Override // com.pgyersdk.feedback.m
    public final void a() {
        Boolean bool;
        try {
            c a = c.a().a(new k(this, this.b));
            bool = this.a.e;
            a.a(bool.booleanValue());
            a.a(this.b);
        } catch (Exception e) {
        }
    }
}
