package com.anfengde.epub.core.value;

import com.anfengde.epub.EPubChapter;
import java.util.ArrayList;

/* loaded from: classes.jar:com/anfengde/epub/core/value/TableOfContent.class */
public class TableOfContent {
    private ArrayList<EPubChapter> chapterList = new ArrayList<>();

    public void addChapter(EPubChapter ePubChapter) {
        this.chapterList.add(ePubChapter);
    }

    public void clearChapter() {
        this.chapterList.clear();
    }

    public EPubChapter getChapter(int i) {
        if (i < 0) {
            i = 0;
        }
        int i2 = i;
        if (i >= this.chapterList.size()) {
            i2 = this.chapterList.size() - 1;
        }
        return this.chapterList.get(i2);
    }

    public ArrayList<EPubChapter> getChapterList() {
        return this.chapterList;
    }

    public int getTotalSize() {
        return this.chapterList.size();
    }
}
