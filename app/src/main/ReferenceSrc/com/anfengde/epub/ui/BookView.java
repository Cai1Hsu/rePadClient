package com.anfengde.epub.ui;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.BitmapDrawable;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Handler;
import android.speech.tts.TextToSpeech;
import android.text.ClipboardManager;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.widget.AdapterView;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.PopupWindow;
import android.widget.Toast;
import com.anfengde.epub.EPubChapter;
import com.anfengde.epub.EPubReadingStatus;
import com.anfengde.epub.core.EPubDriver;
import com.anfengde.epub.core.value.Constants;
import com.anfengde.epub.core.value.ResourceFiles;
import com.anfengde.epub.db.DBBooks;
import com.anfengde.epub.db.DBDriver;
import com.google.ads.AdRequest;
import com.google.ads.AdSize;
import com.google.ads.AdView;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.apache.commons.net.tftp.TFTP;
import org.apache.http.HttpHost;

@SuppressLint({"NewApi"})
/* loaded from: classes.jar:com/anfengde/epub/ui/BookView.class */
public class BookView extends LinearLayout implements TextToSpeech.OnInitListener {
    private static final String LOGTAG = "BookView";
    private static final Boolean allowToModifyAd = false;
    private AdView adView;
    private Context afd_curContext;
    private EPubDriver afd_epubDriver;
    private FrameLayout afd_tableContentView;
    private EPubWebView afd_webView;
    private int androidVersion;
    private ListView bookListView;
    private String bookPath;
    private int bookSize;
    private int chapterSize;
    private String clickBk;
    private int current_chapter;
    private int current_percent;
    private PopupWindow mBooksWindow;
    private List<Map<String, Object>> mDataList;
    private int pIndex;
    private int sIndex;
    private int size;
    private int totalPages;
    private TextToSpeech tts;
    private Boolean displayAd = true;
    private String adUnitId = "a1502c86e3f3fcf";
    private String afd_cachePath = "";
    private int currentPageNum = 1;
    private String mDir = "/sdcard";
    private Handler handler = new Handler();
    private final String errorMessage = "Download Error!";
    private boolean downloadCancel = false;
    private boolean isDownloading = false;

    /* loaded from: classes.jar:com/anfengde/epub/ui/BookView$DownloadFilesTask.class */
    private class DownloadFilesTask extends AsyncTask<String, Integer, String> {
        private DownloadFilesTask() {
            BookView.this = r4;
        }

        /* synthetic */ DownloadFilesTask(BookView bookView, DownloadFilesTask downloadFilesTask) {
            this();
        }

        public String doInBackground(String... strArr) {
            String str;
            if (BookView.this.isDownloading) {
                str = "Downloading!";
            } else {
                BookView.this.isDownloading = true;
                String str2 = BookView.this.afd_cachePath;
                if (!BookView.this.isOnline()) {
                    str = "Download Error!";
                } else {
                    String str3 = strArr[0];
                    if (!str3.contains("/") || !str3.substring(0, 4).equals(HttpHost.DEFAULT_SCHEME_NAME)) {
                        str = "Download Error!";
                    } else {
                        String[] split = str3.split("/");
                        String str4 = split[split.length - 1];
                        int length = str4.length();
                        try {
                            Log.v("ContentLength", "ContentLength:fileLength");
                            URL url = new URL(String.valueOf(str3.substring(0, str3.length() - length)) + URLEncoder.encode(str4, "UTF-8").replace("+", "%20"));
                            HttpURLConnection.setFollowRedirects(false);
                            HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
                            httpURLConnection.setConnectTimeout(TFTP.DEFAULT_TIMEOUT);
                            int contentLength = httpURLConnection.getContentLength();
                            Log.v("ContentLength", "ContentLength:" + contentLength);
                            if (httpURLConnection.getResponseCode() != 200 || contentLength < 1000) {
                                str = "Download Error!";
                            } else {
                                str = String.valueOf(str2) + "/" + str4;
                                File file = new File(str);
                                if (file.exists()) {
                                    file.delete();
                                }
                                BookView.this.downloadCancel = false;
                                BufferedInputStream bufferedInputStream = new BufferedInputStream(url.openStream());
                                new File(str2).mkdir();
                                file.createNewFile();
                                FileOutputStream fileOutputStream = new FileOutputStream(file);
                                try {
                                    byte[] bArr = new byte[4096];
                                    long j = 0;
                                    while (true) {
                                        int read = bufferedInputStream.read(bArr);
                                        if (read != -1) {
                                            j += read;
                                            publishProgress(Integer.valueOf((int) ((100 * j) / contentLength)));
                                            fileOutputStream.write(bArr, 0, read);
                                            if (BookView.this.downloadCancel) {
                                                publishProgress(0);
                                                fileOutputStream.flush();
                                                fileOutputStream.close();
                                                bufferedInputStream.close();
                                                file.delete();
                                                str = "Cancel Download!";
                                                break;
                                            }
                                        } else {
                                            fileOutputStream.flush();
                                            fileOutputStream.close();
                                            bufferedInputStream.close();
                                            break;
                                        }
                                    }
                                } catch (Exception e) {
                                    str = "Download Error!";
                                    return str;
                                }
                            }
                        } catch (Exception e2) {
                        }
                    }
                }
            }
            return str;
        }

