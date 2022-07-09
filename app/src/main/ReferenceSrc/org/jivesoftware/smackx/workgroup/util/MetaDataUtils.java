package org.jivesoftware.smackx.workgroup.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smackx.workgroup.MetaData;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/util/MetaDataUtils.class */
public class MetaDataUtils {
    public static Map<String, List<String>> parseMetaData(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        Hashtable hashtable;
        if (xmlPullParser.getEventType() != 2 || !xmlPullParser.getName().equals(MetaData.ELEMENT_NAME) || !xmlPullParser.getNamespace().equals("http://jivesoftware.com/protocol/workgroup")) {
            hashtable = Collections.emptyMap();
        } else {
            Hashtable hashtable2 = new Hashtable();
            int nextTag = xmlPullParser.nextTag();
            while (true) {
                if (nextTag == 3) {
                    hashtable = hashtable2;
                    if (xmlPullParser.getName().equals(MetaData.ELEMENT_NAME)) {
                        break;
                    }
                }
                String attributeValue = xmlPullParser.getAttributeValue(0);
                String nextText = xmlPullParser.nextText();
                if (hashtable2.containsKey(attributeValue)) {
                    hashtable2.get(attributeValue).add(nextText);
                } else {
                    ArrayList arrayList = new ArrayList();
                    arrayList.add(nextText);
                    hashtable2.put(attributeValue, arrayList);
                }
                nextTag = xmlPullParser.nextTag();
            }
        }
        return hashtable;
    }

    public static String serializeMetaData(Map<String, List<String>> map) {
        StringBuilder sb = new StringBuilder();
        if (map != null && map.size() > 0) {
            sb.append("<metadata xmlns=\"http://jivesoftware.com/protocol/workgroup\">");
            for (String str : map.keySet()) {
                for (String str2 : map.get(str)) {
                    sb.append("<value name=\"").append(str).append("\">");
                    sb.append(StringUtils.escapeForXML(str2));
                    sb.append("</value>");
                }
            }
            sb.append("</metadata>");
        }
        return sb.toString();
    }
}
