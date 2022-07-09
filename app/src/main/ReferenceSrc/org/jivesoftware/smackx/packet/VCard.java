package org.jivesoftware.smackx.packet;

import com.mining.app.zxing.decoding.Intents;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.XMPPError;
import org.jivesoftware.smack.util.StringUtils;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/VCard.class */
public class VCard extends IQ {
    private static final String DEFAULT_MIME_TYPE = "image/jpeg";
    private String emailHome;
    private String emailWork;
    private String firstName;
    private String lastName;
    private String middleName;
    private String organization;
    private String organizationUnit;
    private String photoBinval;
    private String photoMimeType;
    private Map<String, String> homePhones = new HashMap();
    private Map<String, String> workPhones = new HashMap();
    private Map<String, String> homeAddr = new HashMap();
    private Map<String, String> workAddr = new HashMap();
    private Map<String, String> otherSimpleFields = new HashMap();
    private Map<String, String> otherUnescapableFields = new HashMap();

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/VCard$ContentBuilder.class */
    private interface ContentBuilder {
        void addTagContent();
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/VCard$VCardWriter.class */
    private class VCardWriter {
        private final StringBuilder sb;

        VCardWriter(StringBuilder sb) {
            VCard.this = r4;
            this.sb = sb;
        }

        private void appendAddress(final Map<String, String> map, final String str) {
            if (map.size() > 0) {
                appendTag("ADR", true, new ContentBuilder() { // from class: org.jivesoftware.smackx.packet.VCard.VCardWriter.5
                    @Override // org.jivesoftware.smackx.packet.VCard.ContentBuilder
                    public void addTagContent() {
                        VCardWriter.this.appendEmptyTag(str);
                        for (Map.Entry entry : map.entrySet()) {
                            VCardWriter.this.appendTag((String) entry.getKey(), StringUtils.escapeForXML((String) entry.getValue()));
                        }
                    }
                });
            }
        }

        private void appendEmail(final String str, final String str2) {
            if (str != null) {
                appendTag("EMAIL", true, new ContentBuilder() { // from class: org.jivesoftware.smackx.packet.VCard.VCardWriter.3
                    @Override // org.jivesoftware.smackx.packet.VCard.ContentBuilder
                    public void addTagContent() {
                        VCardWriter.this.appendEmptyTag(str2);
                        VCardWriter.this.appendEmptyTag("INTERNET");
                        VCardWriter.this.appendEmptyTag("PREF");
                        VCardWriter.this.appendTag("USERID", StringUtils.escapeForXML(str));
                    }
                });
            }
        }

        public void appendEmptyTag(Object obj) {
            this.sb.append('<').append(obj).append("/>");
        }

        private void appendGenericFields() {
            for (Map.Entry entry : VCard.this.otherSimpleFields.entrySet()) {
                appendTag(((String) entry.getKey()).toString(), StringUtils.escapeForXML((String) entry.getValue()));
            }
            for (Map.Entry entry2 : VCard.this.otherUnescapableFields.entrySet()) {
                appendTag(((String) entry2.getKey()).toString(), (String) entry2.getValue());
            }
        }

        private void appendN() {
            appendTag("N", true, new ContentBuilder() { // from class: org.jivesoftware.smackx.packet.VCard.VCardWriter.7
                @Override // org.jivesoftware.smackx.packet.VCard.ContentBuilder
                public void addTagContent() {
                    VCardWriter.this.appendTag("FAMILY", StringUtils.escapeForXML(VCard.this.lastName));
                    VCardWriter.this.appendTag("GIVEN", StringUtils.escapeForXML(VCard.this.firstName));
                    VCardWriter.this.appendTag("MIDDLE", StringUtils.escapeForXML(VCard.this.middleName));
                }
            });
        }

        private void appendOrganization() {
            if (VCard.this.hasOrganizationFields()) {
                appendTag("ORG", true, new ContentBuilder() { // from class: org.jivesoftware.smackx.packet.VCard.VCardWriter.6
                    @Override // org.jivesoftware.smackx.packet.VCard.ContentBuilder
                    public void addTagContent() {
                        VCardWriter.this.appendTag("ORGNAME", StringUtils.escapeForXML(VCard.this.organization));
                        VCardWriter.this.appendTag("ORGUNIT", StringUtils.escapeForXML(VCard.this.organizationUnit));
                    }
                });
            }
        }

