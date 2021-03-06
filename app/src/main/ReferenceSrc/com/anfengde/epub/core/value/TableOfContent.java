package com.anfengde.epub.core.value;

import com.anfengde.epub.EPubChapter;
import java.util.ArrayList;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class TableOfContent {
    private ArrayList<EPubChapter> chapterList = new ArrayList<>();

    public EPubChapter getChapter(int num) {
        int chapNum;
        if (num < 0) {
            chapNum = 0;
        } else {
            chapNum = num;
        }
        if (chapNum >= this.chapterList.size()) {
            chapNum = this.chapterList.size() - 1;
        }
        return this.chapterList.get(chapNum);
    }

    public void addChapter(EPubChapter chapter) {
        this.chapterList.add(chapter);
    }

    public ArrayList<EPubChapter> getChapterList() {
        return this.chapterList;
    }

    public int getTotalSize() {
        return this.chapterList.size();
    }

    public void clearChapter() {
        this.chapterList.clear();
    }
}
