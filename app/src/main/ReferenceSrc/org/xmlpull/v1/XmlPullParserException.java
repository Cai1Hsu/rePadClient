package org.xmlpull.v1;

/* loaded from: classes.jar:org/xmlpull/v1/XmlPullParserException.class */
public class XmlPullParserException extends Exception {
    protected int column;
    protected Throwable detail;
    protected int row;

    public XmlPullParserException(String str) {
        super(str);
        this.row = -1;
        this.column = -1;
    }

    public XmlPullParserException(String str, XmlPullParser xmlPullParser, Throwable th) {
        super(new StringBuffer().append(str == null ? "" : new StringBuffer().append(str).append(" ").toString()).append(xmlPullParser == null ? "" : new StringBuffer().append("(position:").append(xmlPullParser.getPositionDescription()).append(") ").toString()).append(th == null ? "" : new StringBuffer().append("caused by: ").append(th).toString()).toString());
        this.row = -1;
        this.column = -1;
        if (xmlPullParser != null) {
            this.row = xmlPullParser.getLineNumber();
            this.column = xmlPullParser.getColumnNumber();
        }
        this.detail = th;
    }

    public int getColumnNumber() {
        return this.column;
    }

    public Throwable getDetail() {
        return this.detail;
    }

    public int getLineNumber() {
        return this.row;
    }

    @Override // java.lang.Throwable
    public void printStackTrace() {
        if (this.detail == null) {
            super.printStackTrace();
            return;
        }
        synchronized (System.err) {
            System.err.println(new StringBuffer().append(super.getMessage()).append("; nested exception is:").toString());
            this.detail.printStackTrace();
        }
    }
}
