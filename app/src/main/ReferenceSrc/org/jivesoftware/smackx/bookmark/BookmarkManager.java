package org.jivesoftware.smackx.bookmark;

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.PrivateDataManager;
import org.jivesoftware.smackx.bookmark.Bookmarks;

/* loaded from: classes.jar:org/jivesoftware/smackx/bookmark/BookmarkManager.class */
public class BookmarkManager {
    private static final Map<Connection, BookmarkManager> bookmarkManagerMap = new HashMap();
    private final Object bookmarkLock = new Object();
    private Bookmarks bookmarks;
    private PrivateDataManager privateDataManager;

    static {
        PrivateDataManager.addPrivateDataProvider("storage", "storage:bookmarks", new Bookmarks.Provider());
    }

    private BookmarkManager(Connection connection) throws XMPPException {
        if (connection == null || !connection.isAuthenticated()) {
            throw new XMPPException("Invalid connection.");
        }
        this.privateDataManager = new PrivateDataManager(connection);
    }

    public static BookmarkManager getBookmarkManager(Connection connection) throws XMPPException {
        BookmarkManager bookmarkManager;
        synchronized (BookmarkManager.class) {
            try {
                BookmarkManager bookmarkManager2 = bookmarkManagerMap.get(connection);
                bookmarkManager = bookmarkManager2;
                if (bookmarkManager2 == null) {
                    bookmarkManager = new BookmarkManager(connection);
                    bookmarkManagerMap.put(connection, bookmarkManager);
                }
            } finally {
            }
        }
        return bookmarkManager;
    }

    private Bookmarks retrieveBookmarks() throws XMPPException {
        Bookmarks bookmarks;
        synchronized (this.bookmarkLock) {
            if (this.bookmarks == null) {
                this.bookmarks = (Bookmarks) this.privateDataManager.getPrivateData("storage", "storage:bookmarks");
            }
            bookmarks = this.bookmarks;
        }
        return bookmarks;
    }

    public void addBookmarkedConference(String str, String str2, boolean z, String str3, String str4) throws XMPPException {
        retrieveBookmarks();
        BookmarkedConference bookmarkedConference = new BookmarkedConference(str, str2, z, str3, str4);
        List<BookmarkedConference> bookmarkedConferences = this.bookmarks.getBookmarkedConferences();
        if (bookmarkedConferences.contains(bookmarkedConference)) {
            BookmarkedConference bookmarkedConference2 = bookmarkedConferences.get(bookmarkedConferences.indexOf(bookmarkedConference));
            if (bookmarkedConference2.isShared()) {
                throw new IllegalArgumentException("Cannot modify shared bookmark");
            }
            bookmarkedConference2.setAutoJoin(z);
            bookmarkedConference2.setName(str);
            bookmarkedConference2.setNickname(str3);
            bookmarkedConference2.setPassword(str4);
        } else {
            this.bookmarks.addBookmarkedConference(bookmarkedConference);
        }
        this.privateDataManager.setPrivateData(this.bookmarks);
    }

    public void addBookmarkedURL(String str, String str2, boolean z) throws XMPPException {
        retrieveBookmarks();
        BookmarkedURL bookmarkedURL = new BookmarkedURL(str, str2, z);
        List<BookmarkedURL> bookmarkedURLS = this.bookmarks.getBookmarkedURLS();
        if (bookmarkedURLS.contains(bookmarkedURL)) {
            BookmarkedURL bookmarkedURL2 = bookmarkedURLS.get(bookmarkedURLS.indexOf(bookmarkedURL));
            if (bookmarkedURL2.isShared()) {
                throw new IllegalArgumentException("Cannot modify shared bookmarks");
            }
            bookmarkedURL2.setName(str2);
            bookmarkedURL2.setRss(z);
        } else {
            this.bookmarks.addBookmarkedURL(bookmarkedURL);
        }
        this.privateDataManager.setPrivateData(this.bookmarks);
    }

    public Collection<BookmarkedConference> getBookmarkedConferences() throws XMPPException {
        retrieveBookmarks();
        return Collections.unmodifiableCollection(this.bookmarks.getBookmarkedConferences());
    }

    public Collection<BookmarkedURL> getBookmarkedURLs() throws XMPPException {
        retrieveBookmarks();
        return Collections.unmodifiableCollection(this.bookmarks.getBookmarkedURLS());
    }

    public void removeBookmarkedConference(String str) throws XMPPException {
        retrieveBookmarks();
        Iterator<BookmarkedConference> it = this.bookmarks.getBookmarkedConferences().iterator();
        while (it.hasNext()) {
            BookmarkedConference next = it.next();
            if (next.getJid().equalsIgnoreCase(str)) {
                if (next.isShared()) {
                    throw new IllegalArgumentException("Conference is shared and can't be removed");
                }
                it.remove();
                this.privateDataManager.setPrivateData(this.bookmarks);
                return;
            }
        }
    }

    public void removeBookmarkedURL(String str) throws XMPPException {
        retrieveBookmarks();
        Iterator<BookmarkedURL> it = this.bookmarks.getBookmarkedURLS().iterator();
        while (it.hasNext()) {
            BookmarkedURL next = it.next();
            if (next.getURL().equalsIgnoreCase(str)) {
                if (next.isShared()) {
                    throw new IllegalArgumentException("Cannot delete a shared bookmark.");
                }
                it.remove();
                this.privateDataManager.setPrivateData(this.bookmarks);
                return;
            }
        }
    }
}