        private void appendPhones(Map<String, String> map, final String str) {
            for (final Map.Entry<String, String> entry : map.entrySet()) {
                appendTag("TEL", true, new ContentBuilder() { // from class: org.jivesoftware.smackx.packet.VCard.VCardWriter.4
                    @Override // org.jivesoftware.smackx.packet.VCard.ContentBuilder
                    public void addTagContent() {
                        VCardWriter.this.appendEmptyTag(entry.getKey());
                        VCardWriter.this.appendEmptyTag(str);
                        VCardWriter.this.appendTag("NUMBER", StringUtils.escapeForXML((String) entry.getValue()));
                    }
                });
            }
        }

        private void appendPhoto() {
            if (VCard.this.photoBinval == null) {
                return;
            }
            appendTag("PHOTO", true, new ContentBuilder() { // from class: org.jivesoftware.smackx.packet.VCard.VCardWriter.2
                @Override // org.jivesoftware.smackx.packet.VCard.ContentBuilder
                public void addTagContent() {
                    VCardWriter.this.appendTag("BINVAL", VCard.this.photoBinval);
                    VCardWriter.this.appendTag(Intents.WifiConnect.TYPE, StringUtils.escapeForXML(VCard.this.photoMimeType));
                }
            });
        }

        public void appendTag(String str, final String str2) {
            if (str2 == null) {
                return;
            }
            appendTag(str, true, new ContentBuilder() { // from class: org.jivesoftware.smackx.packet.VCard.VCardWriter.8
                @Override // org.jivesoftware.smackx.packet.VCard.ContentBuilder
                public void addTagContent() {
                    VCardWriter.this.sb.append(str2.trim());
                }
            });
        }

        private void appendTag(String str, String str2, String str3, boolean z, ContentBuilder contentBuilder) {
            this.sb.append('<').append(str);
            if (str2 != null) {
                this.sb.append(' ').append(str2).append('=').append('\'').append(str3).append('\'');
            }
            if (!z) {
                this.sb.append("/>\n");
                return;
            }
            this.sb.append('>');
            contentBuilder.addTagContent();
            this.sb.append("</").append(str).append(">\n");
        }

        private void appendTag(String str, boolean z, ContentBuilder contentBuilder) {
            appendTag(str, null, null, z, contentBuilder);
        }

        public void buildActualContent() {
            if (VCard.this.hasNameField()) {
                appendN();
            }
            appendOrganization();
            appendGenericFields();
            appendPhoto();
            appendEmail(VCard.this.emailWork, "WORK");
            appendEmail(VCard.this.emailHome, "HOME");
            appendPhones(VCard.this.workPhones, "WORK");
            appendPhones(VCard.this.homePhones, "HOME");
            appendAddress(VCard.this.workAddr, "WORK");
            appendAddress(VCard.this.homeAddr, "HOME");
        }

        public void write() {
            appendTag("vCard", "xmlns", "vcard-temp", VCard.this.hasContent(), new ContentBuilder() { // from class: org.jivesoftware.smackx.packet.VCard.VCardWriter.1
                @Override // org.jivesoftware.smackx.packet.VCard.ContentBuilder
                public void addTagContent() {
                    VCardWriter.this.buildActualContent();
                }
            });
        }
    }

    private void checkAuthenticated(Connection connection, boolean z) {
        if (connection == null) {
            throw new IllegalArgumentException("No connection was provided");
        }
        if (!connection.isAuthenticated()) {
            throw new IllegalArgumentException("Connection is not authenticated");
        }
        if (z && connection.isAnonymous()) {
            throw new IllegalArgumentException("Connection cannot be anonymous");
        }
    }

