package com.anfengde.epub.core;

import android.util.Log;
import com.anfengde.epub.EPubChapter;
import com.anfengde.epub.EPubJNI;
import com.anfengde.epub.core.value.BookInfo;
import com.anfengde.epub.core.value.Constants;
import com.anfengde.epub.core.value.TableOfContent;

/* loaded from: classes.dex */
public class EPubDriver {
    private static final String TAG = "EPubDriver";
    private String bookPath;
    private String cachePath;
    public EPubJNI clsEPub;
    public BookInfo mBook = new BookInfo();
    public TableOfContent mToc = new TableOfContent();
    int initFlag = 0;
    public int handle = -1;

    public EPubDriver(String argCachePath) {
        this.cachePath = argCachePath;
    }

    public int initEPubJNI() {
        this.clsEPub = new EPubJNI();
        int ret = this.clsEPub.initEPubEnv(this.cachePath);
        if (ret != 1) {
            return this.clsEPub.epubGetLastError();
        }
        this.initFlag = 1;
        return 1;
    }

    public int openBook(String argBookPath) {
        this.bookPath = argBookPath;
        if (this.initFlag <= 0) {
            return 0;
        }
        this.handle = this.clsEPub.openEPubBook(this.bookPath);
        if (this.handle == 0) {
            return this.clsEPub.epubGetLastError();
        }
        int ret = getMeataData(this.handle);
        Log.d(TAG, "getMeataData return: " + String.valueOf(ret));
        if (ret == 0) {
            return this.clsEPub.epubGetLastError();
        }
        int ret2 = getToc(this.handle);
        Log.d(TAG, "getToc return: " + String.valueOf(ret2));
        if (ret2 <= 0) {
            return this.clsEPub.epubGetLastError();
        }
        String baseUrl = this.clsEPub.getEPubBookRootFolder(this.handle);
        this.mBook.setPath(baseUrl);
        return 1;
    }

    private int getMeataData(int handle) {
        return this.clsEPub.getEPubMetadata(this.mBook.metadata, handle);
    }

    public int getToc(int handle) {
        int chapterNumber = this.clsEPub.getEPubChapterCount(handle);
        if (chapterNumber > 0) {
            int current_handle = handle;
            for (int i = 0; i < chapterNumber; i++) {
                EPubChapter epubChapter = new EPubChapter();
                int next_handle = this.clsEPub.getEPubChapter(epubChapter, current_handle, i);
                if (next_handle == 0) {
                    return -1;
                }
                current_handle = next_handle;
                this.mToc.addChapter(epubChapter);
            }
        }
        return 1;
    }

    public String getCachePath() {
        return this.cachePath;
    }

    public void setCachePath(String cachePath) {
        this.cachePath = cachePath;
    }

    public int getLastError() {
        return -1;
    }

    public String getErrorMessage(int errorCode) {
        return this.clsEPub.epubGetMessage(errorCode);
    }

    public int closeBook() {
        return this.clsEPub.closeEPubBook(this.handle);
    }

    public void cleanUp() {
        this.clsEPub.cleanUpEPubEnv();
    }

    public int getBookSize() {
        return this.clsEPub.getEPubBookSize(this.handle);
    }

    public String getCoverImg() {
        return this.clsEPub.getEPubCoverImage(this.handle) != null ? this.clsEPub.getEPubCoverImage(this.handle) : Constants.COVERIMG_PATH;
    }
}
