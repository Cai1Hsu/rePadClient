package org.jivesoftware.smackx.workgroup.packet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smackx.workgroup.packet.Transcripts;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/TranscriptsProvider.class */
public class TranscriptsProvider implements IQProvider {
    private static final SimpleDateFormat UTC_FORMAT = new SimpleDateFormat("yyyyMMdd'T'HH:mm:ss");

    static {
        UTC_FORMAT.setTimeZone(TimeZone.getTimeZone("GMT+0"));
    }

    private List<Transcripts.AgentDetail> parseAgents(XmlPullParser xmlPullParser) throws IOException, XmlPullParserException {
        ArrayList arrayList = new ArrayList();
        String str = null;
        Date date = null;
        Date date2 = null;
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("agentJID")) {
                    str = xmlPullParser.nextText();
                } else if (xmlPullParser.getName().equals("joinTime")) {
                    try {
                        date = UTC_FORMAT.parse(xmlPullParser.nextText());
                    } catch (ParseException e) {
                    }
                } else if (xmlPullParser.getName().equals("leftTime")) {
                    try {
                        date2 = UTC_FORMAT.parse(xmlPullParser.nextText());
                    } catch (ParseException e2) {
                    }
                } else if (xmlPullParser.getName().equals("agent")) {
                    str = null;
                    date = null;
                    date2 = null;
                }
            } else if (next == 3) {
                if (xmlPullParser.getName().equals("agents")) {
                    z = true;
                } else if (xmlPullParser.getName().equals("agent")) {
                    arrayList.add(new Transcripts.AgentDetail(str, date, date2));
                }
            }
        }
        return arrayList;
    }

    private Transcripts.TranscriptSummary parseSummary(XmlPullParser xmlPullParser) throws IOException, XmlPullParserException {
        String attributeValue = xmlPullParser.getAttributeValue("", "sessionID");
        Date date = null;
        Date date2 = null;
        ArrayList arrayList = new ArrayList();
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("joinTime")) {
                    try {
                        date = UTC_FORMAT.parse(xmlPullParser.nextText());
                    } catch (ParseException e) {
                    }
                } else if (xmlPullParser.getName().equals("leftTime")) {
                    try {
                        date2 = UTC_FORMAT.parse(xmlPullParser.nextText());
                    } catch (ParseException e2) {
                    }
                } else if (xmlPullParser.getName().equals("agents")) {
                    arrayList = parseAgents(xmlPullParser);
                }
            } else if (next == 3 && xmlPullParser.getName().equals("transcript")) {
                z = true;
            }
        }
        return new Transcripts.TranscriptSummary(attributeValue, date, date2, arrayList);
    }

    @Override // org.jivesoftware.smack.provider.IQProvider
    public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
        String attributeValue = xmlPullParser.getAttributeValue("", "userID");
        ArrayList arrayList = new ArrayList();
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("transcript")) {
                    arrayList.add(parseSummary(xmlPullParser));
                }
            } else if (next == 3 && xmlPullParser.getName().equals("transcripts")) {
                z = true;
            }
        }
        return new Transcripts(attributeValue, arrayList);
    }
}
