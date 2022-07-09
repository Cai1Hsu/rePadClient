package org.jivesoftware.smackx.provider;

import java.text.ParseException;
import java.util.Date;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.packet.DataForm;
import org.jivesoftware.smackx.packet.StreamInitiation;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/provider/StreamInitiationProvider.class */
public class StreamInitiationProvider implements IQProvider {
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:40:0x0175 -> B:33:0x0127). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:44:0x019a -> B:37:0x0140). Please submit an issue!!! */
    @Override // org.jivesoftware.smack.provider.IQProvider
    public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
        boolean z = false;
        String attributeValue = xmlPullParser.getAttributeValue("", "id");
        String attributeValue2 = xmlPullParser.getAttributeValue("", "mime-type");
        StreamInitiation streamInitiation = new StreamInitiation();
        String str = null;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        boolean z2 = false;
        DataForm dataForm = null;
        DataFormProvider dataFormProvider = new DataFormProvider();
        while (!z) {
            int next = xmlPullParser.next();
            String name = xmlPullParser.getName();
            String namespace = xmlPullParser.getNamespace();
            if (next == 2) {
                if (name.equals("file")) {
                    str = xmlPullParser.getAttributeValue("", "name");
                    str2 = xmlPullParser.getAttributeValue("", "size");
                    str3 = xmlPullParser.getAttributeValue("", "hash");
                    str4 = xmlPullParser.getAttributeValue("", "date");
                } else if (name.equals("desc")) {
                    str5 = xmlPullParser.nextText();
                } else if (name.equals("range")) {
                    z2 = true;
                } else if (name.equals("x") && namespace.equals(Form.NAMESPACE)) {
                    dataForm = (DataForm) dataFormProvider.parseExtension(xmlPullParser);
                }
            } else if (next == 3) {
                if (name.equals("si")) {
                    z = true;
                } else if (name.equals("file")) {
                    long j = 0;
                    if (str2 != null) {
                        j = 0;
                        if (str2.trim().length() != 0) {
                            try {
                                j = Long.parseLong(str2);
                            } catch (NumberFormatException e) {
                                e.printStackTrace();
                                j = 0;
                            }
                        }
                    }
                    Date date = new Date();
                    Date date2 = date;
                    if (str4 != null) {
                        try {
                            date2 = StringUtils.parseXEP0082Date(str4);
                        } catch (ParseException e2) {
                            date2 = date;
                        }
                    }
                    StreamInitiation.File file = new StreamInitiation.File(str, j);
                    file.setHash(str3);
                    file.setDate(date2);
                    file.setDesc(str5);
                    file.setRanged(z2);
                    streamInitiation.setFile(file);
                }
            }
        }
        streamInitiation.setSesssionID(attributeValue);
        streamInitiation.setMimeType(attributeValue2);
        streamInitiation.setFeatureNegotiationForm(dataForm);
        return streamInitiation;
    }
}
