package com.anfengde.epub.core.value;

import com.anfengde.epub.EPubMetadata;
import java.util.ArrayList;

/* loaded from: classes.jar:com/anfengde/epub/core/value/BookInfo.class */
public class BookInfo {
    private String cssPath;
    private String path;
    public EPubMetadata metadata = new EPubMetadata();
    private ArrayList<String> spineList = new ArrayList<>();

    public void addSpine(String str) {
        this.spineList.add(str);
    }

    public String getCssPath() {
        return this.cssPath;
    }

    public String getPath() {
        return this.path;
    }

    public String getSpineItem(int i) {
        return this.spineList.get(i);
    }

    public ArrayList<String> getSpineList() {
        return this.spineList;
    }

    public void setCssPath(String str) {
        this.cssPath = str;
    }

    public void setPath(String str) {
        this.path = str;
    }

    public String toString() {
        return "BookInfo [bookType=" + this.metadata.type + ", title=" + this.metadata.title + ", author=" + this.metadata.creator + ", publisher=" + this.metadata.publisher + ", date=" + this.metadata.date + ", subject=" + this.metadata.subject + ", language=" + this.metadata.language + ", right=" + this.metadata.rights + ", isbn=" + this.metadata.identifier + ", path=" + this.path + ", cssPath=" + this.cssPath + ", spineList=" + this.spineList + "]";
    }
}
