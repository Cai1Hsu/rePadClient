package com.google.zxing.client.result;

/* loaded from: classes.dex */
public final class AddressBookParsedResult extends ParsedResult {
    private final String[] addressTypes;
    private final String[] addresses;
    private final String birthday;
    private final String[] emailTypes;
    private final String[] emails;
    private final String instantMessenger;
    private final String[] names;
    private final String note;

    /* renamed from: org */
    private final String f0org;
    private final String[] phoneNumbers;
    private final String[] phoneTypes;
    private final String pronunciation;
    private final String title;
    private final String url;

    public AddressBookParsedResult(String[] names, String pronunciation, String[] phoneNumbers, String[] phoneTypes, String[] emails, String[] emailTypes, String instantMessenger, String note, String[] addresses, String[] addressTypes, String org2, String birthday, String title, String url) {
        super(ParsedResultType.ADDRESSBOOK);
        this.names = names;
        this.pronunciation = pronunciation;
        this.phoneNumbers = phoneNumbers;
        this.phoneTypes = phoneTypes;
        this.emails = emails;
        this.emailTypes = emailTypes;
        this.instantMessenger = instantMessenger;
        this.note = note;
        this.addresses = addresses;
        this.addressTypes = addressTypes;
        this.f0org = org2;
        this.birthday = birthday;
        this.title = title;
        this.url = url;
    }

    public String[] getNames() {
        return this.names;
    }

    public String getPronunciation() {
        return this.pronunciation;
    }

    public String[] getPhoneNumbers() {
        return this.phoneNumbers;
    }

    public String[] getPhoneTypes() {
        return this.phoneTypes;
    }

    public String[] getEmails() {
        return this.emails;
    }

    public String[] getEmailTypes() {
        return this.emailTypes;
    }

    public String getInstantMessenger() {
        return this.instantMessenger;
    }

    public String getNote() {
        return this.note;
    }

    public String[] getAddresses() {
        return this.addresses;
    }

    public String[] getAddressTypes() {
        return this.addressTypes;
    }

    public String getTitle() {
        return this.title;
    }

    public String getOrg() {
        return this.f0org;
    }

    public String getURL() {
        return this.url;
    }

    public String getBirthday() {
        return this.birthday;
    }

    @Override // com.google.zxing.client.result.ParsedResult
    public String getDisplayResult() {
        StringBuilder result = new StringBuilder(100);
        maybeAppend(this.names, result);
        maybeAppend(this.pronunciation, result);
        maybeAppend(this.title, result);
        maybeAppend(this.f0org, result);
        maybeAppend(this.addresses, result);
        maybeAppend(this.phoneNumbers, result);
        maybeAppend(this.emails, result);
        maybeAppend(this.instantMessenger, result);
        maybeAppend(this.url, result);
        maybeAppend(this.birthday, result);
        maybeAppend(this.note, result);
        return result.toString();
    }
}
