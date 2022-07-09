package org.apache.tools.ant.taskdefs.email;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/email/EmailAddress.class */
public class EmailAddress {
    private String address;
    private String name;

    public EmailAddress() {
    }

    public EmailAddress(String str) {
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        int length = str.length();
        if (length > 9 && ((str.charAt(0) == '<' || str.charAt(1) == '<') && (str.charAt(length - 1) == '>' || str.charAt(length - 2) == '>'))) {
            this.address = trim(str, true);
            return;
        }
        int i6 = 0;
        int i7 = 0;
        int i8 = 0;
        int i9 = 0;
        int i10 = 0;
        int i11 = 0;
        while (i11 < length) {
            char charAt = str.charAt(i11);
            if (charAt == '(') {
                int i12 = i6 + 1;
                i = i8;
                i2 = i10;
                i3 = i9;
                i4 = i12;
                i5 = i7;
                if (i7 == 0) {
                    i = i11;
                    i3 = i11 + 1;
                    i5 = i7;
                    i4 = i12;
                    i2 = i10;
                }
            } else if (charAt == ')') {
                int i13 = i6 - 1;
                i = i8;
                i2 = i10;
                i3 = i9;
                i4 = i13;
                i5 = i7;
                if (i8 == 0) {
                    i5 = i11 + 1;
                    i2 = i11;
                    i = i8;
                    i3 = i9;
                    i4 = i13;
                }
            } else if (i6 == 0 && charAt == '<') {
                i5 = i11 + 1;
                i = i8;
                i2 = i7 == 0 ? i11 : i10;
                i3 = i9;
                i4 = i6;
            } else {
                i = i8;
                i2 = i10;
                i3 = i9;
                i4 = i6;
                i5 = i7;
                if (i6 == 0) {
                    i = i8;
                    i2 = i10;
                    i3 = i9;
                    i4 = i6;
                    i5 = i7;
                    if (charAt == '>') {
                        int i14 = i11;
                        i = i14;
                        i2 = i10;
                        i3 = i9;
                        i4 = i6;
                        i5 = i7;
                        if (i14 != length - 1) {
                            i3 = i11 + 1;
                            i = i14;
                            i2 = i10;
                            i4 = i6;
                            i5 = i7;
                        }
                    }
                }
            }
            i11++;
            i8 = i;
            i10 = i2;
            i9 = i3;
            i6 = i4;
            i7 = i5;
        }
        int i15 = i8 == 0 ? length : i8;
        int i16 = i10 == 0 ? length : i10;
        this.address = trim(str.substring(i7, i15), true);
        this.name = trim(str.substring(i9, i16), false);
        if (this.name.length() + this.address.length() <= length) {
            return;
        }
        this.name = null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0051, code lost:
        if (r5.charAt(r8 - 1) <= ' ') goto L15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0089, code lost:
        if (r5.charAt(r7) <= ' ') goto L26;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private String trim(String str, boolean z) {
        boolean z2;
        int i;
        int i2;
        int i3 = 0;
        int length = str.length();
        do {
            z2 = false;
            if (str.charAt(length - 1) != ')' && ((str.charAt(length - 1) != '>' || !z) && (str.charAt(length - 1) != '\"' || str.charAt(length - 2) == '\\'))) {
                i = length;
            }
            z2 = true;
            i = length - 1;
            if (str.charAt(i3) != '(' && ((str.charAt(i3) != '<' || !z) && str.charAt(i3) != '\"')) {
                i2 = i3;
            }
            z2 = true;
            i2 = i3 + 1;
            length = i;
            i3 = i2;
        } while (z2);
        return str.substring(i2, i);
    }

    public String getAddress() {
        return this.address;
    }

    public String getName() {
        return this.name;
    }

    public void setAddress(String str) {
        this.address = str;
    }

    public void setName(String str) {
        this.name = str;
    }

    public String toString() {
        return this.name == null ? this.address : new StringBuffer().append(this.name).append(" <").append(this.address).append(">").toString();
    }
}
