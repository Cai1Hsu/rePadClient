package org.jivesoftware.smackx.bookmark;

import com.edutech.idauthentication.AppEnvironment;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.apache.tools.ant.MagicNames;
import org.jivesoftware.smackx.packet.Nick;
import org.jivesoftware.smackx.packet.PrivateData;
import org.jivesoftware.smackx.provider.PrivateDataProvider;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes.jar:org/jivesoftware/smackx/bookmark/Bookmarks.class */
public class Bookmarks implements PrivateData {
    private List<BookmarkedURL> bookmarkedURLS = new ArrayList();
    private List<BookmarkedConference> bookmarkedConferences = new ArrayList();

    /* loaded from: classes.jar:org/jivesoftware/smackx/bookmark/Bookmarks$Provider.class */
    public static class Provider implements PrivateDataProvider {
        @Override // org.jivesoftware.smackx.provider.PrivateDataProvider
        public PrivateData parsePrivateData(XmlPullParser xmlPullParser) throws Exception {
            Bookmarks bookmarks = new Bookmarks();
            boolean z = false;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2 && MagicNames.ANT_FILE_TYPE_URL.equals(xmlPullParser.getName())) {
                    BookmarkedURL uRLStorage = Bookmarks.getURLStorage(xmlPullParser);
                    if (uRLStorage != null) {
                        bookmarks.addBookmarkedURL(uRLStorage);
                    }
                } else if (next == 2 && "conference".equals(xmlPullParser.getName())) {
                    bookmarks.addBookmarkedConference(Bookmarks.getConferenceStorage(xmlPullParser));
                } else if (next == 3 && "storage".equals(xmlPullParser.getName())) {
                    z = true;
                }
            }
            return bookmarks;
        }
    }

    public static BookmarkedConference getConferenceStorage(XmlPullParser xmlPullParser) throws Exception {
        String attributeValue = xmlPullParser.getAttributeValue("", "name");
        String attributeValue2 = xmlPullParser.getAttributeValue("", "autojoin");
        BookmarkedConference bookmarkedConference = new BookmarkedConference(xmlPullParser.getAttributeValue("", "jid"));
        bookmarkedConference.setName(attributeValue);
        bookmarkedConference.setAutoJoin(Boolean.valueOf(attributeValue2).booleanValue());
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2 && Nick.ELEMENT_NAME.equals(xmlPullParser.getName())) {
                bookmarkedConference.setNickname(xmlPullParser.nextText());
            } else if (next == 2 && AppEnvironment.PASSWORD.equals(xmlPullParser.getName())) {
                bookmarkedConference.setPassword(xmlPullParser.nextText());
            } else if (next == 2 && "shared_bookmark".equals(xmlPullParser.getName())) {
                bookmarkedConference.setShared(true);
            } else if (next == 3 && "conference".equals(xmlPullParser.getName())) {
                z = true;
            }
        }
        return bookmarkedConference;
    }

    public static BookmarkedURL getURLStorage(XmlPullParser xmlPullParser) throws IOException, XmlPullParserException {
        String attributeValue = xmlPullParser.getAttributeValue("", "name");
        String attributeValue2 = xmlPullParser.getAttributeValue("", MagicNames.ANT_FILE_TYPE_URL);
        String attributeValue3 = xmlPullParser.getAttributeValue("", "rss");
        BookmarkedURL bookmarkedURL = new BookmarkedURL(attributeValue2, attributeValue, attributeValue3 != null && "true".equals(attributeValue3));
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2 && "shared_bookmark".equals(xmlPullParser.getName())) {
                bookmarkedURL.setShared(true);
            } else if (next == 3 && MagicNames.ANT_FILE_TYPE_URL.equals(xmlPullParser.getName())) {
                z = true;
            }
        }
        return bookmarkedURL;
    }

    public void addBookmarkedConference(BookmarkedConference bookmarkedConference) {
        this.bookmarkedConferences.add(bookmarkedConference);
    }

    public void addBookmarkedURL(BookmarkedURL bookmarkedURL) {
        this.bookmarkedURLS.add(bookmarkedURL);
    }

    public void clearBookmarkedConferences() {
        this.bookmarkedConferences.clear();
    }

    public void clearBookmarkedURLS() {
        this.bookmarkedURLS.clear();
    }

    public List<BookmarkedConference> getBookmarkedConferences() {
        return this.bookmarkedConferences;
    }

    public List<BookmarkedURL> getBookmarkedURLS() {
        return this.bookmarkedURLS;
    }

    @Override // org.jivesoftware.smackx.packet.PrivateData
    public String getElementName() {
        return "storage";
    }

    @Override // org.jivesoftware.smackx.packet.PrivateData
    public String getNamespace() {
        return "storage:bookmarks";
    }

    public void removeBookmarkedConference(BookmarkedConference bookmarkedConference) {
        this.bookmarkedConferences.remove(bookmarkedConference);
    }

    public void removeBookmarkedURL(BookmarkedURL bookmarkedURL) {
        this.bookmarkedURLS.remove(bookmarkedURL);
    }

    @Override // org.jivesoftware.smackx.packet.PrivateData
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<storage xmlns=\"storage:bookmarks\">");
        for (BookmarkedURL bookmarkedURL : getBookmarkedURLS()) {
            if (!bookmarkedURL.isShared()) {
                sb.append("<url name=\"").append(bookmarkedURL.getName()).append("\" url=\"").append(bookmarkedURL.getURL()).append("\"");
                if (bookmarkedURL.isRss()) {
                    sb.append(" rss=\"").append(true).append("\"");
                }
                sb.append(" />");
            }
        }
        for (BookmarkedConference bookmarkedConference : getBookmarkedConferences()) {
            if (!bookmarkedConference.isShared()) {
                sb.append("<conference ");
                sb.append("name=\"").append(bookmarkedConference.getName()).append("\" ");
                sb.append("autojoin=\"").append(bookmarkedConference.isAutoJoin()).append("\" ");
                sb.append("jid=\"").append(bookmarkedConference.getJid()).append("\" ");
                sb.append(">");
                if (bookmarkedConference.getNickname() != null) {
                    sb.append("<nick>").append(bookmarkedConference.getNickname()).append("</nick>");
                }
                if (bookmarkedConference.getPassword() != null) {
                    sb.append("<password>").append(bookmarkedConference.getPassword()).append("</password>");
                }
                sb.append("</conference>");
            }
        }
        sb.append("</storage>");
        return sb.toString();
    }
}