    private void copyFieldsFrom(VCard vCard) {
        Field[] declaredFields;
        for (Field field : VCard.class.getDeclaredFields()) {
            if (field.getDeclaringClass() == VCard.class && !Modifier.isFinal(field.getModifiers())) {
                try {
                    field.setAccessible(true);
                    field.set(this, field.get(vCard));
                    continue;
                } catch (IllegalAccessException e) {
                    throw new RuntimeException("This cannot happen:" + field, e);
                }
            }
        }
    }

    private void doLoad(Connection connection, String str) throws XMPPException {
        VCard vCard;
        VCard vCard2;
        setType(IQ.Type.GET);
        PacketCollector createPacketCollector = connection.createPacketCollector(new PacketIDFilter(getPacketID()));
        connection.sendPacket(this);
        try {
            vCard2 = (VCard) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        } catch (ClassCastException e) {
            System.out.println("No VCard for " + str);
            vCard = null;
        }
        if (vCard2 == null) {
            throw new XMPPException("Timeout getting VCard information", new XMPPError(XMPPError.Condition.request_timeout, "Timeout getting VCard information"));
        }
        vCard = vCard2;
        if (vCard2.getError() != null) {
            throw new XMPPException(vCard2.getError());
        }
        copyFieldsFrom(vCard);
    }

    public static byte[] getBytes(URL url) throws IOException {
        File file = new File(url.getPath());
        return file.exists() ? getFileBytes(file) : null;
    }