        public void onPostExecute(String str) {
            BookView.this.afd_webView.loadUrl("javascript:setLoadingButtonStatus(0)");
            if (str.equals("Cancel Download!")) {
                BookView.this.isDownloading = false;
            } else if (str.equals("Downloading!")) {
            } else {
                if (str.equals("Download Error!")) {
                    BookView.this.isDownloading = false;
                    Toast.makeText(BookView.this.afd_curContext, str, 0).show();
                } else if (!BookView.this.importBook(str)) {
                } else {
                    BookView.this.isDownloading = false;
                    BookView.this.createBookshelf();
                    Toast.makeText(BookView.this.afd_curContext, "Download Success!", 0).show();
                }
            }
        }

        public void onProgressUpdate(Integer... numArr) {
            BookView.this.afd_webView.loadUrl("javascript:downloadProgress(" + numArr[0] + ")");
        }
    }

    /* loaded from: classes.jar:com/anfengde/epub/ui/BookView$JavaScriptInterface.class */
    public class JavaScriptInterface {
        public JavaScriptInterface() {
            BookView.this = r4;
        }

        public void addBooks() {
            BookView.this.showAddbooksWindow();
        }

        public void back() {
            BookView.this.openChapter(BookView.this.current_chapter, BookView.this.afd_webView);
        }

        public void bkOpenChapter(int i, int i2, int i3) {
            BookView.this.current_chapter = i;
            BookView.this.pIndex = i2;
            BookView.this.sIndex = i3;
            BookView.this.clickBk = "clickBk";
            BookView.this.openChapter(BookView.this.current_chapter, BookView.this.afd_webView);
        }

        public void copySelectionText(String str) {
            ((ClipboardManager) BookView.this.afd_curContext.getSystemService("clipboard")).setText(str);
            Toast.makeText(BookView.this.afd_curContext, "Text copied to clipboard", 50).show();
        }

        public void currentReadingData(int i, int i2) {
            BookView.this.currentPageNum = i;
            BookView.this.totalPages = i2;
            BookView.this.current_percent = (BookView.this.currentPageNum * 10000) / BookView.this.totalPages;
        }

        public void deleteBooks(String str) {
            DBDriver dBDriver = new DBDriver(BookView.this.afd_curContext);
            List<DBBooks> allBooks = dBDriver.getAllBooks();
            for (String str2 : str.split("afd")) {
                DBBooks dBBooks = allBooks.get(Integer.valueOf(str2).intValue());
                dBDriver.deleteBook(dBBooks);
                int openEPubBook = BookView.this.afd_epubDriver.clsEPub.openEPubBook(dBBooks.getBookpath());
                if (openEPubBook == 0) {
                    BookView.this.afd_epubDriver.clsEPub.cleanEPubBookCache(openEPubBook);
                }
            }
            dBDriver.close();
            BookView.this.createBookshelf();
            BookView.this.afd_webView.loadUrl("javascript:$('.afd_selectBg').show()");
        }

        public void downloadBook(String str) {
            new DownloadFilesTask(BookView.this, null).execute(str);
        }

        public void downloadCancel() {
            BookView.this.downloadCancel = true;
        }

        public void exit() {
            BookView.this.exitApp();
        }

        public void getAllBooks() {
            BookView.this.createBookshelf();
        }

        public void getChapter() {
            int size = BookView.this.afd_epubDriver.mToc.getChapterList().size();
            for (int i = 0; i < size; i++) {
                BookView.this.afd_webView.loadUrl("javascript:getChapter('" + BookView.this.jsStringEscape(BookView.this.afd_epubDriver.mToc.getChapterList().get(i).title) + "'," + BookView.this.afd_epubDriver.mToc.getChapterList().get(i).level + "," + i + "," + BookView.this.current_chapter + ")");
            }
        }

