package org.jivesoftware.smackx.pubsub.util;

import com.edutech.publicedu.log.LogHelp;
import java.io.StringReader;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/util/XmlUtils.class */
public class XmlUtils {
    public static void appendAttribute(StringBuilder sb, String str, String str2) {
        sb.append(" ");
        sb.append(str);
        sb.append("='");
        sb.append(str2);
        sb.append("'");
    }

    public static void prettyPrint(String str, String str2) {
        String str3 = str2;
        try {
            Transformer newTransformer = TransformerFactory.newInstance().newTransformer();
            newTransformer.setOutputProperty("indent", "yes");
            newTransformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", LogHelp.TYPE_HWHELP);
            String str4 = str2;
            if (str != null) {
                str4 = "\n<" + str + ">" + str2 + "</" + str + '>';
            }
            String str5 = str4;
            String str6 = str4;
            String str7 = str4;
            String str8 = str4;
            String str9 = str4;
            String str10 = str4;
            str3 = str4;
            newTransformer.transform(new StreamSource(new StringReader(str4)), new StreamResult(System.out));
        } catch (Exception e) {
            System.out.println("Something wrong with xml in \n---------------\n" + str3 + "\n---------------");
            e.printStackTrace();
        }
    }
}
