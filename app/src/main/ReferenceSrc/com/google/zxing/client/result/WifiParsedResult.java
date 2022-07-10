package com.google.zxing.client.result;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class WifiParsedResult extends ParsedResult {
    private final String networkEncryption;
    private final String password;
    private final String ssid;

    public WifiParsedResult(String networkEncryption, String ssid, String password) {
        super(ParsedResultType.WIFI);
        this.ssid = ssid;
        this.networkEncryption = networkEncryption;
        this.password = password;
    }

    public String getSsid() {
        return this.ssid;
    }

    public String getNetworkEncryption() {
        return this.networkEncryption;
    }

    public String getPassword() {
        return this.password;
    }

    @Override // com.google.zxing.client.result.ParsedResult
    public String getDisplayResult() {
        StringBuilder result = new StringBuilder(80);
        maybeAppend(this.ssid, result);
        maybeAppend(this.networkEncryption, result);
        maybeAppend(this.password, result);
        return result.toString();
    }
}
