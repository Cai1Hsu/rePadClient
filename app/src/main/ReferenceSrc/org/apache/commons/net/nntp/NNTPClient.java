package org.apache.commons.net.nntp;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Vector;
import org.apache.commons.net.MalformedServerReplyException;
import org.apache.commons.net.io.DotTerminatedMessageReader;
import org.apache.commons.net.io.DotTerminatedMessageWriter;
import org.apache.commons.net.io.Util;

/* loaded from: classes.jar:org/apache/commons/net/nntp/NNTPClient.class */
public class NNTPClient extends NNTP {
    private void __ai2ap(ArticleInfo articleInfo, ArticlePointer articlePointer) {
        if (articlePointer != null) {
            articlePointer.articleId = articleInfo.articleId;
            articlePointer.articleNumber = (int) articleInfo.articleNumber;
        }
    }

    private ArticleInfo __ap2ai(ArticlePointer articlePointer) {
        return articlePointer == null ? null : new ArticleInfo();
    }

    static Article __parseArticleEntry(String str) {
        Article article = new Article();
        article.setSubject(str);
        String[] split = str.split("\t");
        if (split.length > 6) {
            int i = 0 + 1;
            try {
                article.setArticleNumber(Long.parseLong(split[0]));
                int i2 = i + 1;
                try {
                    article.setSubject(split[i]);
                    int i3 = i2 + 1;
                    article.setFrom(split[i2]);
                    int i4 = i3 + 1;
                    article.setDate(split[i3]);
                    int i5 = i4 + 1;
                    article.setArticleId(split[i4]);
                    article.addReference(split[i5]);
                } catch (NumberFormatException e) {
                }
            } catch (NumberFormatException e2) {
            }
        }
        return article;
    }

    private void __parseArticlePointer(String str, ArticleInfo articleInfo) throws MalformedServerReplyException {
        String[] split = str.split(" ");
        if (split.length >= 3) {
            int i = 1 + 1;
            try {
                articleInfo.articleNumber = Long.parseLong(split[1]);
                try {
                    articleInfo.articleId = split[i];
                    return;
                } catch (NumberFormatException e) {
                }
            } catch (NumberFormatException e2) {
            }
        }
        throw new MalformedServerReplyException("Could not parse article pointer.\nServer reply: " + str);
    }

    private static void __parseGroupReply(String str, NewsgroupInfo newsgroupInfo) throws MalformedServerReplyException {
        String[] split = str.split(" ");
        if (split.length >= 5) {
            int i = 1 + 1;
            try {
                newsgroupInfo._setArticleCount(Long.parseLong(split[1]));
                int i2 = i + 1;
                try {
                    newsgroupInfo._setFirstArticle(Long.parseLong(split[i]));
                    int i3 = i2 + 1;
                    newsgroupInfo._setLastArticle(Long.parseLong(split[i2]));
                    newsgroupInfo._setNewsgroup(split[i3]);
                    newsgroupInfo._setPostingPermission(0);
                    return;
                } catch (NumberFormatException e) {
                }
            } catch (NumberFormatException e2) {
            }
        }
        throw new MalformedServerReplyException("Could not parse newsgroup info.\nServer reply: " + str);
    }

    static NewsgroupInfo __parseNewsgroupListEntry(String str) {
        NewsgroupInfo newsgroupInfo;
        String[] split = str.split(" ");
        if (split.length < 4) {
            newsgroupInfo = null;
        } else {
            newsgroupInfo = new NewsgroupInfo();
            int i = 0 + 1;
            newsgroupInfo._setNewsgroup(split[0]);
            int i2 = i + 1;
            try {
                long parseLong = Long.parseLong(split[i]);
                int i3 = i2 + 1;
                try {
                    long parseLong2 = Long.parseLong(split[i2]);
                    newsgroupInfo._setFirstArticle(parseLong2);
                    newsgroupInfo._setLastArticle(parseLong);
                    if (parseLong2 == 0 && parseLong == 0) {
                        newsgroupInfo._setArticleCount(0L);
                    } else {
                        newsgroupInfo._setArticleCount((parseLong - parseLong2) + 1);
                    }
                    switch (split[i3].charAt(0)) {
                        case 'M':
                        case 'm':
                            newsgroupInfo._setPostingPermission(1);
                            break;
                        case 'N':
                        case 'n':
                            newsgroupInfo._setPostingPermission(3);
                            break;
                        case 'Y':
                        case 'y':
                            newsgroupInfo._setPostingPermission(2);
                            break;
                        default:
                            newsgroupInfo._setPostingPermission(0);
                            break;
                    }
                } catch (NumberFormatException e) {
                    newsgroupInfo = null;
                    return newsgroupInfo;
                }
            } catch (NumberFormatException e2) {
            }
        }
        return newsgroupInfo;
    }

