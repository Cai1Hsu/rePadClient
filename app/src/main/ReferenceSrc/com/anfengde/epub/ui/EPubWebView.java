package com.anfengde.epub.ui;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Rect;
import android.graphics.Region;
import android.os.Handler;
import android.os.Message;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.webkit.GeolocationPermissions;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebStorage;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.anfengde.android.ActionItem;
import com.anfengde.android.QuickAction;
import com.blahti.drag.DragController;
import com.blahti.drag.DragLayer;
import com.blahti.drag.DragListener;
import com.blahti.drag.DragSource;
import com.blahti.drag.MyAbsoluteLayout;
import com.brandontate.androidwebviewselection.TextSelectionJavascriptInterface;
import com.brandontate.androidwebviewselection.TextSelectionJavascriptInterfaceListener;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import org.apache.tools.ant.taskdefs.XSLTLiaison;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public class EPubWebView extends WebView implements TextSelectionJavascriptInterfaceListener, View.OnTouchListener, View.OnLongClickListener, QuickAction.OnDismissListener, DragListener {
    static final FrameLayout.LayoutParams COVER_SCREEN_PARAMS = new FrameLayout.LayoutParams(-1, -1);
    static final String LOGTAG = "EPubWebView";
    private static final String TAG = "BTWebView";
    private FrameLayout mBrowserFrameLayout;
    private FrameLayout mContentView;
    private Context mContext;
    public QuickAction mContextMenu;
    public View mCustomView;
    private WebChromeClient.CustomViewCallback mCustomViewCallback;
    private FrameLayout mCustomViewContainer;
    private DragController mDragController;
    private ImageView mEndSelectionHandle;
    private FrameLayout mLayout;
    private DragLayer mSelectionDragLayer;
    private ImageView mStartSelectionHandle;
    private MyWebChromeClient mWebChromeClient;
    private MyWebViewClient mWebViewClient;
    public int touchOnVideo = 0;
    public boolean touchOnUrl = false;
    public boolean backReadingPage = false;
    public boolean onBookshelf = false;
    private Rect mSelectionBounds = null;
    protected Region lastSelectedRegion = null;
    protected String selectedRange = "";
    protected String selectedText = "";
    protected TextSelectionJavascriptInterface textSelectionJSInterface = null;
    protected boolean inSelectionMode = false;
    protected boolean contextMenuVisible = false;
    protected int contentWidth = 0;
    private final int SELECTION_START_HANDLE = 0;
    private final int SELECTION_END_HANDLE = 1;
    private int mLastTouchedSelectionHandle = -1;
    private Handler startSelectionModeHandler = new Handler() { // from class: com.anfengde.epub.ui.EPubWebView.1
        @Override // android.os.Handler
        public void handleMessage(Message m) {
            if (EPubWebView.this.mSelectionBounds != null) {
                EPubWebView.this.addView(EPubWebView.this.mSelectionDragLayer);
                EPubWebView.this.drawSelectionHandles();
                int contentHeight = (int) Math.ceil(EPubWebView.this.getDensityDependentValue(EPubWebView.this.getContentHeight(), EPubWebView.this.mContext));
                ViewGroup.LayoutParams layerParams = EPubWebView.this.mSelectionDragLayer.getLayoutParams();
                layerParams.height = contentHeight;
                layerParams.width = EPubWebView.this.contentWidth;
                EPubWebView.this.mSelectionDragLayer.setLayoutParams(layerParams);
            }
        }
    };
    private Handler endSelectionModeHandler = new Handler() { // from class: com.anfengde.epub.ui.EPubWebView.2
        @Override // android.os.Handler
        public void handleMessage(Message m) {
            EPubWebView.this.removeView(EPubWebView.this.mSelectionDragLayer);
            if (EPubWebView.this.getParent() != null && EPubWebView.this.mContextMenu != null && EPubWebView.this.contextMenuVisible) {
                try {
                    EPubWebView.this.mContextMenu.dismiss();
                } catch (Exception e) {
                }
            }
            EPubWebView.this.mSelectionBounds = null;
            EPubWebView.this.mLastTouchedSelectionHandle = -1;
            EPubWebView.this.loadUrl("javascript: android.selection.clearSelection();");
        }
    };
    private Handler drawSelectionHandlesHandler = new Handler() { // from class: com.anfengde.epub.ui.EPubWebView.3
        @Override // android.os.Handler
        public void handleMessage(Message m) {
            int i = 0;
            MyAbsoluteLayout.LayoutParams startParams = (MyAbsoluteLayout.LayoutParams) EPubWebView.this.mStartSelectionHandle.getLayoutParams();
            startParams.x = EPubWebView.this.mSelectionBounds.left - EPubWebView.this.mStartSelectionHandle.getDrawable().getIntrinsicWidth();
            startParams.y = EPubWebView.this.mSelectionBounds.top - EPubWebView.this.mStartSelectionHandle.getDrawable().getIntrinsicHeight();
            startParams.x = startParams.x < 0 ? 0 : startParams.x;
            startParams.y = startParams.y < 0 ? 0 : startParams.y;
            EPubWebView.this.mStartSelectionHandle.setLayoutParams(startParams);
            MyAbsoluteLayout.LayoutParams endParams = (MyAbsoluteLayout.LayoutParams) EPubWebView.this.mEndSelectionHandle.getLayoutParams();
            endParams.x = EPubWebView.this.mSelectionBounds.right;
            endParams.y = EPubWebView.this.mSelectionBounds.bottom;
            endParams.x = endParams.x < 0 ? 0 : endParams.x;
            if (endParams.y >= 0) {
                i = endParams.y;
            }
            endParams.y = i;
            EPubWebView.this.mEndSelectionHandle.setLayoutParams(endParams);
        }
    };
    private boolean mScrolling = false;
    private float mScrollDiffY = 0.0f;
    private float mLastTouchY = 0.0f;
    private float mScrollDiffX = 0.0f;
    private float mLastTouchX = 0.0f;

    private void init(Context context) {
        setHorizontalScrollBarEnabled(false);
        this.mContext = context;
        Activity a = (Activity) this.mContext;
        this.mLayout = new FrameLayout(context);
        this.mBrowserFrameLayout = (FrameLayout) LayoutInflater.from(a).inflate(R.layout.afd_custom_screen, (ViewGroup) null);
        this.mContentView = (FrameLayout) this.mBrowserFrameLayout.findViewById(R.id.afd_main_content);
        this.mCustomViewContainer = (FrameLayout) this.mBrowserFrameLayout.findViewById(R.id.afd_fullscreen_custom_content);
        this.mLayout.addView(this.mBrowserFrameLayout, COVER_SCREEN_PARAMS);
        this.mWebChromeClient = new MyWebChromeClient(this, null);
        webSetting();
        this.mContentView.addView(this);
    }

    private void webSetting() {
        setWebChromeClient(this.mWebChromeClient);
        this.mWebViewClient = new MyWebViewClient(this, null);
        setWebViewClient(this.mWebViewClient);
        setScrollBarStyle(0);
        setOnLongClickListener(this);
        setOnTouchListener(this);
        WebSettings s = getSettings();
        s.setSupportZoom(false);
        s.setBuiltInZoomControls(false);
        s.setDatabaseEnabled(true);
        s.setDomStorageEnabled(true);
        s.setDatabasePath("/data/data/" + this.mContext.getPackageName() + "/app_databases/");
        s.setJavaScriptCanOpenWindowsAutomatically(true);
        s.setLayoutAlgorithm(WebSettings.LayoutAlgorithm.NARROW_COLUMNS);
        s.setSavePassword(true);
        s.setSaveFormData(true);
        s.setJavaScriptEnabled(true);
        s.setGeolocationEnabled(true);
        this.textSelectionJSInterface = new TextSelectionJavascriptInterface(this.mContext, this);
        addJavascriptInterface(this.textSelectionJSInterface, this.textSelectionJSInterface.getInterfaceName());
        createSelectionLayer(this.mContext);
        Region region = new Region();
        region.setEmpty();
        this.lastSelectedRegion = region;
    }

    public void loadDataWithURL(String url) {
        String baseUrl = XSLTLiaison.FILE_PROTOCOL_PREFIX + url;
        Log.d(LOGTAG, "baseUrl: " + baseUrl);
        loadUrl(baseUrl);
    }

    public void loadDataWithString(String url) {
        String[] temp = url.split("/");
        String tempUrl = temp[temp.length - 1];
        int length = 0;
        if (tempUrl.contains("#")) {
            String[] tempSUrl = tempUrl.split("#");
            length = tempSUrl[tempSUrl.length - 1].length() + 1;
        }
        String baseUrl = XSLTLiaison.FILE_PROTOCOL_PREFIX + url.substring(0, url.length() - length);
        String filePath = getFilePath(url);
        String text = readData(filePath);
        super.loadDataWithBaseURL(baseUrl, text, "text/html", "utf-8", "");
    }

    private String getFilePath(String url) {
        int i = url.indexOf("#");
        if (-1 == i) {
            return url;
        }
        String path = url.substring(0, i);
        return path;
    }

    public String readData(String path) {
        String html;
        boolean fileExist = true;
        StringBuilder text = new StringBuilder();
        BufferedReader br = null;
        try {
            BufferedReader br2 = new BufferedReader(new FileReader(path));
            br = br2;
        } catch (FileNotFoundException e) {
            fileExist = false;
        }
        if (fileExist) {
            while (true) {
                try {
                    String line = br.readLine();
                    if (line == null) {
                        break;
                    }
                    text.append(line);
                    text.append('\n');
                } catch (IOException e2) {
                    e2.printStackTrace();
                }
            }
            br.close();
            html = text.toString();
        } else {
            html = "<head></head><body>FileNotFound</body>";
        }
        return html.replaceFirst("</head>", String.valueOf("<link type='text/css' rel='stylesheet' href='/sdcard/epub/css/readpage.css'/>") + "<script type='text/javascript' src='/sdcard/epub/js/jquery.min.js'></script><script type='text/javascript'>var afdjQuery = jQuery.noConflict(true);</script><script type='text/javascript' src='/sdcard/epub/js/androidselection.js'></script><script type='text/javascript' src='/sdcard/epub/js/rangycore.js'></script><script type='text/javascript' src='/sdcard/epub/js/rangyserializer.js'></script><script type='text/javascript' src='/sdcard/epub/js/control.js'></script><script></script></head>").replaceFirst("<title/>", " ");
    }

    public EPubWebView(Context context) {
        super(context);
        init(context);
    }

    public EPubWebView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context);
    }

    public EPubWebView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init(context);
    }

    public FrameLayout getLayout() {
        return this.mLayout;
    }

    public boolean inCustomView() {
        return this.mCustomView != null;
    }

    public void hideCustomView() {
        this.mWebChromeClient.onHideCustomView();
    }

    /* loaded from: classes.dex */
    private class MyWebChromeClient extends WebChromeClient {
        private Bitmap mDefaultVideoPoster;
        private View mVideoProgressView;

        private MyWebChromeClient() {
            EPubWebView.this = r1;
        }

        /* synthetic */ MyWebChromeClient(EPubWebView ePubWebView, MyWebChromeClient myWebChromeClient) {
            this();
        }

        @Override // android.webkit.WebChromeClient
        @SuppressLint({"NewApi"})
        public void onShowCustomView(View view, WebChromeClient.CustomViewCallback callback) {
            EPubWebView.this.setVisibility(8);
            EPubWebView.this.touchOnVideo = 1;
            if (EPubWebView.this.mCustomView == null) {
                EPubWebView.this.mCustomViewContainer.addView(view);
                EPubWebView.this.mCustomView = view;
                EPubWebView.this.mCustomViewCallback = callback;
                EPubWebView.this.mCustomViewContainer.setVisibility(0);
                return;
            }
            callback.onCustomViewHidden();
        }

        @Override // android.webkit.WebChromeClient
        @SuppressLint({"NewApi"})
        public void onHideCustomView() {
            if (EPubWebView.this.mCustomView != null) {
                EPubWebView.this.mCustomView.setVisibility(8);
                EPubWebView.this.mCustomViewContainer.removeView(EPubWebView.this.mCustomView);
                EPubWebView.this.mCustomView = null;
                EPubWebView.this.mCustomViewContainer.setVisibility(8);
                EPubWebView.this.mCustomViewCallback.onCustomViewHidden();
                EPubWebView.this.setVisibility(0);
            }
        }

        @Override // android.webkit.WebChromeClient
        public Bitmap getDefaultVideoPoster() {
            if (this.mDefaultVideoPoster == null) {
                this.mDefaultVideoPoster = BitmapFactory.decodeResource(EPubWebView.this.getResources(), R.drawable.default_video_poster);
            }
            return this.mDefaultVideoPoster;
        }

        @Override // android.webkit.WebChromeClient
        public View getVideoLoadingProgressView() {
            if (this.mVideoProgressView == null) {
                LayoutInflater inflater = LayoutInflater.from(EPubWebView.this.mContext);
                this.mVideoProgressView = inflater.inflate(R.layout.afd_video_loading_progress, (ViewGroup) null);
            }
            return this.mVideoProgressView;
        }

        @Override // android.webkit.WebChromeClient
        public void onReceivedTitle(WebView view, String title) {
            ((Activity) EPubWebView.this.mContext).setTitle(title);
        }

        @Override // android.webkit.WebChromeClient
        public void onProgressChanged(WebView view, int newProgress) {
            ((Activity) EPubWebView.this.mContext).getWindow().setFeatureInt(2, newProgress * 100);
        }

        @Override // android.webkit.WebChromeClient
        @SuppressLint({"NewApi"})
        public void onGeolocationPermissionsShowPrompt(String origin, GeolocationPermissions.Callback callback) {
            callback.invoke(origin, true, false);
        }

        @Override // android.webkit.WebChromeClient
        @SuppressLint({"NewApi"})
        public void onExceededDatabaseQuota(String url, String databaseIdentifier, long currentQuota, long estimatedSize, long totalUsedQuota, WebStorage.QuotaUpdater quotaUpdater) {
            quotaUpdater.updateQuota(2 * estimatedSize);
        }
    }

    /* loaded from: classes.dex */
    private class MyWebViewClient extends WebViewClient {
        private MyWebViewClient() {
            EPubWebView.this = r1;
        }

        /* synthetic */ MyWebViewClient(EPubWebView ePubWebView, MyWebViewClient myWebViewClient) {
            this();
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            EPubWebView.this.backReadingPage = true;
            view.loadUrl(url);
            return super.shouldOverrideUrlLoading(view, url);
        }

        @Override // android.webkit.WebViewClient
        public void onPageFinished(WebView view, String url) {
            super.onPageFinished(view, url);
            if (EPubWebView.this.backReadingPage) {
                EPubWebView.this.touchOnUrl = true;
            } else {
                EPubWebView.this.touchOnUrl = false;
            }
        }
    }

    protected void createSelectionLayer(Context context) {
        LayoutInflater inflater = (LayoutInflater) context.getSystemService("layout_inflater");
        this.mSelectionDragLayer = (DragLayer) inflater.inflate(R.layout.selection_drag_layer, (ViewGroup) null);
        this.mDragController = new DragController(context);
        this.mDragController.setDragListener(this);
        this.mDragController.addDropTarget(this.mSelectionDragLayer);
        this.mSelectionDragLayer.setDragController(this.mDragController);
        this.mStartSelectionHandle = (ImageView) this.mSelectionDragLayer.findViewById(R.id.startHandle);
        this.mStartSelectionHandle.setTag(new Integer(0));
        this.mEndSelectionHandle = (ImageView) this.mSelectionDragLayer.findViewById(R.id.endHandle);
        this.mEndSelectionHandle.setTag(new Integer(1));
        View.OnTouchListener handleTouchListener = new View.OnTouchListener() { // from class: com.anfengde.epub.ui.EPubWebView.4
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View v, MotionEvent event) {
                int action = event.getAction();
                if (action != 0) {
                    return false;
                }
                boolean handledHere = EPubWebView.this.startDrag(v);
                EPubWebView.this.mLastTouchedSelectionHandle = ((Integer) v.getTag()).intValue();
                return handledHere;
            }
        };
        this.mStartSelectionHandle.setOnTouchListener(handleTouchListener);
        this.mEndSelectionHandle.setOnTouchListener(handleTouchListener);
    }

    public void startSelectionMode() {
        this.startSelectionModeHandler.sendEmptyMessage(0);
    }

    public void endSelectionMode() {
        this.endSelectionModeHandler.sendEmptyMessage(0);
    }

    public void drawSelectionHandles() {
        this.drawSelectionHandlesHandler.sendEmptyMessage(0);
    }

    public boolean isInSelectionMode() {
        return this.mSelectionDragLayer.getParent() != null;
    }

    public boolean startDrag(View v) {
        this.mDragController.startDrag(v, this.mSelectionDragLayer, v, DragController.DRAG_ACTION_MOVE);
        return true;
    }

    @Override // com.blahti.drag.DragListener
    public void onDragStart(DragSource source, Object info, int dragAction) {
    }

    @Override // com.blahti.drag.DragListener
    public void onDragEnd() {
        MyAbsoluteLayout.LayoutParams startHandleParams = (MyAbsoluteLayout.LayoutParams) this.mStartSelectionHandle.getLayoutParams();
        MyAbsoluteLayout.LayoutParams endHandleParams = (MyAbsoluteLayout.LayoutParams) this.mEndSelectionHandle.getLayoutParams();
        float scale = getDensityIndependentValue(getScale(), this.mContext);
        float startX = startHandleParams.x - getScrollX();
        float startY = startHandleParams.y - getScrollY();
        float endX = endHandleParams.x - getScrollX();
        float endY = endHandleParams.y - getScrollY();
        float startX2 = getDensityIndependentValue(startX, this.mContext) / scale;
        float startY2 = getDensityIndependentValue(startY, this.mContext) / scale;
        float endX2 = getDensityIndependentValue(endX, this.mContext) / scale;
        float endY2 = getDensityIndependentValue(endY, this.mContext) / scale;
        if (this.mLastTouchedSelectionHandle == 0 && startX2 > 0.0f && startY2 > 0.0f) {
            String saveStartString = String.format("javascript: android.selection.setStartPos(%f, %f);", Float.valueOf(startX2), Float.valueOf(startY2));
            loadUrl(saveStartString);
        }
        if (this.mLastTouchedSelectionHandle == 1 && endX2 > 0.0f && endY2 > 0.0f) {
            String saveEndString = String.format("javascript: android.selection.setEndPos(%f, %f);", Float.valueOf(endX2), Float.valueOf(endY2));
            loadUrl(saveEndString);
        }
    }

    private void showContextMenu(Rect displayRect) {
        if (!this.contextMenuVisible && displayRect.right > displayRect.left) {
            ActionItem buttonCopy = new ActionItem();
            buttonCopy.setTitle("Copy");
            buttonCopy.setActionId(1);
            ActionItem buttonShare = new ActionItem();
            buttonShare.setTitle("Share");
            buttonShare.setActionId(2);
            ActionItem buttonSpeak = new ActionItem();
            buttonSpeak.setTitle("Speak");
            buttonSpeak.setActionId(3);
            this.mContextMenu = new QuickAction(getContext());
            this.mContextMenu.setOnDismissListener(this);
            this.mContextMenu.addActionItem(buttonCopy);
            this.mContextMenu.addActionItem(buttonShare);
            this.mContextMenu.addActionItem(buttonSpeak);
            this.mContextMenu.setOnActionItemClickListener(new QuickAction.OnActionItemClickListener() { // from class: com.anfengde.epub.ui.EPubWebView.5
                @Override // com.anfengde.android.QuickAction.OnActionItemClickListener
                public void onItemClick(QuickAction source, int pos, int actionId) {
                    switch (actionId) {
                        case 1:
                            EPubWebView.this.loadUrl("javascript:androidCopySelectionText();");
                            break;
                        case 2:
                            EPubWebView.this.loadUrl("javascript:showSharingPage();");
                            break;
                        case 3:
                            EPubWebView.this.loadUrl("javascript:ttsSpeaking()");
                            break;
                    }
                    EPubWebView.this.contextMenuVisible = false;
                    EPubWebView.this.endSelectionMode();
                }
            });
            this.contextMenuVisible = true;
            this.mContextMenu.show(this, displayRect);
        }
    }

    @Override // com.anfengde.android.QuickAction.OnDismissListener
    public void onDismiss() {
        this.contextMenuVisible = false;
    }

    @Override // com.brandontate.androidwebviewselection.TextSelectionJavascriptInterfaceListener
    public void tsjiJSError(String error) {
        Log.e(TAG, "JSError: " + error);
    }

    @Override // com.brandontate.androidwebviewselection.TextSelectionJavascriptInterfaceListener
    public void tsjiStartSelectionMode() {
        startSelectionMode();
    }

    @Override // com.brandontate.androidwebviewselection.TextSelectionJavascriptInterfaceListener
    public void tsjiEndSelectionMode() {
        endSelectionMode();
    }

    @Override // com.brandontate.androidwebviewselection.TextSelectionJavascriptInterfaceListener
    public void tsjiSelectionChanged(String range, String text, String handleBounds, String menuBounds) {
        try {
            JSONObject selectionBoundsObject = new JSONObject(handleBounds);
            float scale = getDensityIndependentValue(getScale(), this.mContext);
            Rect handleRect = new Rect();
            handleRect.left = (int) (getDensityDependentValue(selectionBoundsObject.getInt("left"), getContext()) * scale);
            handleRect.top = (int) (getDensityDependentValue(selectionBoundsObject.getInt("top"), getContext()) * scale);
            handleRect.right = (int) (getDensityDependentValue(selectionBoundsObject.getInt("right"), getContext()) * scale);
            handleRect.bottom = (int) (getDensityDependentValue(selectionBoundsObject.getInt("bottom"), getContext()) * scale);
            this.mSelectionBounds = handleRect;
            this.selectedRange = range;
            this.selectedText = text;
            JSONObject menuBoundsObject = new JSONObject(menuBounds);
            Rect displayRect = new Rect();
            displayRect.left = (int) (getDensityDependentValue(menuBoundsObject.getInt("left"), getContext()) * scale);
            displayRect.top = (int) (getDensityDependentValue(menuBoundsObject.getInt("top") - 25, getContext()) * scale);
            displayRect.right = (int) (getDensityDependentValue(menuBoundsObject.getInt("right"), getContext()) * scale);
            displayRect.bottom = (int) (getDensityDependentValue(menuBoundsObject.getInt("bottom") + 25, getContext()) * scale);
            if (!isInSelectionMode()) {
                startSelectionMode();
            }
            showContextMenu(displayRect);
            drawSelectionHandles();
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    @Override // com.brandontate.androidwebviewselection.TextSelectionJavascriptInterfaceListener
    public void tsjiSetContentWidth(float contentWidth) {
        this.contentWidth = (int) getDensityDependentValue(contentWidth, this.mContext);
    }

    public float getDensityDependentValue(float val, Context ctx) {
        Display display = ((WindowManager) ctx.getSystemService("window")).getDefaultDisplay();
        DisplayMetrics metrics = new DisplayMetrics();
        display.getMetrics(metrics);
        return (metrics.densityDpi / 160.0f) * val;
    }

    public float getDensityIndependentValue(float val, Context ctx) {
        Display display = ((WindowManager) ctx.getSystemService("window")).getDefaultDisplay();
        DisplayMetrics metrics = new DisplayMetrics();
        display.getMetrics(metrics);
        return val / (metrics.densityDpi / 160.0f);
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View v, MotionEvent event) {
        if (!this.backReadingPage && !this.onBookshelf) {
            float xPoint = getDensityIndependentValue(event.getX(), this.mContext) / getDensityIndependentValue(getScale(), this.mContext);
            float yPoint = getDensityIndependentValue(event.getY(), this.mContext) / getDensityIndependentValue(getScale(), this.mContext);
            if (event.getAction() == 0) {
                String startTouchUrl = String.format("javascript:android.selection.startTouch(%f, %f);", Float.valueOf(xPoint), Float.valueOf(yPoint));
                this.mLastTouchX = xPoint;
                this.mLastTouchY = yPoint;
                loadUrl(startTouchUrl);
            } else if (event.getAction() == 1) {
                if (!this.mScrolling) {
                    endSelectionMode();
                }
                this.mScrollDiffX = 0.0f;
                this.mScrollDiffY = 0.0f;
                this.mScrolling = false;
                if (!isInSelectionMode()) {
                    loadUrl("javascript:androidLongtouchModel(0);");
                }
            } else if (event.getAction() == 2) {
                this.mScrollDiffX += xPoint - this.mLastTouchX;
                this.mScrollDiffY += yPoint - this.mLastTouchY;
                this.mLastTouchX = xPoint;
                this.mLastTouchY = yPoint;
                if (Math.abs(this.mScrollDiffX) > 10.0f || Math.abs(this.mScrollDiffY) > 10.0f) {
                    this.mScrolling = true;
                }
            }
        }
        return false;
    }

    @Override // android.view.View.OnLongClickListener
    public boolean onLongClick(View v) {
        if (this.backReadingPage || this.onBookshelf) {
            return false;
        }
        loadUrl("javascript:android.selection.longTouch();");
        loadUrl("javascript:androidLongtouchModel(1);");
        this.mScrolling = true;
        return true;
    }
}
