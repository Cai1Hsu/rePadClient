package com.anfengde.epub.db;

/* loaded from: classes.jar:com/anfengde/epub/db/DBBooks.class */
public class DBBooks {
    private String _author;
    private String _bookpath;
    private String _coverimage;
    private String _identifier;
    private String _name;

    public DBBooks() {
    }

    public DBBooks(String str, String str2, String str3, String str4, String str5) {
        setIdentifier(str);
        setName(str2);
        setAuthor(str3);
        setCoverimage(str4);
        setBookpath(str5);
    }

    public String getAuthor() {
        return this._author;
    }

    public String getBookpath() {
        return this._bookpath;
    }

    public String getCoverimage() {
        return this._coverimage;
    }

    public String getIdentifier() {
        return this._identifier;
    }

    public String getName() {
        return this._name;
    }

    public void setAuthor(String str) {
        this._author = str;
    }

    public void setBookpath(String str) {
        this._bookpath = str;
    }

    public void setCoverimage(String str) {
        this._coverimage = str;
    }

    public void setIdentifier(String str) {
        this._identifier = str;
    }

    public void setName(String str) {
        this._name = str;
    }
}
