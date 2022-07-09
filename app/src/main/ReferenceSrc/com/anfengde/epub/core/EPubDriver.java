package com.anfengde.epub.core;

import android.util.Log;
import com.anfengde.epub.EPubChapter;
import com.anfengde.epub.EPubJNI;
import com.anfengde.epub.core.value.BookInfo;
import com.anfengde.epub.core.value.Constants;
import com.anfengde.epub.core.value.TableOfContent;

/* loaded from: classes.jar:com/anfengde/epub/core/EPubDriver.class */
public class EPubDriver {
    private static final String TAG = "EPubDriver";
    private String bookPath;
    private String cachePath;
    public EPubJNI clsEPub;
    public BookInfo mBook = new BookInfo();
    public TableOfContent mToc = new TableOfContent();
    int initFlag = 0;
    public int handle = -1;

    public EPubDriver(String str) {
        this.cachePath = str;
    }

    private int getMeataData(int i) {
        return this.clsEPub.getEPubMetadata(this.mBook.metadata, i);
    }

    public void cleanUp() {
        this.clsEPub.cleanUpEPubEnv();
    }

    public int closeBook() {
        return this.clsEPub.closeEPubBook(this.handle);
    }

    public int getBookSize() {
        return this.clsEPub.getEPubBookSize(this.handle);
    }

    public String getCachePath() {
        return this.cachePath;
    }

    public String getCoverImg() {
        return this.clsEPub.getEPubCoverImage(this.handle) != null ? this.clsEPub.getEPubCoverImage(this.handle) : Constants.COVERIMG_PATH;
    }

    public String getErrorMessage(int i) {
        return this.clsEPub.epubGetMessage(i);
    }

    public int getLastError() {
        return -1;
    }

    public int getToc(int i) {
        int i2;
        int ePubChapterCount = this.clsEPub.getEPubChapterCount(i);
        if (ePubChapterCount > 0) {
            int i3 = i;
            for (int i4 = 0; i4 < ePubChapterCount; i4++) {
                EPubChapter ePubChapter = new EPubChapter();
                i3 = this.clsEPub.getEPubChapter(ePubChapter, i3, i4);
                if (i3 == 0) {
                    i2 = -1;
                    break;
                }
                this.mToc.addChapter(ePubChapter);
            }
        }
        i2 = 1;
        return i2;
    }

    public int initEPubJNI() {
        int i = 1;
        this.clsEPub = new EPubJNI();
        if (this.clsEPub.initEPubEnv(this.cachePath) != 1) {
            i = this.clsEPub.epubGetLastError();
        } else {
            this.initFlag = 1;
        }
        return i;
    }

    public int openBook(String str) {
        int i;
        this.bookPath = str;
        if (this.initFlag <= 0) {
            i = 0;
        } else {
            this.handle = this.clsEPub.openEPubBook(this.bookPath);
            if (this.handle == 0) {
                i = this.clsEPub.epubGetLastError();
            } else {
                int meataData = getMeataData(this.handle);
                Log.d(TAG, "getMeataData return: " + String.valueOf(meataData));
                if (meataData == 0) {
                    i = this.clsEPub.epubGetLastError();
                } else {
                    int toc = getToc(this.handle);
                    Log.d(TAG, "getToc return: " + String.valueOf(toc));
                    if (toc <= 0) {
                        i = this.clsEPub.epubGetLastError();
                    } else {
                        this.mBook.setPath(this.clsEPub.getEPubBookRootFolder(this.handle));
                        i = 1;
                    }
                }
            }
        }
        return i;
    }

    public void setCachePath(String str) {
        this.cachePath = str;
    }
}
