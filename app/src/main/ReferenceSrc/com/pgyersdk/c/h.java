package com.pgyersdk.c;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSession;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class h implements HostnameVerifier {
    @Override // javax.net.ssl.HostnameVerifier
    public final boolean verify(String str, SSLSession sSLSession) {
        return true;
    }
}
