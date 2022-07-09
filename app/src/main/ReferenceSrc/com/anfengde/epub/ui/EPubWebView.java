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

/* loaded from: classes.jar:com/anfengde/epub/ui/EPubWebView.class */
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
        public void handleMessage(Message message) {
            if (EPubWebView.this.mSelectionBounds == null) {
                return;
            }
            EPubWebView.this.addView(EPubWebView.this.mSelectionDragLayer);
            EPubWebView.this.drawSelectionHandles();
            int ceil = (int) Math.ceil(EPubWebView.this.getDensityDependentValue(EPubWebView.this.getContentHeight(), EPubWebView.this.mContext));
            ViewGroup.LayoutParams layoutParams = EPubWebView.this.mSelectionDragLayer.getLayoutParams();
            layoutParams.height = ceil;
            layoutParams.width = EPubWebView.this.contentWidth;
            EPubWebView.this.mSelectionDragLayer.setLayoutParams(layoutParams);
        }
    };
    private Handler endSelectionModeHandler = new Handler() { // from class: com.anfengde.epub.ui.EPubWebView.2
        @Override // android.os.Handler
        public void handleMessage(Message message) {
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
        public void handleMessage(Message message) {
            MyAbsoluteLayout.LayoutParams layoutParams = (MyAbsoluteLayout.LayoutParams) EPubWebView.this.mStartSelectionHandle.getLayoutParams();
            layoutParams.x = EPubWebView.this.mSelectionBounds.left - EPubWebView.this.mStartSelectionHandle.getDrawable().getIntrinsicWidth();
            layoutParams.y = EPubWebView.this.mSelectionBounds.top - EPubWebView.this.mStartSelectionHandle.getDrawable().getIntrinsicHeight();
            layoutParams.x = layoutParams.x < 0 ? 0 : layoutParams.x;
            layoutParams.y = layoutParams.y < 0 ? 0 : layoutParams.y;
            EPubWebView.this.mStartSelectionHandle.setLayoutParams(layoutParams);
            MyAbsoluteLayout.LayoutParams layoutParams2 = (MyAbsoluteLayout.LayoutParams) EPubWebView.this.mEndSelectionHandle.getLayoutParams();
            layoutParams2.x = EPubWebView.this.mSelectionBounds.right;
            layoutParams2.y = EPubWebView.this.mSelectionBounds.bottom;
            layoutParams2.x = layoutParams2.x < 0 ? 0 : layoutParams2.x;
            layoutParams2.y = layoutParams2.y < 0 ? 0 : layoutParams2.y;
            EPubWebView.this.mEndSelectionHandle.setLayoutParams(layoutParams2);
        }
    };
    private boolean mScrolling = false;
    private float mScrollDiffY = 0.0f;
    private float mLastTouchY = 0.0f;
    private float mScrollDiffX = 0.0f;
    private float mLastTouchX = 0.0f;

    /* loaded from: classes.jar:com/anfengde/epub/ui/EPubWebView$MyWebChromeClient.class */
    private class MyWebChromeClient extends WebChromeClient {
        private Bitmap mDefaultVideoPoster;
        private View mVideoProgressView;

        private MyWebChromeClient() {
            EPubWebView.this = r4;
        }

        /* synthetic */ MyWebChromeClient(EPubWebView ePubWebView, MyWebChromeClient myWebChromeClient) {
            this();
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
                this.mVideoProgressView = LayoutInflater.from(EPubWebView.this.mContext).inflate(R.layout.afd_video_loading_progress, (ViewGroup) null);
            }
            return this.mVideoProgressView;
        }

        @Override // android.webkit.WebChromeClient
        @SuppressLint({"NewApi"})
        public void onExceededDatabaseQuota(String str, String str2, long j, long j2, long j3, WebStorage.QuotaUpdater quotaUpdater) {
            quotaUpdater.updateQuota(2 * j2);
        }

        @Override // android.webkit.WebChromeClient
        @SuppressLint({"NewApi"})
        public void onGeolocationPermissionsShowPrompt(String str, GeolocationPermissions.Callback callback) {
            callback.invoke(str, true, false);
        }

        @Override // android.webkit.WebChromeClient
        @SuppressLint({"NewApi"})
        public void onHideCustomView() {
            if (EPubWebView.this.mCustomView == null) {
                return;
            }
            EPubWebView.this.mCustomView.setVisibility(8);
            EPubWebView.this.mCustomViewContainer.removeView(EPubWebView.this.mCustomView);
            EPubWebView.this.mCustomView = null;
            EPubWebView.this.mCustomViewContainer.setVisibility(8);
            EPubWebView.this.mCustomViewCallback.onCustomViewHidden();
            EPubWebView.this.setVisibility(0);
        }

        @Override // android.webkit.WebChromeClient
        public void onProgressChanged(WebView webView, int i) {
            ((Activity) EPubWebView.this.mContext).getWindow().setFeatureInt(2, i * 100);
        }

        @Override // android.webkit.WebChromeClient
        public void onReceivedTitle(WebView webView, String str) {
            ((Activity) EPubWebView.this.mContext).setTitle(str);
        }

        @Override // android.webkit.WebChromeClient
        @SuppressLint({"NewApi"})
        public void onShowCustomView(View view, WebChromeClient.CustomViewCallback customViewCallback) {
            EPubWebView.this.setVisibility(8);
            EPubWebView.this.touchOnVideo = 1;
            if (EPubWebView.this.mCustomView != null) {
                customViewCallback.onCustomViewHidden();
                return;
            }
            EPubWebView.this.mCustomViewContainer.addView(view);
            EPubWebView.this.mCustomView = view;
            EPubWebView.this.mCustomViewCallback = customViewCallback;
            EPubWebView.this.mCustomViewContainer.setVisibility(0);
        }
    }

    /* loaded from: classes.jar:com/anfengde/epub/ui/EPubWebView$MyWebViewClient.class */
    private class MyWebViewClient extends WebViewClient {
        private MyWebViewClient() {
            EPubWebView.this = r4;
        }

        /* synthetic */ MyWebViewClient(EPubWebView ePubWebView, MyWebViewClient myWebViewClient) {
            this();
        }

        @Override // android.webkit.WebViewClient
        public void onPageFinished(WebView webView, String str) {
            super.onPageFinished(webView, str);
            if (EPubWebView.this.backReadingPage) {
                EPubWebView.this.touchOnUrl = true;
            } else {
                EPubWebView.this.touchOnUrl = false;
            }
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView webView, String str) {
            EPubWebView.this.backReadingPage = true;
            webView.loadUrl(str);
            return super.shouldOverrideUrlLoading(webView, str);
        }
    }

    public EPubWebView(Context context) {
        super(context);
        init(context);
    }

    public EPubWebView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init(context);
    }

    public EPubWebView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init(context);
    }

    public void drawSelectionHandles() {
        this.drawSelectionHandlesHandler.sendEmptyMessage(0);
    }

    private String getFilePath(String str) {
        int indexOf = str.indexOf("#");
        if (-1 != indexOf) {
            str = str.substring(0, indexOf);
        }
        return str;
    }

    private void init(Context context) {
        setHorizontalScrollBarEnabled(false);
        this.mContext = context;
        this.mLayout = new FrameLayout(context);
        this.mBrowserFrameLayout = (FrameLayout) LayoutInflater.from((Activity) this.mContext).inflate(R.layout.afd_custom_screen, (ViewGroup) null);
        this.mContentView = (FrameLayout) this.mBrowserFrameLayout.findViewById(R.id.afd_main_content);
        this.mCustomViewContainer = (FrameLayout) this.mBrowserFrameLayout.findViewById(R.id.afd_fullscreen_custom_content);
        this.mLayout.addView(this.mBrowserFrameLayout, COVER_SCREEN_PARAMS);
        this.mWebChromeClient = new MyWebChromeClient(this, null);
        webSetting();
        this.mContentView.addView(this);
    }

    private void showContextMenu(Rect rect) {
        if (!this.contextMenuVisible && rect.right > rect.left) {
            ActionItem actionItem = new ActionItem();
            actionItem.setTitle("Copy");
            actionItem.setActionId(1);
            ActionItem actionItem2 = new ActionItem();
            actionItem2.setTitle("Share");
            actionItem2.setActionId(2);
            ActionItem actionItem3 = new ActionItem();
            actionItem3.setTitle("Speak");
            actionItem3.setActionId(3);
            this.mContextMenu = new QuickAction(getContext());
            this.mContextMenu.setOnDismissListener(this);
            this.mContextMenu.addActionItem(actionItem);
            this.mContextMenu.addActionItem(actionItem2);
            this.mContextMenu.addActionItem(actionItem3);
            this.mContextMenu.setOnActionItemClickListener(new QuickAction.OnActionItemClickListener() { // from class: com.anfengde.epub.ui.EPubWebView.5
                @Override // com.anfengde.android.QuickAction.OnActionItemClickListener
                public void onItemClick(QuickAction quickAction, int i, int i2) {
                    switch (i2) {
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
            this.mContextMenu.show(this, rect);
        }
    }

    public boolean startDrag(View view) {
        this.mDragController.startDrag(view, this.mSelectionDragLayer, view, DragController.DRAG_ACTION_MOVE);
        return true;
    }

    private void webSetting() {
        setWebChromeClient(this.mWebChromeClient);
        this.mWebViewClient = new MyWebViewClient(this, null);
        setWebViewClient(this.mWebViewClient);
        setScrollBarStyle(0);
        setOnLongClickListener(this);
        setOnTouchListener(this);
        WebSettings settings = getSettings();
        settings.setSupportZoom(false);
        settings.setBuiltInZoomControls(false);
        settings.setDatabaseEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setDatabasePath("/data/data/" + this.mContext.getPackageName() + "/app_databases/");
        settings.setJavaScriptCanOpenWindowsAutomatically(true);
        settings.setLayoutAlgorithm(WebSettings.LayoutAlgorithm.NARROW_COLUMNS);
        settings.setSavePassword(true);
        settings.setSaveFormData(true);
        settings.setJavaScriptEnabled(true);
        settings.setGeolocationEnabled(true);
        this.textSelectionJSInterface = new TextSelectionJavascriptInterface(this.mContext, this);
        addJavascriptInterface(this.textSelectionJSInterface, this.textSelectionJSInterface.getInterfaceName());
        createSelectionLayer(this.mContext);
        Region region = new Region();
        region.setEmpty();
        this.lastSelectedRegion = region;
    }

    protected void createSelectionLayer(Context context) {
        this.mSelectionDragLayer = (DragLayer) ((LayoutInflater) context.getSystemService("layout_inflater")).inflate(R.layout.selection_drag_layer, (ViewGroup) null);
        this.mDragController = new DragController(context);
        this.mDragController.setDragListener(this);
        this.mDragController.addDropTarget(this.mSelectionDragLayer);
        this.mSelectionDragLayer.setDragController(this.mDragController);
        this.mStartSelectionHandle = (ImageView) this.mSelectionDragLayer.findViewById(R.id.startHandle);
        this.mStartSelectionHandle.setTag(new Integer(0));
        this.mEndSelectionHandle = (ImageView) this.mSelectionDragLayer.findViewById(R.id.endHandle);
        this.mEndSelectionHandle.setTag(new Integer(1));
        View.OnTouchListener onTouchListener = new View.OnTouchListener() { // from class: com.anfengde.epub.ui.EPubWebView.4
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View view, MotionEvent motionEvent) {
                boolean z = false;
                if (motionEvent.getAction() == 0) {
                    z = EPubWebView.this.startDrag(view);
                    EPubWebView.this.mLastTouchedSelectionHandle = ((Integer) view.getTag()).intValue();
                }
                return z;
            }
        };
        this.mStartSelectionHandle.setOnTouchListener(onTouchListener);
        this.mEndSelectionHandle.setOnTouchListener(onTouchListener);
    }

    public void endSelectionMode() {
        this.endSelectionModeHandler.sendEmptyMessage(0);
    }

    public float getDensityDependentValue(float f, Context context) {
        Display defaultDisplay = ((WindowManager) context.getSystemService("window")).getDefaultDisplay();
        DisplayMetrics displayMetrics = new DisplayMetrics();
        defaultDisplay.getMetrics(displayMetrics);
        return (displayMetrics.densityDpi / 160.0f) * f;
    }

    public float getDensityIndependentValue(float f, Context context) {
        Display defaultDisplay = ((WindowManager) context.getSystemService("window")).getDefaultDisplay();
        DisplayMetrics displayMetrics = new DisplayMetrics();
        defaultDisplay.getMetrics(displayMetrics);
        return f / (displayMetrics.densityDpi / 160.0f);
    }

    public FrameLayout getLayout() {
        return this.mLayout;
    }

    public void hideCustomView() {
        this.mWebChromeClient.onHideCustomView();
    }

    public boolean inCustomView() {
        return this.mCustomView != null;
    }

    public boolean isInSelectionMode() {
        return this.mSelectionDragLayer.getParent() != null;
    }

    public void loadDataWithString(String str) {
        String[] split = str.split("/");
        String str2 = split[split.length - 1];
        int i = 0;
        if (str2.contains("#")) {
            String[] split2 = str2.split("#");
            i = split2[split2.length - 1].length() + 1;
        }
        super.loadDataWithBaseURL(XSLTLiaison.FILE_PROTOCOL_PREFIX + str.substring(0, str.length() - i), readData(getFilePath(str)), "text/html", "utf-8", "");
    }

    public void loadDataWithURL(String str) {
        String str2 = XSLTLiaison.FILE_PROTOCOL_PREFIX + str;
        Log.d(LOGTAG, "baseUrl: " + str2);
        loadUrl(str2);
    }

    @Override // com.anfengde.android.QuickAction.OnDismissListener
    public void onDismiss() {
        this.contextMenuVisible = false;
    }

    @Override // com.blahti.drag.DragListener
    public void onDragEnd() {
        MyAbsoluteLayout.LayoutParams layoutParams = (MyAbsoluteLayout.LayoutParams) this.mStartSelectionHandle.getLayoutParams();
        MyAbsoluteLayout.LayoutParams layoutParams2 = (MyAbsoluteLayout.LayoutParams) this.mEndSelectionHandle.getLayoutParams();
        float densityIndependentValue = getDensityIndependentValue(getScale(), this.mContext);
        float scrollX = layoutParams.x - getScrollX();
        float scrollY = layoutParams.y - getScrollY();
        float scrollX2 = layoutParams2.x - getScrollX();
        float scrollY2 = layoutParams2.y - getScrollY();
        float densityIndependentValue2 = getDensityIndependentValue(scrollX, this.mContext) / densityIndependentValue;
        float densityIndependentValue3 = getDensityIndependentValue(scrollY, this.mContext) / densityIndependentValue;
        float densityIndependentValue4 = getDensityIndependentValue(scrollX2, this.mContext) / densityIndependentValue;
        float densityIndependentValue5 = getDensityIndependentValue(scrollY2, this.mContext) / densityIndependentValue;
        if (this.mLastTouchedSelectionHandle == 0 && densityIndependentValue2 > 0.0f && densityIndependentValue3 > 0.0f) {
            loadUrl(String.format("javascript: android.selection.setStartPos(%f, %f);", Float.valueOf(densityIndependentValue2), Float.valueOf(densityIndependentValue3)));
        }
        if (this.mLastTouchedSelectionHandle != 1 || densityIndependentValue4 <= 0.0f || densityIndependentValue5 <= 0.0f) {
            return;
        }
        loadUrl(String.format("javascript: android.selection.setEndPos(%f, %f);", Float.valueOf(densityIndependentValue4), Float.valueOf(densityIndependentValue5)));
    }

    @Override // com.blahti.drag.DragListener
    public void onDragStart(DragSource dragSource, Object obj, int i) {
    }

    @Override // android.view.View.OnLongClickListener
    public boolean onLongClick(View view) {
        boolean z = true;
        if (this.backReadingPage || this.onBookshelf) {
            z = false;
        } else {
            loadUrl("javascript:android.selection.longTouch();");
            loadUrl("javascript:androidLongtouchModel(1);");
            this.mScrolling = true;
        }
        return z;
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        if (this.backReadingPage || this.onBookshelf) {
            return false;
        }
        float densityIndependentValue = getDensityIndependentValue(motionEvent.getX(), this.mContext) / getDensityIndependentValue(getScale(), this.mContext);
        float densityIndependentValue2 = getDensityIndependentValue(motionEvent.getY(), this.mContext) / getDensityIndependentValue(getScale(), this.mContext);
        if (motionEvent.getAction() == 0) {
            String format = String.format("javascript:android.selection.startTouch(%f, %f);", Float.valueOf(densityIndependentValue), Float.valueOf(densityIndependentValue2));
            this.mLastTouchX = densityIndependentValue;
            this.mLastTouchY = densityIndependentValue2;
            loadUrl(format);
            return false;
        } else if (motionEvent.getAction() == 1) {
            if (!this.mScrolling) {
                endSelectionMode();
            }
            this.mScrollDiffX = 0.0f;
            this.mScrollDiffY = 0.0f;
            this.mScrolling = false;
            if (isInSelectionMode()) {
                return false;
            }
            loadUrl("javascript:androidLongtouchModel(0);");
            return false;
        } else if (motionEvent.getAction() != 2) {
            return false;
        } else {
            this.mScrollDiffX += densityIndependentValue - this.mLastTouchX;
            this.mScrollDiffY += densityIndependentValue2 - this.mLastTouchY;
            this.mLastTouchX = densityIndependentValue;
            this.mLastTouchY = densityIndependentValue2;
            if (Math.abs(this.mScrollDiffX) <= 10.0f && Math.abs(this.mScrollDiffY) <= 10.0f) {
                return false;
            }
            this.mScrolling = true;
            return false;
        }
    }

    public String readData(String str) {
        BufferedReader bufferedReader;
        String sb;
        boolean z = true;
        StringBuilder sb2 = new StringBuilder();
        try {
            bufferedReader = new BufferedReader(new FileReader(str));
        } catch (FileNotFoundException e) {
            z = false;
            bufferedReader = null;
        }
        if (z) {
            while (true) {
                try {
                    String readLine = bufferedReader.readLine();
                    if (readLine == null) {
                        break;
                    }
                    sb2.append(readLine);
                    sb2.append('\n');
                } catch (IOException e2) {
                    e2.printStackTrace();
                }
            }
            bufferedReader.close();
            sb = sb2.toString();
        } else {
            sb = "<head></head><body>FileNotFound</body>";
        }
        return sb.replaceFirst("</head>", String.valueOf("<link type='text/css' rel='stylesheet' href='/sdcard/epub/css/readpage.css'/>") + "<script type='text/javascript' src='/sdcard/epub/js/jquery.min.js'></script><script type='text/javascript'>var afdjQuery = jQuery.noConflict(true);</script><script type='text/javascript' src='/sdcard/epub/js/androidselection.js'></script><script type='text/javascript' src='/sdcard/epub/js/rangycore.js'></script><script type='text/javascript' src='/sdcard/epub/js/rangyserializer.js'></script><script type='text/javascript' src='/sdcard/epub/js/control.js'></script><script></script></head>").replaceFirst("<title/>", " ");
    }

    public void startSelectionMode() {
        this.startSelectionModeHandler.sendEmptyMessage(0);
    }

    @Override // com.brandontate.androidwebviewselection.TextSelectionJavascriptInterfaceListener
    public void tsjiEndSelectionMode() {
        endSelectionMode();
    }

    @Override // com.brandontate.androidwebviewselection.TextSelectionJavascriptInterfaceListener
    public void tsjiJSError(String str) {
        Log.e(TAG, "JSError: " + str);
    }

    @Override // com.brandontate.androidwebviewselection.TextSelectionJavascriptInterfaceListener
    public void tsjiSelectionChanged(String str, String str2, String str3, String str4) {
        try {
            JSONObject jSONObject = new JSONObject(str3);
            float densityIndependentValue = getDensityIndependentValue(getScale(), this.mContext);
            Rect rect = new Rect();
            rect.left = (int) (getDensityDependentValue(jSONObject.getInt("left"), getContext()) * densityIndependentValue);
            rect.top = (int) (getDensityDependentValue(jSONObject.getInt("top"), getContext()) * densityIndependentValue);
            rect.right = (int) (getDensityDependentValue(jSONObject.getInt("right"), getContext()) * densityIndependentValue);
            rect.bottom = (int) (getDensityDependentValue(jSONObject.getInt("bottom"), getContext()) * densityIndependentValue);
            this.mSelectionBounds = rect;
            this.selectedRange = str;
            this.selectedText = str2;
            JSONObject jSONObject2 = new JSONObject(str4);
            Rect rect2 = new Rect();
            rect2.left = (int) (getDensityDependentValue(jSONObject2.getInt("left"), getContext()) * densityIndependentValue);
            rect2.top = (int) (getDensityDependentValue(jSONObject2.getInt("top") - 25, getContext()) * densityIndependentValue);
            rect2.right = (int) (getDensityDependentValue(jSONObject2.getInt("right"), getContext()) * densityIndependentValue);
            rect2.bottom = (int) (getDensityDependentValue(jSONObject2.getInt("bottom") + 25, getContext()) * densityIndependentValue);
            if (!isInSelectionMode()) {
                startSelectionMode();
            }
            showContextMenu(rect2);
            drawSelectionHandles();
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    @Override // com.brandontate.androidwebviewselection.TextSelectionJavascriptInterfaceListener
    public void tsjiSetContentWidth(float f) {
        this.contentWidth = (int) getDensityDependentValue(f, this.mContext);
    }

    @Override // com.brandontate.androidwebviewselection.TextSelectionJavascriptInterfaceListener
    public void tsjiStartSelectionMode() {
        startSelectionMode();
    }
}