        public void jsImportBook(String str) {
            Toast.makeText(BookView.this.afd_curContext, "Importing...", 1).show();
            if (!BookView.this.importBook(str)) {
                return;
            }
            BookView.this.createBookshelf();
        }

        public void jsOpenChapter(int i, String str) {
            if (str.equals("preceding")) {
                BookView.this.current_percent = 10000;
            } else {
                BookView.this.current_percent = 0;
            }
            BookView.this.current_chapter = i;
            BookView.this.openChapter(BookView.this.current_chapter, BookView.this.afd_webView);
        }

        public void message(String str) {
            Toast.makeText(BookView.this.afd_curContext, str, 50).show();
        }

        public void openBook(String str) {
            Toast.makeText(BookView.this.afd_curContext, "Opening book...", 1).show();
            BookView.this.afd_epubDriver.mToc.clearChapter();
            BookView.this.bookPath = str;
            if (BookView.this.errorMessage(BookView.this.afd_epubDriver.openBook(BookView.this.bookPath))) {
                return;
            }
            BookView.this.readReadingStatus();
            BookView.this.openChapter(BookView.this.current_chapter, BookView.this.afd_webView);
        }

        public void openBookshelf() {
            BookView.this.saveStatusData();
            BookView.this.openShelf();
        }

        public void resizePage() {
            BookView.this.afd_webView.loadUrl("javascript:getAndroidVersion(" + BookView.this.androidVersion + ");");
            BookView.this.afd_webView.loadUrl("javascript:getBookData(" + BookView.this.size + "," + BookView.this.chapterSize + "," + BookView.this.bookSize + "," + BookView.this.current_chapter + "," + BookView.this.afd_epubDriver.mToc.getTotalSize() + ",'" + BookView.this.jsStringEscape(BookView.this.afd_epubDriver.mBook.metadata.identifier) + "','" + BookView.this.afd_cachePath + "','" + BookView.this.jsStringEscape(BookView.this.afd_epubDriver.mBook.metadata.title) + "');");
            BookView.this.afd_webView.loadUrl("javascript:resizePage(" + BookView.this.current_percent + "," + BookView.this.pIndex + "," + BookView.this.sIndex + ",'" + BookView.this.clickBk + "');");
            BookView.this.clickBk = "";
        }

        public void shareText(String str) {
            Intent intent = new Intent();
            intent.setAction("android.intent.action.SEND");
            intent.putExtra("android.intent.extra.TEXT", str);
            intent.setType("text/plain");
            BookView.this.afd_curContext.startActivity(Intent.createChooser(intent, BookView.this.getResources().getText(R.string.send_to)));
        }

        public void sliderBarListener(float f) {
            int i = 0;
            int i2 = 0;
            int i3 = 0;
            while (true) {
                if (i3 >= BookView.this.afd_epubDriver.mToc.getTotalSize()) {
                    break;
                }
                i2 = (int) ((BookView.this.bookSize * f) - i);
                i += BookView.this.afd_epubDriver.mToc.getChapter(i3).csize;
                if (((int) ((BookView.this.bookSize * f) - i)) < 0) {
                    BookView.this.current_chapter = i3;
                    break;
                }
                i3++;
            }
            BookView.this.current_percent = (int) (((i2 * 1.0d) / BookView.this.afd_epubDriver.mToc.getChapter(BookView.this.current_chapter).csize) * 10000.0d);
            BookView.this.openChapter(BookView.this.current_chapter, BookView.this.afd_webView);
        }

        public void textToSpeak(String str) {
            BookView.this.speaking(str);
        }

        public void ttsSetting() {
            Intent intent = new Intent();
            intent.setAction("com.android.settings.TTS_SETTINGS");
            intent.setFlags(268435456);
            BookView.this.afd_curContext.startActivity(intent);
        }
    }