    private static byte[] getFileBytes(File file) throws IOException {
        Throwable th;
        BufferedInputStream bufferedInputStream = null;
        try {
            BufferedInputStream bufferedInputStream2 = new BufferedInputStream(new FileInputStream(file));
            try {
                byte[] bArr = new byte[(int) file.length()];
                if (bufferedInputStream2.read(bArr) != bArr.length) {
                    throw new IOException("Entire file not read");
                }
                if (bufferedInputStream2 != null) {
                    bufferedInputStream2.close();
                }
                return bArr;
            } catch (Throwable th2) {
                th = th2;
                bufferedInputStream = bufferedInputStream2;
                if (bufferedInputStream != null) {
                    bufferedInputStream.close();
                }
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
        }
    }

    public boolean hasContent() {
        return hasNameField() || hasOrganizationFields() || this.emailHome != null || this.emailWork != null || this.otherSimpleFields.size() > 0 || this.otherUnescapableFields.size() > 0 || this.homeAddr.size() > 0 || this.homePhones.size() > 0 || this.workAddr.size() > 0 || this.workPhones.size() > 0 || this.photoBinval != null;
    }

    public boolean hasNameField() {
        return (this.firstName == null && this.lastName == null && this.middleName == null) ? false : true;
    }

    public boolean hasOrganizationFields() {
        return (this.organization == null && this.organizationUnit == null) ? false : true;
    }

    private void updateFN() {
        StringBuilder sb = new StringBuilder();
        if (this.firstName != null) {
            sb.append(StringUtils.escapeForXML(this.firstName)).append(' ');
        }
        if (this.middleName != null) {
            sb.append(StringUtils.escapeForXML(this.middleName)).append(' ');
        }
        if (this.lastName != null) {
            sb.append(StringUtils.escapeForXML(this.lastName));
        }
        setField("FN", sb.toString());
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0037, code lost:
        if (r3.emailHome.equals(r0.emailHome) != false) goto L15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x004e, code lost:
        if (r3.emailWork.equals(r0.emailWork) != false) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0065, code lost:
        if (r3.firstName.equals(r0.firstName) != false) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x009c, code lost:
        if (r3.lastName.equals(r0.lastName) != false) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x00b3, code lost:
        if (r3.middleName.equals(r0.middleName) != false) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x00ca, code lost:
        if (r3.organization.equals(r0.organization) != false) goto L39;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x00e1, code lost:
        if (r3.organizationUnit.equals(r0.organizationUnit) != false) goto L43;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x0118, code lost:
        if (r3.photoBinval.equals(r0.photoBinval) != false) goto L51;
     */
    @Override // org.jivesoftware.smack.packet.Packet
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean equals(Object obj) {
        boolean z;
        if (this == obj) {
            z = true;
        } else {
            z = false;
            if (obj != null) {
                z = false;
                if (getClass() == obj.getClass()) {
                    VCard vCard = (VCard) obj;
                    if (this.emailHome != null) {
                        z = false;
                    } else {
                        if (vCard.emailHome != null) {
                            z = false;
                        }
                        if (this.emailWork != null) {
                            z = false;
                        } else {
                            if (vCard.emailWork != null) {
                                z = false;
                            }
                            if (this.firstName != null) {
                                z = false;
                            } else {
                                if (vCard.firstName != null) {
                                    z = false;
                                }
                                z = false;
                                if (this.homeAddr.equals(vCard.homeAddr)) {
                                    z = false;
                                    if (this.homePhones.equals(vCard.homePhones)) {
                                        if (this.lastName != null) {
                                            z = false;
                                        } else {
                                            if (vCard.lastName != null) {
                                                z = false;
                                            }
                                            if (this.middleName != null) {
                                                z = false;
                                            } else {
                                                if (vCard.middleName != null) {
                                                    z = false;
                                                }
                                                if (this.organization != null) {
                                                    z = false;
                                                } else {
                                                    if (vCard.organization != null) {
                                                        z = false;
                                                    }
                                                    if (this.organizationUnit != null) {
                                                        z = false;
                                                    } else {
                                                        if (vCard.organizationUnit != null) {
                                                            z = false;
                                                        }
                                                        z = false;
                                                        if (this.otherSimpleFields.equals(vCard.otherSimpleFields)) {
                                                            z = false;
                                                            if (this.workAddr.equals(vCard.workAddr)) {
                                                                if (this.photoBinval != null) {
                                                                    z = false;
                                                                } else {
                                                                    if (vCard.photoBinval != null) {
                                                                        z = false;
                                                                    }
                                                                    z = this.workPhones.equals(vCard.workPhones);
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return z;
    }

    public String getAddressFieldHome(String str) {
        return this.homeAddr.get(str);
    }

    public String getAddressFieldWork(String str) {
        return this.workAddr.get(str);
    }

    public byte[] getAvatar() {
        return this.photoBinval == null ? null : StringUtils.decodeBase64(this.photoBinval);
    }

    public String getAvatarHash() {
        String str = null;
        byte[] avatar = getAvatar();
        if (avatar != null) {
            try {
                MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
                messageDigest.update(avatar);
                str = StringUtils.encodeHex(messageDigest.digest());
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            }
        }
        return str;
    }

    public String getAvatarMimeType() {
        return this.photoMimeType;
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        new VCardWriter(sb).write();
        return sb.toString();
    }

    public String getEmailHome() {
        return this.emailHome;
    }

    public String getEmailWork() {
        return this.emailWork;
    }

    public String getField(String str) {
        return this.otherSimpleFields.get(str);
    }

    public String getFirstName() {
        return this.firstName;
    }

    public String getJabberId() {
        return this.otherSimpleFields.get("JABBERID");
    }

    public String getLastName() {
        return this.lastName;
    }

    public String getMiddleName() {
        return this.middleName;
    }

    public String getNickName() {
        return this.otherSimpleFields.get("NICKNAME");
    }

    public String getOrganization() {
        return this.organization;
    }

    public String getOrganizationUnit() {
        return this.organizationUnit;
    }

    public String getPhoneHome(String str) {
        return this.homePhones.get(str);
    }

    public String getPhoneWork(String str) {
        return this.workPhones.get(str);
    }

    @Override // org.jivesoftware.smack.packet.Packet
    public int hashCode() {
        int i = 0;
        int hashCode = this.homePhones.hashCode();
        int hashCode2 = this.workPhones.hashCode();
        int hashCode3 = this.homeAddr.hashCode();
        int hashCode4 = this.workAddr.hashCode();
        int hashCode5 = this.firstName != null ? this.firstName.hashCode() : 0;
        int hashCode6 = this.lastName != null ? this.lastName.hashCode() : 0;
        int hashCode7 = this.middleName != null ? this.middleName.hashCode() : 0;
        int hashCode8 = this.emailHome != null ? this.emailHome.hashCode() : 0;
        int hashCode9 = this.emailWork != null ? this.emailWork.hashCode() : 0;
        int hashCode10 = this.organization != null ? this.organization.hashCode() : 0;
        int hashCode11 = this.organizationUnit != null ? this.organizationUnit.hashCode() : 0;
        int hashCode12 = this.otherSimpleFields.hashCode();
        if (this.photoBinval != null) {
            i = this.photoBinval.hashCode();
        }
        return (((((((((((((((((((((((hashCode * 29) + hashCode2) * 29) + hashCode3) * 29) + hashCode4) * 29) + hashCode5) * 29) + hashCode6) * 29) + hashCode7) * 29) + hashCode8) * 29) + hashCode9) * 29) + hashCode10) * 29) + hashCode11) * 29) + hashCode12) * 29) + i;
    }

    public void load(Connection connection) throws XMPPException {
        checkAuthenticated(connection, true);
        setFrom(connection.getUser());
        doLoad(connection, connection.getUser());
    }

    public void load(Connection connection, String str) throws XMPPException {
        checkAuthenticated(connection, false);
        setTo(str);
        doLoad(connection, str);
    }

    public void removeAvatar() {
        this.photoBinval = null;
        this.photoMimeType = null;
    }

    public void save(Connection connection) throws XMPPException {
        checkAuthenticated(connection, true);
        setType(IQ.Type.SET);
        setFrom(connection.getUser());
        PacketCollector createPacketCollector = connection.createPacketCollector(new PacketIDFilter(getPacketID()));
        connection.sendPacket(this);
        Packet nextResult = createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (nextResult == null) {
            throw new XMPPException("No response from server on status set.");
        }
        if (nextResult.getError() == null) {
            return;
        }
        throw new XMPPException(nextResult.getError());
    }

    public void setAddressFieldHome(String str, String str2) {
        this.homeAddr.put(str, str2);
    }

    public void setAddressFieldWork(String str, String str2) {
        this.workAddr.put(str, str2);
    }

    public void setAvatar(String str, String str2) {
        this.photoBinval = str;
        this.photoMimeType = str2;
    }

    public void setAvatar(URL url) {
        byte[] bArr;
        byte[] bArr2 = new byte[0];
        try {
            bArr = getBytes(url);
        } catch (IOException e) {
            e.printStackTrace();
            bArr = bArr2;
        }
        setAvatar(bArr);
    }

    public void setAvatar(byte[] bArr) {
        setAvatar(bArr, DEFAULT_MIME_TYPE);
    }

    public void setAvatar(byte[] bArr, String str) {
        if (bArr == null) {
            removeAvatar();
        } else {
            setAvatar(StringUtils.encodeBase64(bArr), str);
        }
    }

    public void setEmailHome(String str) {
        this.emailHome = str;
    }

    public void setEmailWork(String str) {
        this.emailWork = str;
    }

    public void setEncodedImage(String str) {
        setAvatar(str, DEFAULT_MIME_TYPE);
    }

    public void setField(String str, String str2) {
        setField(str, str2, false);
    }

    public void setField(String str, String str2, boolean z) {
        if (!z) {
            this.otherSimpleFields.put(str, str2);
        } else {
            this.otherUnescapableFields.put(str, str2);
        }
    }

    public void setFirstName(String str) {
        this.firstName = str;
        updateFN();
    }

    public void setJabberId(String str) {
        this.otherSimpleFields.put("JABBERID", str);
    }

    public void setLastName(String str) {
        this.lastName = str;
        updateFN();
    }

    public void setMiddleName(String str) {
        this.middleName = str;
        updateFN();
    }

    public void setNickName(String str) {
        this.otherSimpleFields.put("NICKNAME", str);
    }

    public void setOrganization(String str) {
        this.organization = str;
    }

    public void setOrganizationUnit(String str) {
        this.organizationUnit = str;
    }

    public void setPhoneHome(String str, String str2) {
        this.homePhones.put(str, str2);
    }

    public void setPhoneWork(String str, String str2) {
        this.workPhones.put(str, str2);
    }

    public String toString() {
        return getChildElementXML();
    }
}
