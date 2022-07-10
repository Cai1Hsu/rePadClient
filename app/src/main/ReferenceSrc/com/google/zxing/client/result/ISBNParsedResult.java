package com.google.zxing.client.result;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class ISBNParsedResult extends ParsedResult {
    private final String isbn;

    public ISBNParsedResult(String isbn) {
        super(ParsedResultType.ISBN);
        this.isbn = isbn;
    }

    public String getISBN() {
        return this.isbn;
    }

    @Override // com.google.zxing.client.result.ParsedResult
    public String getDisplayResult() {
        return this.isbn;
    }
}
