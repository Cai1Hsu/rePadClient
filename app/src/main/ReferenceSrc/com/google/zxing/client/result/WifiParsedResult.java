package com.google.zxing.client.result;

/* loaded from: classes.jar:com/google/zxing/client/result/WifiParsedResult.class */
public final class WifiParsedResult extends ParsedResult {
    private final String networkEncryption;
    private final String password;
    private final String ssid;

    public WifiParsedResult(String str, String str2, String str3) {
        super(ParsedResultType.WIFI);
        this.ssid = str2;
        this.networkEncryption = str;
        this.password = str3;
    }

    @Override // com.google.zxing.client.result.ParsedResult
    public String getDisplayResult() {
        StringBuilder sb = new StringBuilder(80);
        maybeAppend(this.ssid, sb);
        maybeAppend(this.networkEncryption, sb);
        maybeAppend(this.password, sb);
        return sb.toString();
    }

    public String getNetworkEncryption() {
        return this.networkEncryption;
    }

    public String getPassword() {
        return this.password;
    }

    public String getSsid() {
        return this.ssid;
    }
}