    private NewsgroupInfo[] __readNewsgroupListing() throws IOException {
        NewsgroupInfo[] newsgroupInfoArr;
        DotTerminatedMessageReader dotTerminatedMessageReader = new DotTerminatedMessageReader(this._reader_);
        Vector vector = new Vector(2048);
        while (true) {
            String readLine = dotTerminatedMessageReader.readLine();
            if (readLine == null) {
                int size = vector.size();
                if (size < 1) {
                    newsgroupInfoArr = new NewsgroupInfo[0];
                } else {
                    newsgroupInfoArr = new NewsgroupInfo[size];
                    vector.copyInto(newsgroupInfoArr);
                }
                return newsgroupInfoArr;
            }
            NewsgroupInfo __parseNewsgroupListEntry = __parseNewsgroupListEntry(readLine);
            if (__parseNewsgroupListEntry == null) {
                throw new MalformedServerReplyException(readLine);
            }
            vector.addElement(__parseNewsgroupListEntry);
        }
    }

    private BufferedReader __retrieve(int i, long j, ArticleInfo articleInfo) throws IOException {
        DotTerminatedMessageReader dotTerminatedMessageReader;
        if (!NNTPReply.isPositiveCompletion(sendCommand(i, Long.toString(j)))) {
            dotTerminatedMessageReader = null;
        } else {
            if (articleInfo != null) {
                __parseArticlePointer(getReplyString(), articleInfo);
            }
            dotTerminatedMessageReader = new DotTerminatedMessageReader(this._reader_);
        }
        return dotTerminatedMessageReader;
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0023, code lost:
        if (org.apache.commons.net.nntp.NNTPReply.isPositiveCompletion(sendCommand(r5)) != false) goto L11;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private BufferedReader __retrieve(int i, String str, ArticleInfo articleInfo) throws IOException {
        DotTerminatedMessageReader dotTerminatedMessageReader;
        if (str != null) {
            if (!NNTPReply.isPositiveCompletion(sendCommand(i, str))) {
                dotTerminatedMessageReader = null;
            }
            if (articleInfo != null) {
                __parseArticlePointer(getReplyString(), articleInfo);
            }
            dotTerminatedMessageReader = new DotTerminatedMessageReader(this._reader_);
        } else {
            dotTerminatedMessageReader = null;
        }
        return dotTerminatedMessageReader;
    }

    private BufferedReader __retrieveArticleInfo(String str) throws IOException {
        return !NNTPReply.isPositiveCompletion(xover(str)) ? null : new DotTerminatedMessageReader(this._reader_);
    }

    private BufferedReader __retrieveHeader(String str, String str2) throws IOException {
        return !NNTPReply.isPositiveCompletion(xhdr(str, str2)) ? null : new DotTerminatedMessageReader(this._reader_);
    }

    public boolean authenticate(String str, String str2) throws IOException {
        boolean z = true;
        if (authinfoUser(str) == 381 && authinfoPass(str2) == 281) {
            this._isAllowedToPost = true;
        } else {
            z = false;
        }
        return z;
    }

    public boolean completePendingCommand() throws IOException {
        return NNTPReply.isPositiveCompletion(getReply());
    }

    public Writer forwardArticle(String str) throws IOException {
        return !NNTPReply.isPositiveIntermediate(ihave(str)) ? null : new DotTerminatedMessageWriter(this._writer_);
    }

    public Iterable<Article> iterateArticleInfo(long j, long j2) throws IOException {
        BufferedReader retrieveArticleInfo = retrieveArticleInfo(j, j2);
        if (retrieveArticleInfo == null) {
            throw new IOException("XOVER command failed: " + getReplyString());
        }
        return new ArticleIterator(new ReplyIterator(retrieveArticleInfo, false));
    }

    public Iterable<String> iterateNewNews(NewGroupsOrNewsQuery newGroupsOrNewsQuery) throws IOException {
        if (NNTPReply.isPositiveCompletion(newnews(newGroupsOrNewsQuery.getNewsgroups(), newGroupsOrNewsQuery.getDate(), newGroupsOrNewsQuery.getTime(), newGroupsOrNewsQuery.isGMT(), newGroupsOrNewsQuery.getDistributions()))) {
            return new ReplyIterator(this._reader_);
        }
        throw new IOException("NEWNEWS command failed: " + getReplyString());
    }

    public Iterable<String> iterateNewNewsgroupListing(NewGroupsOrNewsQuery newGroupsOrNewsQuery) throws IOException {
        if (NNTPReply.isPositiveCompletion(newgroups(newGroupsOrNewsQuery.getDate(), newGroupsOrNewsQuery.getTime(), newGroupsOrNewsQuery.isGMT(), newGroupsOrNewsQuery.getDistributions()))) {
            return new ReplyIterator(this._reader_);
        }
        throw new IOException("NEWGROUPS command failed: " + getReplyString());
    }

    public Iterable<NewsgroupInfo> iterateNewNewsgroups(NewGroupsOrNewsQuery newGroupsOrNewsQuery) throws IOException {
        return new NewsgroupIterator(iterateNewNewsgroupListing(newGroupsOrNewsQuery));
    }

    public Iterable<String> iterateNewsgroupListing() throws IOException {
        if (NNTPReply.isPositiveCompletion(list())) {
            return new ReplyIterator(this._reader_);
        }
        throw new IOException("LIST command failed: " + getReplyString());
    }

    public Iterable<String> iterateNewsgroupListing(String str) throws IOException {
        if (NNTPReply.isPositiveCompletion(listActive(str))) {
            return new ReplyIterator(this._reader_);
        }
        throw new IOException("LIST ACTIVE " + str + " command failed: " + getReplyString());
    }

    public Iterable<NewsgroupInfo> iterateNewsgroups() throws IOException {
        return new NewsgroupIterator(iterateNewsgroupListing());
    }

    public Iterable<NewsgroupInfo> iterateNewsgroups(String str) throws IOException {
        return new NewsgroupIterator(iterateNewsgroupListing(str));
    }

    public String listHelp() throws IOException {
        String stringWriter;
        if (!NNTPReply.isInformational(help())) {
            stringWriter = null;
        } else {
            StringWriter stringWriter2 = new StringWriter();
            DotTerminatedMessageReader dotTerminatedMessageReader = new DotTerminatedMessageReader(this._reader_);
            Util.copyReader(dotTerminatedMessageReader, stringWriter2);
            dotTerminatedMessageReader.close();
            stringWriter2.close();
            stringWriter = stringWriter2.toString();
        }
        return stringWriter;
    }

    public String[] listNewNews(NewGroupsOrNewsQuery newGroupsOrNewsQuery) throws IOException {
        String[] strArr;
        if (!NNTPReply.isPositiveCompletion(newnews(newGroupsOrNewsQuery.getNewsgroups(), newGroupsOrNewsQuery.getDate(), newGroupsOrNewsQuery.getTime(), newGroupsOrNewsQuery.isGMT(), newGroupsOrNewsQuery.getDistributions()))) {
            strArr = null;
        } else {
            Vector vector = new Vector();
            DotTerminatedMessageReader dotTerminatedMessageReader = new DotTerminatedMessageReader(this._reader_);
            while (true) {
                String readLine = dotTerminatedMessageReader.readLine();
                if (readLine == null) {
                    break;
                }
                vector.addElement(readLine);
            }
            int size = vector.size();
            if (size < 1) {
                strArr = new String[0];
            } else {
                strArr = new String[size];
                vector.copyInto(strArr);
            }
        }
        return strArr;
    }

    public NewsgroupInfo[] listNewNewsgroups(NewGroupsOrNewsQuery newGroupsOrNewsQuery) throws IOException {
        return !NNTPReply.isPositiveCompletion(newgroups(newGroupsOrNewsQuery.getDate(), newGroupsOrNewsQuery.getTime(), newGroupsOrNewsQuery.isGMT(), newGroupsOrNewsQuery.getDistributions())) ? null : __readNewsgroupListing();
    }

    public NewsgroupInfo[] listNewsgroups() throws IOException {
        return !NNTPReply.isPositiveCompletion(list()) ? null : __readNewsgroupListing();
    }

    public NewsgroupInfo[] listNewsgroups(String str) throws IOException {
        return !NNTPReply.isPositiveCompletion(listActive(str)) ? null : __readNewsgroupListing();
    }

    public String[] listOverviewFmt() throws IOException {
        String[] strArr;
        if (!NNTPReply.isPositiveCompletion(sendCommand("LIST", "OVERVIEW.FMT"))) {
            strArr = null;
        } else {
            DotTerminatedMessageReader dotTerminatedMessageReader = new DotTerminatedMessageReader(this._reader_);
            ArrayList arrayList = new ArrayList();
            while (true) {
                String readLine = dotTerminatedMessageReader.readLine();
                if (readLine == null) {
                    break;
                }
                arrayList.add(readLine);
            }
            dotTerminatedMessageReader.close();
            strArr = (String[]) arrayList.toArray(new String[arrayList.size()]);
        }
        return strArr;
    }

    public boolean logout() throws IOException {
        return NNTPReply.isPositiveCompletion(quit());
    }

    public Writer postArticle() throws IOException {
        return !NNTPReply.isPositiveIntermediate(post()) ? null : new DotTerminatedMessageWriter(this._writer_);
    }

    public BufferedReader retrieveArticle(long j) throws IOException {
        return retrieveArticle(j, (ArticleInfo) null);
    }

    public BufferedReader retrieveArticle(long j, ArticleInfo articleInfo) throws IOException {
        return __retrieve(0, j, articleInfo);
    }

    public BufferedReader retrieveArticle(String str, ArticleInfo articleInfo) throws IOException {
        return __retrieve(0, str, articleInfo);
    }

    public Reader retrieveArticle() throws IOException {
        return retrieveArticle((String) null);
    }

    @Deprecated
    public Reader retrieveArticle(int i) throws IOException {
        return retrieveArticle(i);
    }

    @Deprecated
    public Reader retrieveArticle(int i, ArticlePointer articlePointer) throws IOException {
        ArticleInfo __ap2ai = __ap2ai(articlePointer);
        BufferedReader retrieveArticle = retrieveArticle(i, __ap2ai);
        __ai2ap(__ap2ai, articlePointer);
        return retrieveArticle;
    }

    public Reader retrieveArticle(String str) throws IOException {
        return retrieveArticle(str, (ArticleInfo) null);
    }

    @Deprecated
    public Reader retrieveArticle(String str, ArticlePointer articlePointer) throws IOException {
        ArticleInfo __ap2ai = __ap2ai(articlePointer);
        BufferedReader retrieveArticle = retrieveArticle(str, __ap2ai);
        __ai2ap(__ap2ai, articlePointer);
        return retrieveArticle;
    }

    public BufferedReader retrieveArticleBody(long j) throws IOException {
        return retrieveArticleBody(j, (ArticleInfo) null);
    }

    public BufferedReader retrieveArticleBody(long j, ArticleInfo articleInfo) throws IOException {
        return __retrieve(1, j, articleInfo);
    }

    public BufferedReader retrieveArticleBody(String str, ArticleInfo articleInfo) throws IOException {
        return __retrieve(1, str, articleInfo);
    }

    public Reader retrieveArticleBody() throws IOException {
        return retrieveArticleBody((String) null);
    }

    @Deprecated
    public Reader retrieveArticleBody(int i) throws IOException {
        return retrieveArticleBody(i);
    }

    @Deprecated
    public Reader retrieveArticleBody(int i, ArticlePointer articlePointer) throws IOException {
        ArticleInfo __ap2ai = __ap2ai(articlePointer);
        BufferedReader retrieveArticleBody = retrieveArticleBody(i, __ap2ai);
        __ai2ap(__ap2ai, articlePointer);
        return retrieveArticleBody;
    }

    public Reader retrieveArticleBody(String str) throws IOException {
        return retrieveArticleBody(str, (ArticleInfo) null);
    }

    @Deprecated
    public Reader retrieveArticleBody(String str, ArticlePointer articlePointer) throws IOException {
        ArticleInfo __ap2ai = __ap2ai(articlePointer);
        BufferedReader retrieveArticleBody = retrieveArticleBody(str, __ap2ai);
        __ai2ap(__ap2ai, articlePointer);
        return retrieveArticleBody;
    }

    public BufferedReader retrieveArticleHeader(long j) throws IOException {
        return retrieveArticleHeader(j, (ArticleInfo) null);
    }

    public BufferedReader retrieveArticleHeader(long j, ArticleInfo articleInfo) throws IOException {
        return __retrieve(3, j, articleInfo);
    }

    public BufferedReader retrieveArticleHeader(String str, ArticleInfo articleInfo) throws IOException {
        return __retrieve(3, str, articleInfo);
    }

    public Reader retrieveArticleHeader() throws IOException {
        return retrieveArticleHeader((String) null);
    }

    @Deprecated
    public Reader retrieveArticleHeader(int i) throws IOException {
        return retrieveArticleHeader(i);
    }

    @Deprecated
    public Reader retrieveArticleHeader(int i, ArticlePointer articlePointer) throws IOException {
        ArticleInfo __ap2ai = __ap2ai(articlePointer);
        BufferedReader retrieveArticleHeader = retrieveArticleHeader(i, __ap2ai);
        __ai2ap(__ap2ai, articlePointer);
        return retrieveArticleHeader;
    }

    public Reader retrieveArticleHeader(String str) throws IOException {
        return retrieveArticleHeader(str, (ArticleInfo) null);
    }

    @Deprecated
    public Reader retrieveArticleHeader(String str, ArticlePointer articlePointer) throws IOException {
        ArticleInfo __ap2ai = __ap2ai(articlePointer);
        BufferedReader retrieveArticleHeader = retrieveArticleHeader(str, __ap2ai);
        __ai2ap(__ap2ai, articlePointer);
        return retrieveArticleHeader;
    }

    public BufferedReader retrieveArticleInfo(long j) throws IOException {
        return __retrieveArticleInfo(Long.toString(j));
    }

    public BufferedReader retrieveArticleInfo(long j, long j2) throws IOException {
        return __retrieveArticleInfo(j + "-" + j2);
    }

    @Deprecated
    public Reader retrieveArticleInfo(int i) throws IOException {
        return retrieveArticleInfo(i);
    }

    @Deprecated
    public Reader retrieveArticleInfo(int i, int i2) throws IOException {
        return retrieveArticleInfo(i, i2);
    }

    public BufferedReader retrieveHeader(String str, long j) throws IOException {
        return __retrieveHeader(str, Long.toString(j));
    }

    public BufferedReader retrieveHeader(String str, long j, long j2) throws IOException {
        return __retrieveHeader(str, j + "-" + j2);
    }

    @Deprecated
    public Reader retrieveHeader(String str, int i) throws IOException {
        return retrieveHeader(str, i);
    }

    @Deprecated
    public Reader retrieveHeader(String str, int i, int i2) throws IOException {
        return retrieveHeader(str, i, i2);
    }

    @Deprecated
    public boolean selectArticle(int i) throws IOException {
        return selectArticle(i);
    }

    @Deprecated
    public boolean selectArticle(int i, ArticlePointer articlePointer) throws IOException {
        ArticleInfo __ap2ai = __ap2ai(articlePointer);
        boolean selectArticle = selectArticle(i, __ap2ai);
        __ai2ap(__ap2ai, articlePointer);
        return selectArticle;
    }

    public boolean selectArticle(long j) throws IOException {
        return selectArticle(j, (ArticleInfo) null);
    }

    public boolean selectArticle(long j, ArticleInfo articleInfo) throws IOException {
        boolean z;
        if (!NNTPReply.isPositiveCompletion(stat(j))) {
            z = false;
        } else {
            if (articleInfo != null) {
                __parseArticlePointer(getReplyString(), articleInfo);
            }
            z = true;
        }
        return z;
    }

    public boolean selectArticle(String str) throws IOException {
        return selectArticle(str, (ArticleInfo) null);
    }

    public boolean selectArticle(String str, ArticleInfo articleInfo) throws IOException {
        boolean z = false;
        if (str == null ? NNTPReply.isPositiveCompletion(stat()) : NNTPReply.isPositiveCompletion(stat(str))) {
            if (articleInfo != null) {
                __parseArticlePointer(getReplyString(), articleInfo);
            }
            z = true;
        }
        return z;
    }

    @Deprecated
    public boolean selectArticle(String str, ArticlePointer articlePointer) throws IOException {
        ArticleInfo __ap2ai = __ap2ai(articlePointer);
        boolean selectArticle = selectArticle(str, __ap2ai);
        __ai2ap(__ap2ai, articlePointer);
        return selectArticle;
    }

    public boolean selectArticle(ArticleInfo articleInfo) throws IOException {
        return selectArticle((String) null, articleInfo);
    }

    @Deprecated
    public boolean selectArticle(ArticlePointer articlePointer) throws IOException {
        ArticleInfo __ap2ai = __ap2ai(articlePointer);
        boolean selectArticle = selectArticle(__ap2ai);
        __ai2ap(__ap2ai, articlePointer);
        return selectArticle;
    }

    public boolean selectNewsgroup(String str) throws IOException {
        return selectNewsgroup(str, null);
    }

    public boolean selectNewsgroup(String str, NewsgroupInfo newsgroupInfo) throws IOException {
        boolean z;
        if (!NNTPReply.isPositiveCompletion(group(str))) {
            z = false;
        } else {
            if (newsgroupInfo != null) {
                __parseGroupReply(getReplyString(), newsgroupInfo);
            }
            z = true;
        }
        return z;
    }

    public boolean selectNextArticle() throws IOException {
        return selectNextArticle((ArticleInfo) null);
    }

    public boolean selectNextArticle(ArticleInfo articleInfo) throws IOException {
        boolean z;
        if (!NNTPReply.isPositiveCompletion(next())) {
            z = false;
        } else {
            if (articleInfo != null) {
                __parseArticlePointer(getReplyString(), articleInfo);
            }
            z = true;
        }
        return z;
    }

    @Deprecated
    public boolean selectNextArticle(ArticlePointer articlePointer) throws IOException {
        ArticleInfo __ap2ai = __ap2ai(articlePointer);
        boolean selectNextArticle = selectNextArticle(__ap2ai);
        __ai2ap(__ap2ai, articlePointer);
        return selectNextArticle;
    }

    public boolean selectPreviousArticle() throws IOException {
        return selectPreviousArticle((ArticleInfo) null);
    }

    public boolean selectPreviousArticle(ArticleInfo articleInfo) throws IOException {
        boolean z;
        if (!NNTPReply.isPositiveCompletion(last())) {
            z = false;
        } else {
            if (articleInfo != null) {
                __parseArticlePointer(getReplyString(), articleInfo);
            }
            z = true;
        }
        return z;
    }

    @Deprecated
    public boolean selectPreviousArticle(ArticlePointer articlePointer) throws IOException {
        ArticleInfo __ap2ai = __ap2ai(articlePointer);
        boolean selectPreviousArticle = selectPreviousArticle(__ap2ai);
        __ai2ap(__ap2ai, articlePointer);
        return selectPreviousArticle;
    }
}
