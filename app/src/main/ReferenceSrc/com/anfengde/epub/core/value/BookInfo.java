package com.anfengde.epub.core.value;

import com.anfengde.epub.EPubMetadata;
import java.util.ArrayList;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class BookInfo {
    private String cssPath;
    private String path;
    public EPubMetadata metadata = new EPubMetadata();
    private ArrayList<String> spineList = new ArrayList<>();

    public String getPath() {
        return this.path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getCssPath() {
        return this.cssPath;
    }

    public void setCssPath(String cssPath) {
        this.cssPath = cssPath;
    }

    public String getSpineItem(int i) {
        return this.spineList.get(i);
    }

    public ArrayList<String> getSpineList() {
        return this.spineList;
    }

    public void addSpine(String spine) {
        this.spineList.add(spine);
    }

    public String toString() {
        return "BookInfo [bookType=" + this.metadata.type + ", title=" + this.metadata.title + ", author=" + this.metadata.creator + ", publisher=" + this.metadata.publisher + ", date=" + this.metadata.date + ", subject=" + this.metadata.subject + ", language=" + this.metadata.language + ", right=" + this.metadata.rights + ", isbn=" + this.metadata.identifier + ", path=" + this.path + ", cssPath=" + this.cssPath + ", spineList=" + this.spineList + "]";
    }
}