    public BookView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setOrientation(1);
        this.afd_curContext = context;
        this.tts = new TextToSpeech(context, this);
        this.afd_webView = new EPubWebView(context);
        ((Activity) context).getWindowManager().getDefaultDisplay().getMetrics(new DisplayMetrics());
        ((LayoutInflater) context.getSystemService("layout_inflater")).inflate(R.layout.afd_bookview, this);
        init();
    }

    private void closeBook() {
        this.afd_epubDriver.closeBook();
        this.afd_epubDriver.cleanUp();
    }

    private void copyBooksToSdcard(String str) {
        String str2 = "/mnt/sdcard/epub/" + str;
        File file = new File("/mnt/sdcard/epub");
        if (!file.exists()) {
            file.mkdir();
        }
        File file2 = new File(str2);
        if (!file2.exists()) {
            try {
                file2.createNewFile();
                InputStream open = this.afd_curContext.getAssets().open("books/" + str);
                byte[] bArr = new byte[open.available()];
                open.read(bArr);
                open.close();
                FileOutputStream fileOutputStream = new FileOutputStream(file2);
                fileOutputStream.write(bArr);
                fileOutputStream.close();
                importBook(str2);
            } catch (Exception e) {
                Log.e("copy error", "can not copy the book to sdcard!");
            }
        }
    }

    public void createBookshelf() {
        this.afd_webView.loadUrl("javascript:$('#afd_books').empty();");
        DBDriver dBDriver = new DBDriver(this.afd_curContext);
        List<DBBooks> allBooks = dBDriver.getAllBooks();
        dBDriver.close();
        for (int i = 0; i < allBooks.size(); i++) {
            String jsStringEscape = jsStringEscape(allBooks.get(i).getName());
            String jsStringEscape2 = jsStringEscape(allBooks.get(i).getCoverimage());
            String str = jsStringEscape2;
            String str2 = jsStringEscape;
            if (!jsStringEscape(allBooks.get(i).getCoverimage()).equals(Constants.COVERIMG_PATH)) {
                if (!new File(jsStringEscape(allBooks.get(i).getCoverimage())).exists()) {
                    str = Constants.COVERIMG_PATH;
                    str2 = jsStringEscape;
                } else {
                    str2 = " ";
                    str = jsStringEscape2;
                }
            }
            this.afd_webView.loadUrl("javascript:creatBookShelf('" + jsStringEscape(allBooks.get(i).getIdentifier()) + "','" + str2 + "','" + jsStringEscape(allBooks.get(i).getAuthor()) + "','" + str + "','" + jsStringEscape(allBooks.get(i).getBookpath()) + "');");
        }
    }

    public void doAdMob() {
        this.adView = new AdView((Activity) this.afd_curContext, AdSize.BANNER, this.adUnitId);
        addView((View) this.adView, 0, (ViewGroup.LayoutParams) new LinearLayout.LayoutParams(-1, -2));
        this.adView.loadAd(new AdRequest());
    }

    public boolean errorMessage(int i) {
        boolean z;
        if (i <= 0) {
            String errorMessage = this.afd_epubDriver.getErrorMessage(i);
            String str = errorMessage;
            if (errorMessage == null) {
                str = "Unknown error";
            }
            Toast.makeText(this.afd_curContext, str, 50).show();
            z = true;
        } else {
            z = false;
        }
        return z;
    }

    public void exitApp() {
        this.afd_epubDriver.cleanUp();
        this.tts.shutdown();
        this.afd_webView.destroy();
        closeBook();
        ((Activity) this.afd_curContext).finish();
    }

    public List<Map<String, Object>> getData() {
        ArrayList arrayList = new ArrayList();
        File file = new File(this.mDir);
        File[] listFiles = file.listFiles();
        if (!this.mDir.equals("/")) {
            HashMap hashMap = new HashMap();
            hashMap.put("title", "Back to ../");
            hashMap.put("info", file.getParent());
            hashMap.put("img", Integer.valueOf(R.drawable.ex_folder));
            arrayList.add(hashMap);
        }
        if (listFiles != null) {
            for (int i = 0; i < listFiles.length; i++) {
                HashMap hashMap2 = new HashMap();
                hashMap2.put("title", listFiles[i].getName());
                hashMap2.put("info", listFiles[i].getPath());
                if (listFiles[i].isDirectory()) {
                    hashMap2.put("img", Integer.valueOf(R.drawable.ex_folder));
                } else {
                    String path = listFiles[i].getPath();
                    int length = path.length();
                    if (length > 4 && path.substring(length - 4, length).equals("epub")) {
                        hashMap2.put("img", Integer.valueOf(R.drawable.ex_doc));
                    }
                }
                arrayList.add(hashMap2);
            }
        }
        return arrayList;
    }

    private void getInnerBooks() {
        try {
            String[] list = this.afd_curContext.getAssets().list("books");
            for (int i = 0; i < list.length; i++) {
                String str = list[i];
                if (str.length() > 5 && str.substring(str.length() - 5).equals(".epub")) {
                    copyBooksToSdcard(list[i]);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public boolean importBook(String str) {
        boolean z;
        if (this.afd_epubDriver.openBook(str) == 0) {
            Toast.makeText(this.afd_curContext, "Import book error!", 50).show();
            z = false;
        } else {
            DBBooks dBBooks = new DBBooks();
            dBBooks.setIdentifier(this.afd_epubDriver.mBook.metadata.identifier);
            dBBooks.setAuthor(this.afd_epubDriver.mBook.metadata.creator);
            dBBooks.setCoverimage(this.afd_epubDriver.getCoverImg());
            dBBooks.setName(this.afd_epubDriver.mBook.metadata.title);
            dBBooks.setBookpath(str);
            DBDriver dBDriver = new DBDriver(this.afd_curContext);
            dBDriver.addBook(dBBooks);
            dBDriver.close();
            z = true;
        }
        return z;
    }

    private void init() {
        setFocusable(true);
        requestFocus();
        this.afd_tableContentView = (FrameLayout) findViewById(R.id.afd_contentLayout);
        this.afd_tableContentView.addView(this.afd_webView.getLayout());
        this.afd_webView.addJavascriptInterface(new JavaScriptInterface(), "Android");
    }

    public boolean isOnline() {
        NetworkInfo activeNetworkInfo = ((ConnectivityManager) this.afd_curContext.getSystemService("connectivity")).getActiveNetworkInfo();
        return activeNetworkInfo != null && activeNetworkInfo.isConnectedOrConnecting();
    }

    public void openChapter(int i, WebView webView) {
        this.afd_webView.backReadingPage = false;
        EPubChapter chapter = this.afd_epubDriver.mToc.getChapter(i);
        this.bookSize = this.afd_epubDriver.getBookSize();
        while (true) {
            if (this.bookSize != 0 && chapter.csize != 0) {
                break;
            }
            try {
                Thread.sleep(50L);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            this.afd_epubDriver.mToc.clearChapter();
            this.afd_epubDriver.getToc(this.afd_epubDriver.handle);
            chapter = this.afd_epubDriver.mToc.getChapter(i);
            this.bookSize = this.afd_epubDriver.getBookSize();
        }
        String str = String.valueOf(this.afd_epubDriver.mBook.getPath()) + "/" + chapter.href;
        this.size = 0;
        for (int i2 = 0; i2 < i; i2++) {
            this.size += this.afd_epubDriver.mToc.getChapter(i2).csize;
        }
        this.chapterSize = chapter.csize;
        this.afd_webView.loadDataWithString(str);
        this.afd_webView.onBookshelf = false;
    }

    public void readReadingStatus() {
        EPubReadingStatus ePubReadingStatus = new EPubReadingStatus();
        this.afd_epubDriver.clsEPub.getEPubReadingStatus(ePubReadingStatus, this.afd_epubDriver.handle);
        this.current_chapter = ePubReadingStatus.current_chapter;
        this.current_percent = ePubReadingStatus.current_percent;
    }

    public void saveStatusData() {
        EPubReadingStatus ePubReadingStatus = new EPubReadingStatus();
        ePubReadingStatus.current_chapter = this.current_chapter;
        ePubReadingStatus.current_percent = this.current_percent;
        this.afd_epubDriver.clsEPub.updateEPubReadingStatus(ePubReadingStatus, this.afd_epubDriver.handle);
    }

    public void showAddbooksWindow() {
        this.mDataList = getData();
        View inflate = LayoutInflater.from(this.afd_curContext).inflate(R.layout.afd_books_list, (ViewGroup) null);
        this.bookListView = (ListView) inflate.findViewById(R.id.afd_book_list);
        this.bookListView.setAdapter((ListAdapter) new BookListAdapter(this.afd_curContext, this.mDataList));
        this.mBooksWindow = new PopupWindow(inflate, -1, -1, true);
        this.mBooksWindow.setOutsideTouchable(true);
        this.mBooksWindow.setBackgroundDrawable(new BitmapDrawable());
        this.mBooksWindow.showAtLocation(this, 17, 0, 0);
        this.bookListView.requestFocus();
        this.bookListView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.anfengde.epub.ui.BookView.2
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                if (((Integer) ((Map) BookView.this.mDataList.get(i)).get("img")).intValue() != R.drawable.ex_folder) {
                    BookView.this.mBooksWindow.dismiss();
                    BookView.this.afd_webView.loadUrl("javascript:$('#filepath').attr('value','" + ((String) ((Map) BookView.this.mDataList.get(i)).get("info")) + "')");
                    return;
                }
                BookView.this.mDir = (String) ((Map) BookView.this.mDataList.get(i)).get("info");
                BookView.this.mDataList = BookView.this.getData();
                BookView.this.bookListView.setAdapter((ListAdapter) new BookListAdapter(BookView.this.afd_curContext, BookView.this.mDataList));
            }
        });
    }

    public void speaking(String str) {
        this.tts.speak(str, 0, null);
    }

    public void customizeAdMob(Boolean bool, String str) {
        if (!allowToModifyAd.booleanValue()) {
            Toast.makeText(this.afd_curContext, "The free version doesn't support to customize the AdMob!", 1).show();
            return;
        }
        this.displayAd = bool;
        this.adUnitId = str;
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        boolean dispatchKeyEvent;
        if (keyEvent.getAction() != 0 || keyEvent.getKeyCode() != 4) {
            dispatchKeyEvent = super.dispatchKeyEvent(keyEvent);
        } else if (this.afd_webView.inCustomView()) {
            this.afd_webView.hideCustomView();
            dispatchKeyEvent = true;
        } else if (this.afd_webView.touchOnUrl) {
            openChapter(this.current_chapter, this.afd_webView);
            dispatchKeyEvent = true;
        } else if (this.afd_webView.touchOnUrl || this.afd_webView.onBookshelf) {
            exitApp();
            dispatchKeyEvent = true;
        } else {
            dispatchKeyEvent = true;
            if (!this.afd_webView.isInSelectionMode()) {
                saveStatusData();
                openShelf();
                dispatchKeyEvent = true;
            }
        }
        return dispatchKeyEvent;
    }

    public void initBook() {
        if (this.displayAd.booleanValue()) {
            this.handler.postDelayed(new Runnable() { // from class: com.anfengde.epub.ui.BookView.1
                @Override // java.lang.Runnable
                public void run() {
                    BookView.this.doAdMob();
                }
            }, 10000L);
        }
        this.afd_epubDriver = new EPubDriver(this.afd_cachePath);
        int initEPubJNI = this.afd_epubDriver.initEPubJNI();
        int i = initEPubJNI;
        if (initEPubJNI == -2) {
            this.afd_epubDriver.cleanUp();
            this.afd_epubDriver = null;
            this.afd_epubDriver = new EPubDriver(this.afd_cachePath);
            i = this.afd_epubDriver.initEPubJNI();
        }
        if (i <= 0 && i != -2) {
            Toast.makeText(this.afd_curContext, "Init Error!", 50).show();
            closeBook();
            ((Activity) this.afd_curContext).finish();
        }
        this.androidVersion = Build.VERSION.SDK_INT;
        ResourceFiles.copyResourceFiles(this.afd_cachePath, this.afd_curContext);
        getInnerBooks();
    }

    public String jsStringEscape(String str) {
        return str.replace("''", "'").replace("'", "\\'");
    }

    @Override // android.speech.tts.TextToSpeech.OnInitListener
    public void onInit(int i) {
        if (i != 0) {
            Log.e("TTS", "Initilization Failed");
            return;
        }
        int language = this.tts.setLanguage(Locale.US);
        if (language != -1 && language != -2) {
            return;
        }
        Log.e("TTS", "Language is not supported");
    }

    public void openBookFromFileExplorer(Intent intent) {
        if (!"android.intent.action.VIEW".equals(intent.getAction()) || !importBook(intent.getData().getPath())) {
            return;
        }
        this.current_percent = 0;
        this.current_chapter = 0;
        this.afd_epubDriver.mToc.clearChapter();
        this.afd_epubDriver.getToc(this.afd_epubDriver.handle);
        this.bookSize = 0;
        openChapter(this.current_chapter, this.afd_webView);
    }

    public void openShelf() {
        this.afd_webView.loadDataWithURL(String.valueOf(this.afd_cachePath) + "/html/index.html");
        this.afd_webView.onBookshelf = true;
    }

    public void setPath(String str) {
        this.afd_cachePath = str;
    }

    public void viewDestroy() {
        this.tts.shutdown();
        ((Activity) this.afd_curContext).finish();
    }
}
