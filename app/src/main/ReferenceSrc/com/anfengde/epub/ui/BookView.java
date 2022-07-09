package com.anfengde.epub.ui;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.AssetManager;
import android.graphics.drawable.BitmapDrawable;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
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
import java.io.OutputStream;
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
/* loaded from: classes.dex */
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

    public BookView(Context context, AttributeSet attrs) {
        super(context, attrs);
        setOrientation(1);
        this.afd_curContext = context;
        this.tts = new TextToSpeech(context, this);
        this.afd_webView = new EPubWebView(context);
        DisplayMetrics metrics = new DisplayMetrics();
        ((Activity) context).getWindowManager().getDefaultDisplay().getMetrics(metrics);
        LayoutInflater inflater = (LayoutInflater) context.getSystemService("layout_inflater");
        inflater.inflate(R.layout.afd_bookview, this);
        init();
    }

    public void customizeAdMob(Boolean display, String id) {
        if (allowToModifyAd.booleanValue()) {
            this.displayAd = display;
            this.adUnitId = id;
            return;
        }
        Toast.makeText(this.afd_curContext, "The free version doesn't support to customize the AdMob!", 1).show();
    }

    public void doAdMob() {
        this.adView = new AdView((Activity) this.afd_curContext, AdSize.BANNER, this.adUnitId);
        addView((View) this.adView, 0, (ViewGroup.LayoutParams) new LinearLayout.LayoutParams(-1, -2));
        AdRequest adRequest = new AdRequest();
        this.adView.loadAd(adRequest);
    }

    public void setPath(String argCachePath) {
        this.afd_cachePath = argCachePath;
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
        int ret = this.afd_epubDriver.initEPubJNI();
        if (ret == -2) {
            this.afd_epubDriver.cleanUp();
            this.afd_epubDriver = null;
            this.afd_epubDriver = new EPubDriver(this.afd_cachePath);
            ret = this.afd_epubDriver.initEPubJNI();
        }
        if (ret <= 0 && ret != -2) {
            Toast.makeText(this.afd_curContext, "Init Error!", 50).show();
            closeBook();
            ((Activity) this.afd_curContext).finish();
        }
        this.androidVersion = Build.VERSION.SDK_INT;
        ResourceFiles.copyResourceFiles(this.afd_cachePath, this.afd_curContext);
        getInnerBooks();
    }

    public void openShelf() {
        this.afd_webView.loadDataWithURL(String.valueOf(this.afd_cachePath) + "/html/index.html");
        this.afd_webView.onBookshelf = true;
    }

    public void openBookFromFileExplorer(Intent intent) {
        String event = intent.getAction();
        if ("android.intent.action.VIEW".equals(event)) {
            Uri uri = intent.getData();
            String filePath = uri.getPath();
            if (importBook(filePath)) {
                this.current_percent = 0;
                this.current_chapter = 0;
                this.afd_epubDriver.mToc.clearChapter();
                this.afd_epubDriver.getToc(this.afd_epubDriver.handle);
                this.bookSize = 0;
                openChapter(this.current_chapter, this.afd_webView);
            }
        }
    }

    private void closeBook() {
        this.afd_epubDriver.closeBook();
        this.afd_epubDriver.cleanUp();
    }

    private void init() {
        setFocusable(true);
        requestFocus();
        this.afd_tableContentView = (FrameLayout) findViewById(R.id.afd_contentLayout);
        this.afd_tableContentView.addView(this.afd_webView.getLayout());
        this.afd_webView.addJavascriptInterface(new JavaScriptInterface(), "Android");
    }

    public void openChapter(int chapNo, WebView webView) {
        this.afd_webView.backReadingPage = false;
        EPubChapter chapter = this.afd_epubDriver.mToc.getChapter(chapNo);
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
            chapter = this.afd_epubDriver.mToc.getChapter(chapNo);
            this.bookSize = this.afd_epubDriver.getBookSize();
        }
        String subChapterPath = chapter.href;
        String abChapterPath = String.valueOf(this.afd_epubDriver.mBook.getPath()) + "/" + subChapterPath;
        this.size = 0;
        for (int i = 0; i < chapNo; i++) {
            this.size += this.afd_epubDriver.mToc.getChapter(i).csize;
        }
        this.chapterSize = chapter.csize;
        this.afd_webView.loadDataWithString(abChapterPath);
        this.afd_webView.onBookshelf = false;
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchKeyEvent(KeyEvent event) {
        if (event.getAction() == 0 && event.getKeyCode() == 4) {
            if (this.afd_webView.inCustomView()) {
                this.afd_webView.hideCustomView();
                return true;
            } else if (this.afd_webView.touchOnUrl) {
                openChapter(this.current_chapter, this.afd_webView);
                return true;
            } else if (!this.afd_webView.touchOnUrl && !this.afd_webView.onBookshelf) {
                if (this.afd_webView.isInSelectionMode()) {
                    return true;
                }
                saveStatusData();
                openShelf();
                return true;
            } else {
                exitApp();
                return true;
            }
        }
        return super.dispatchKeyEvent(event);
    }

    public void exitApp() {
        this.afd_epubDriver.cleanUp();
        this.tts.shutdown();
        this.afd_webView.destroy();
        closeBook();
        ((Activity) this.afd_curContext).finish();
    }

    public void viewDestroy() {
        this.tts.shutdown();
        ((Activity) this.afd_curContext).finish();
    }

    /* loaded from: classes.dex */
    public class JavaScriptInterface {
        public JavaScriptInterface() {
            BookView.this = r1;
        }

        public void exit() {
            BookView.this.exitApp();
        }

        public void openBookshelf() {
            BookView.this.saveStatusData();
            BookView.this.openShelf();
        }

        public void jsOpenChapter(int i, String order) {
            if (order.equals("preceding")) {
                BookView.this.current_percent = 10000;
            } else {
                BookView.this.current_percent = 0;
            }
            BookView.this.current_chapter = i;
            BookView.this.openChapter(BookView.this.current_chapter, BookView.this.afd_webView);
        }

        public void bkOpenChapter(int chapterIndex, int pIndexTemp, int sIndexTemp) {
            BookView.this.current_chapter = chapterIndex;
            BookView.this.pIndex = pIndexTemp;
            BookView.this.sIndex = sIndexTemp;
            BookView.this.clickBk = "clickBk";
            BookView.this.openChapter(BookView.this.current_chapter, BookView.this.afd_webView);
        }

        public void getChapter() {
            int num = BookView.this.afd_epubDriver.mToc.getChapterList().size();
            for (int i = 0; i < num; i++) {
                BookView.this.afd_webView.loadUrl("javascript:getChapter('" + BookView.this.jsStringEscape(BookView.this.afd_epubDriver.mToc.getChapterList().get(i).title) + "'," + BookView.this.afd_epubDriver.mToc.getChapterList().get(i).level + "," + i + "," + BookView.this.current_chapter + ")");
            }
        }

        public void currentReadingData(int num, int pages) {
            BookView.this.currentPageNum = num;
            BookView.this.totalPages = pages;
            BookView.this.current_percent = (BookView.this.currentPageNum * 10000) / BookView.this.totalPages;
        }

        public void back() {
            BookView.this.openChapter(BookView.this.current_chapter, BookView.this.afd_webView);
        }

        public void sliderBarListener(float percent) {
            int tSize = 0;
            int tempSize = 0;
            int i = 0;
            while (true) {
                if (i >= BookView.this.afd_epubDriver.mToc.getTotalSize()) {
                    break;
                }
                tempSize = (int) ((BookView.this.bookSize * percent) - tSize);
                tSize += BookView.this.afd_epubDriver.mToc.getChapter(i).csize;
                if (((int) ((BookView.this.bookSize * percent) - tSize)) < 0) {
                    BookView.this.current_chapter = i;
                    break;
                }
                i++;
            }
            BookView.this.current_percent = (int) (((tempSize * 1.0d) / BookView.this.afd_epubDriver.mToc.getChapter(BookView.this.current_chapter).csize) * 10000.0d);
            BookView.this.openChapter(BookView.this.current_chapter, BookView.this.afd_webView);
        }

        public void resizePage() {
            BookView.this.afd_webView.loadUrl("javascript:getAndroidVersion(" + BookView.this.androidVersion + ");");
            BookView.this.afd_webView.loadUrl("javascript:getBookData(" + BookView.this.size + "," + BookView.this.chapterSize + "," + BookView.this.bookSize + "," + BookView.this.current_chapter + "," + BookView.this.afd_epubDriver.mToc.getTotalSize() + ",'" + BookView.this.jsStringEscape(BookView.this.afd_epubDriver.mBook.metadata.identifier) + "','" + BookView.this.afd_cachePath + "','" + BookView.this.jsStringEscape(BookView.this.afd_epubDriver.mBook.metadata.title) + "');");
            BookView.this.afd_webView.loadUrl("javascript:resizePage(" + BookView.this.current_percent + "," + BookView.this.pIndex + "," + BookView.this.sIndex + ",'" + BookView.this.clickBk + "');");
            BookView.this.clickBk = "";
        }

        public void deleteBooks(String bookString) {
            DBDriver dbdriver = new DBDriver(BookView.this.afd_curContext);
            List<DBBooks> bookArray = dbdriver.getAllBooks();
            String[] index = bookString.split("afd");
            for (String str : index) {
                DBBooks book = bookArray.get(Integer.valueOf(str).intValue());
                dbdriver.deleteBook(book);
                int handle = BookView.this.afd_epubDriver.clsEPub.openEPubBook(book.getBookpath());
                if (handle == 0) {
                    BookView.this.afd_epubDriver.clsEPub.cleanEPubBookCache(handle);
                }
            }
            dbdriver.close();
            BookView.this.createBookshelf();
            BookView.this.afd_webView.loadUrl("javascript:$('.afd_selectBg').show()");
        }

        public void addBooks() {
            BookView.this.showAddbooksWindow();
        }

        public void jsImportBook(String epubBookPath) {
            Toast.makeText(BookView.this.afd_curContext, "Importing...", 1).show();
            if (!BookView.this.importBook(epubBookPath)) {
                return;
            }
            BookView.this.createBookshelf();
        }

        public void getAllBooks() {
            BookView.this.createBookshelf();
        }

        public void openBook(String epubBookPath) {
            Toast.makeText(BookView.this.afd_curContext, "Opening book...", 1).show();
            BookView.this.afd_epubDriver.mToc.clearChapter();
            BookView.this.bookPath = epubBookPath;
            int ret = BookView.this.afd_epubDriver.openBook(BookView.this.bookPath);
            if (BookView.this.errorMessage(ret)) {
                return;
            }
            BookView.this.readReadingStatus();
            BookView.this.openChapter(BookView.this.current_chapter, BookView.this.afd_webView);
        }

        public void downloadBook(String fileUrl) {
            new DownloadFilesTask(BookView.this, null).execute(fileUrl);
        }

        public void copySelectionText(String text) {
            ClipboardManager cm = (ClipboardManager) BookView.this.afd_curContext.getSystemService("clipboard");
            cm.setText(text);
            Toast.makeText(BookView.this.afd_curContext, "Text copied to clipboard", 50).show();
        }

        public void shareText(String text) {
            Intent sendIntent = new Intent();
            sendIntent.setAction("android.intent.action.SEND");
            sendIntent.putExtra("android.intent.extra.TEXT", text);
            sendIntent.setType("text/plain");
            BookView.this.afd_curContext.startActivity(Intent.createChooser(sendIntent, BookView.this.getResources().getText(R.string.send_to)));
        }

        public void message(String text) {
            Toast.makeText(BookView.this.afd_curContext, text, 50).show();
        }

        public void textToSpeak(String text) {
            BookView.this.speaking(text);
        }

        public void downloadCancel() {
            BookView.this.downloadCancel = true;
        }

        public void ttsSetting() {
            Intent intent = new Intent();
            intent.setAction("com.android.settings.TTS_SETTINGS");
            intent.setFlags(268435456);
            BookView.this.afd_curContext.startActivity(intent);
        }
    }

    public boolean importBook(String epubBookPath) {
        int ret = this.afd_epubDriver.openBook(epubBookPath);
        if (ret == 0) {
            Toast.makeText(this.afd_curContext, "Import book error!", 50).show();
            return false;
        }
        DBBooks testBook = new DBBooks();
        testBook.setIdentifier(this.afd_epubDriver.mBook.metadata.identifier);
        testBook.setAuthor(this.afd_epubDriver.mBook.metadata.creator);
        testBook.setCoverimage(this.afd_epubDriver.getCoverImg());
        testBook.setName(this.afd_epubDriver.mBook.metadata.title);
        testBook.setBookpath(epubBookPath);
        DBDriver dbdriver = new DBDriver(this.afd_curContext);
        dbdriver.addBook(testBook);
        dbdriver.close();
        return true;
    }

    public void readReadingStatus() {
        EPubReadingStatus status = new EPubReadingStatus();
        this.afd_epubDriver.clsEPub.getEPubReadingStatus(status, this.afd_epubDriver.handle);
        this.current_chapter = status.current_chapter;
        this.current_percent = status.current_percent;
    }

    public void saveStatusData() {
        EPubReadingStatus status = new EPubReadingStatus();
        status.current_chapter = this.current_chapter;
        status.current_percent = this.current_percent;
        this.afd_epubDriver.clsEPub.updateEPubReadingStatus(status, this.afd_epubDriver.handle);
    }

    public void createBookshelf() {
        this.afd_webView.loadUrl("javascript:$('#afd_books').empty();");
        DBDriver dbdriver = new DBDriver(this.afd_curContext);
        List<DBBooks> bookArray = dbdriver.getAllBooks();
        dbdriver.close();
        for (int i = 0; i < bookArray.size(); i++) {
            String title = jsStringEscape(bookArray.get(i).getName());
            String image = jsStringEscape(bookArray.get(i).getCoverimage());
            if (!jsStringEscape(bookArray.get(i).getCoverimage()).equals(Constants.COVERIMG_PATH)) {
                File file = new File(jsStringEscape(bookArray.get(i).getCoverimage()));
                if (!file.exists()) {
                    image = Constants.COVERIMG_PATH;
                } else {
                    title = " ";
                }
            }
            this.afd_webView.loadUrl("javascript:creatBookShelf('" + jsStringEscape(bookArray.get(i).getIdentifier()) + "','" + title + "','" + jsStringEscape(bookArray.get(i).getAuthor()) + "','" + image + "','" + jsStringEscape(bookArray.get(i).getBookpath()) + "');");
        }
    }

    public boolean errorMessage(int ret) {
        if (ret <= 0) {
            String errorMsg = this.afd_epubDriver.getErrorMessage(ret);
            if (errorMsg == null) {
                errorMsg = "Unknown error";
            }
            Toast.makeText(this.afd_curContext, errorMsg, 50).show();
            return true;
        }
        return false;
    }

    public void showAddbooksWindow() {
        this.mDataList = getData();
        LayoutInflater mLayoutInflater = LayoutInflater.from(this.afd_curContext);
        View booksWindow = mLayoutInflater.inflate(R.layout.afd_books_list, (ViewGroup) null);
        this.bookListView = (ListView) booksWindow.findViewById(R.id.afd_book_list);
        BookListAdapter adapter = new BookListAdapter(this.afd_curContext, this.mDataList);
        this.bookListView.setAdapter((ListAdapter) adapter);
        this.mBooksWindow = new PopupWindow(booksWindow, -1, -1, true);
        this.mBooksWindow.setOutsideTouchable(true);
        this.mBooksWindow.setBackgroundDrawable(new BitmapDrawable());
        this.mBooksWindow.showAtLocation(this, 17, 0, 0);
        this.bookListView.requestFocus();
        this.bookListView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.anfengde.epub.ui.BookView.2
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                if (((Integer) ((Map) BookView.this.mDataList.get(position)).get("img")).intValue() != R.drawable.ex_folder) {
                    BookView.this.mBooksWindow.dismiss();
                    BookView.this.afd_webView.loadUrl("javascript:$('#filepath').attr('value','" + ((String) ((Map) BookView.this.mDataList.get(position)).get("info")) + "')");
                    return;
                }
                BookView.this.mDir = (String) ((Map) BookView.this.mDataList.get(position)).get("info");
                BookView.this.mDataList = BookView.this.getData();
                BookListAdapter adapter2 = new BookListAdapter(BookView.this.afd_curContext, BookView.this.mDataList);
                BookView.this.bookListView.setAdapter((ListAdapter) adapter2);
            }
        });
    }

    public List<Map<String, Object>> getData() {
        List<Map<String, Object>> list = new ArrayList<>();
        File f = new File(this.mDir);
        File[] files = f.listFiles();
        if (!this.mDir.equals("/")) {
            Map<String, Object> map = new HashMap<>();
            map.put("title", "Back to ../");
            map.put("info", f.getParent());
            map.put("img", Integer.valueOf(R.drawable.ex_folder));
            list.add(map);
        }
        if (files != null) {
            for (int i = 0; i < files.length; i++) {
                Map<String, Object> map2 = new HashMap<>();
                map2.put("title", files[i].getName());
                map2.put("info", files[i].getPath());
                if (files[i].isDirectory()) {
                    map2.put("img", Integer.valueOf(R.drawable.ex_folder));
                } else {
                    String tempPath = files[i].getPath();
                    int size = tempPath.length();
                    if (size > 4) {
                        String epub = tempPath.substring(size - 4, size);
                        if (epub.equals("epub")) {
                            map2.put("img", Integer.valueOf(R.drawable.ex_doc));
                        }
                    }
                }
                list.add(map2);
            }
        }
        return list;
    }

    /* loaded from: classes.dex */
    private class DownloadFilesTask extends AsyncTask<String, Integer, String> {
        private DownloadFilesTask() {
            BookView.this = r1;
        }

        /* synthetic */ DownloadFilesTask(BookView bookView, DownloadFilesTask downloadFilesTask) {
            this();
        }

        public String doInBackground(String... urls) {
            String filePath;
            if (!BookView.this.isDownloading) {
                BookView.this.isDownloading = true;
                String dir = BookView.this.afd_cachePath;
                if (!BookView.this.isOnline()) {
                    return "Download Error!";
                }
                String urlPath = urls[0];
                if (!urlPath.contains("/") || !urlPath.substring(0, 4).equals(HttpHost.DEFAULT_SCHEME_NAME)) {
                    return "Download Error!";
                }
                String[] paths = urlPath.split("/");
                String fileName = paths[paths.length - 1];
                int size = fileName.length();
                try {
                    Log.v("ContentLength", "ContentLength:fileLength");
                    String temp = URLEncoder.encode(fileName, "UTF-8").replace("+", "%20");
                    String tempUrl = String.valueOf(urlPath.substring(0, urlPath.length() - size)) + temp;
                    URL url = new URL(tempUrl);
                    HttpURLConnection.setFollowRedirects(false);
                    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                    conn.setConnectTimeout(TFTP.DEFAULT_TIMEOUT);
                    int fileLength = conn.getContentLength();
                    Log.v("ContentLength", "ContentLength:" + fileLength);
                    if (conn.getResponseCode() != 200 || fileLength < 1000) {
                        return "Download Error!";
                    }
                    String pathName = String.valueOf(dir) + "/" + fileName;
                    File file = new File(pathName);
                    if (file.exists()) {
                        file.delete();
                    }
                    BookView.this.downloadCancel = false;
                    InputStream input = new BufferedInputStream(url.openStream());
                    new File(dir).mkdir();
                    file.createNewFile();
                    OutputStream output = new FileOutputStream(file);
                    try {
                        byte[] buffer = new byte[4096];
                        long recivedLength = 0;
                        while (true) {
                            int len = input.read(buffer);
                            if (len != -1) {
                                recivedLength += len;
                                publishProgress(Integer.valueOf((int) ((100 * recivedLength) / fileLength)));
                                output.write(buffer, 0, len);
                                if (BookView.this.downloadCancel) {
                                    publishProgress(0);
                                    output.flush();
                                    output.close();
                                    input.close();
                                    file.delete();
                                    filePath = "Cancel Download!";
                                    break;
                                }
                            } else {
                                output.flush();
                                output.close();
                                input.close();
                                filePath = pathName;
                                break;
                            }
                        }
                        return filePath;
                    } catch (Exception e) {
                        return "Download Error!";
                    }
                } catch (Exception e2) {
                }
            } else {
                return "Downloading!";
            }
        }

        public void onProgressUpdate(Integer... progress) {
            BookView.this.afd_webView.loadUrl("javascript:downloadProgress(" + progress[0] + ")");
        }

        public void onPostExecute(String result) {
            BookView.this.afd_webView.loadUrl("javascript:setLoadingButtonStatus(0)");
            if (result.equals("Cancel Download!")) {
                BookView.this.isDownloading = false;
            } else if (!result.equals("Downloading!")) {
                if (result.equals("Download Error!")) {
                    BookView.this.isDownloading = false;
                    Toast.makeText(BookView.this.afd_curContext, result, 0).show();
                } else if (BookView.this.importBook(result)) {
                    BookView.this.isDownloading = false;
                    BookView.this.createBookshelf();
                    Toast.makeText(BookView.this.afd_curContext, "Download Success!", 0).show();
                }
            }
        }
    }

    public void speaking(String text) {
        this.tts.speak(text, 0, null);
    }

    public String jsStringEscape(String src) {
        return src.replace("''", "'").replace("'", "\\'");
    }

    public boolean isOnline() {
        ConnectivityManager cm = (ConnectivityManager) this.afd_curContext.getSystemService("connectivity");
        NetworkInfo netInfo = cm.getActiveNetworkInfo();
        return netInfo != null && netInfo.isConnectedOrConnecting();
    }

    @Override // android.speech.tts.TextToSpeech.OnInitListener
    public void onInit(int status) {
        if (status == 0) {
            int result = this.tts.setLanguage(Locale.US);
            if (result == -1 || result == -2) {
                Log.e("TTS", "Language is not supported");
                return;
            }
            return;
        }
        Log.e("TTS", "Initilization Failed");
    }

    private void getInnerBooks() {
        AssetManager assetManager = this.afd_curContext.getAssets();
        try {
            String[] files = assetManager.list("books");
            for (int i = 0; i < files.length; i++) {
                String temp = files[i];
                if (temp.length() > 5 && temp.substring(temp.length() - 5).equals(".epub")) {
                    copyBooksToSdcard(files[i]);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void copyBooksToSdcard(String bookname) {
        String tempPath = "/mnt/sdcard/epub/" + bookname;
        File dir = new File("/mnt/sdcard/epub");
        if (!dir.exists()) {
            dir.mkdir();
        }
        File f = new File(tempPath);
        if (!f.exists()) {
            try {
                f.createNewFile();
                InputStream is = this.afd_curContext.getAssets().open("books/" + bookname);
                int size = is.available();
                byte[] buffer = new byte[size];
                is.read(buffer);
                is.close();
                FileOutputStream fos = new FileOutputStream(f);
                fos.write(buffer);
                fos.close();
                importBook(tempPath);
            } catch (Exception e) {
                Log.e("copy error", "can not copy the book to sdcard!");
            }
        }
    }
}
