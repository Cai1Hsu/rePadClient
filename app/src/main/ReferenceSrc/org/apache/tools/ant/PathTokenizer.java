package org.apache.tools.ant;

import java.io.File;
import java.util.NoSuchElementException;
import java.util.StringTokenizer;
import org.apache.tools.ant.taskdefs.condition.Os;

/* loaded from: classes.jar:org/apache/tools/ant/PathTokenizer.class */
public class PathTokenizer {
    private boolean dosStyleFilesystem;
    private String lookahead = null;
    private boolean onNetWare = Os.isFamily(Os.FAMILY_NETWARE);
    private StringTokenizer tokenizer;

    public PathTokenizer(String str) {
        boolean z = true;
        if (this.onNetWare) {
            this.tokenizer = new StringTokenizer(str, ":;", true);
        } else {
            this.tokenizer = new StringTokenizer(str, ":;", false);
        }
        this.dosStyleFilesystem = File.pathSeparatorChar != ';' ? false : z;
    }

    public boolean hasMoreTokens() {
        return this.lookahead != null ? true : this.tokenizer.hasMoreTokens();
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x00a5, code lost:
        if (r4.equals(":") != false) goto L28;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public String nextToken() throws NoSuchElementException {
        String trim;
        String str;
        String str2;
        if (this.lookahead != null) {
            trim = this.lookahead;
            this.lookahead = null;
        } else {
            trim = this.tokenizer.nextToken().trim();
        }
        if (!this.onNetWare) {
            str2 = trim;
            if (trim.length() == 1) {
                str2 = trim;
                if (Character.isLetter(trim.charAt(0))) {
                    str2 = trim;
                    if (this.dosStyleFilesystem) {
                        str2 = trim;
                        if (this.tokenizer.hasMoreTokens()) {
                            String trim2 = this.tokenizer.nextToken().trim();
                            if (trim2.startsWith("\\") || trim2.startsWith("/")) {
                                str2 = new StringBuffer().append(trim).append(":").append(trim2).toString();
                            } else {
                                this.lookahead = trim2;
                                str2 = trim;
                            }
                        }
                    }
                }
            }
        } else {
            if (!trim.equals(File.pathSeparator)) {
                str = trim;
            }
            str = this.tokenizer.nextToken().trim();
            str2 = str;
            if (this.tokenizer.hasMoreTokens()) {
                String trim3 = this.tokenizer.nextToken().trim();
                str2 = str;
                if (!trim3.equals(File.pathSeparator)) {
                    if (trim3.equals(":")) {
                        str2 = str;
                        if (!str.startsWith("/")) {
                            str2 = str;
                            if (!str.startsWith("\\")) {
                                str2 = str;
                                if (!str.startsWith(".")) {
                                    str2 = str;
                                    if (!str.startsWith("..")) {
                                        String trim4 = this.tokenizer.nextToken().trim();
                                        if (!trim4.equals(File.pathSeparator)) {
                                            str2 = new StringBuffer().append(str).append(":").append(trim4).toString();
                                        } else {
                                            str2 = new StringBuffer().append(str).append(":").toString();
                                            this.lookahead = trim4;
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        this.lookahead = trim3;
                        str2 = str;
                    }
                }
            }
        }
        return str2;
    }
}
