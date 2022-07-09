package android.support.v4.print;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.pdf.PdfDocument;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.ParcelFileDescriptor;
import android.print.PageRange;
import android.print.PrintAttributes;
import android.print.PrintDocumentAdapter;
import android.print.PrintDocumentInfo;
import android.print.PrintManager;
import android.print.pdf.PrintedPdfDocument;
import android.support.annotation.RequiresApi;
import android.util.Log;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@RequiresApi(19)
@TargetApi(19)
/* loaded from: classes.jar:android/support/v4/print/PrintHelperKitkat.class */
class PrintHelperKitkat {
    public static final int COLOR_MODE_COLOR = 2;
    public static final int COLOR_MODE_MONOCHROME = 1;
    private static final String LOG_TAG = "PrintHelperKitkat";
    private static final int MAX_PRINT_SIZE = 3500;
    public static final int ORIENTATION_LANDSCAPE = 1;
    public static final int ORIENTATION_PORTRAIT = 2;
    public static final int SCALE_MODE_FILL = 2;
    public static final int SCALE_MODE_FIT = 1;
    final Context mContext;
    int mOrientation;
    BitmapFactory.Options mDecodeOptions = null;
    private final Object mLock = new Object();
    int mScaleMode = 2;
    int mColorMode = 2;
    protected boolean mPrintActivityRespectsOrientation = true;
    protected boolean mIsMinMarginsHandlingCorrect = true;

    /* renamed from: android.support.v4.print.PrintHelperKitkat$3 */
    /* loaded from: classes.jar:android/support/v4/print/PrintHelperKitkat$3.class */
    class AnonymousClass3 extends PrintDocumentAdapter {
        private PrintAttributes mAttributes;
        Bitmap mBitmap = null;
        AsyncTask<Uri, Boolean, Bitmap> mLoadBitmap;
        final /* synthetic */ OnPrintFinishCallback val$callback;
        final /* synthetic */ int val$fittingMode;
        final /* synthetic */ Uri val$imageFile;
        final /* synthetic */ String val$jobName;

        AnonymousClass3(String str, Uri uri, OnPrintFinishCallback onPrintFinishCallback, int i) {
            PrintHelperKitkat.this = r4;
            this.val$jobName = str;
            this.val$imageFile = uri;
            this.val$callback = onPrintFinishCallback;
            this.val$fittingMode = i;
        }

        public void cancelLoad() {
            synchronized (PrintHelperKitkat.this.mLock) {
                if (PrintHelperKitkat.this.mDecodeOptions != null) {
                    PrintHelperKitkat.this.mDecodeOptions.requestCancelDecode();
                    PrintHelperKitkat.this.mDecodeOptions = null;
                }
            }
        }

        @Override // android.print.PrintDocumentAdapter
        public void onFinish() {
            super.onFinish();
            cancelLoad();
            if (this.mLoadBitmap != null) {
                this.mLoadBitmap.cancel(true);
            }
            if (this.val$callback != null) {
                this.val$callback.onFinish();
            }
            if (this.mBitmap != null) {
                this.mBitmap.recycle();
                this.mBitmap = null;
            }
        }

        /* JADX WARN: Type inference failed for: r1v1, types: [android.support.v4.print.PrintHelperKitkat$3$1] */
        @Override // android.print.PrintDocumentAdapter
        public void onLayout(final PrintAttributes printAttributes, final PrintAttributes printAttributes2, final CancellationSignal cancellationSignal, final PrintDocumentAdapter.LayoutResultCallback layoutResultCallback, Bundle bundle) {
            boolean z = true;
            synchronized (this) {
                this.mAttributes = printAttributes2;
            }
            if (cancellationSignal.isCanceled()) {
                layoutResultCallback.onLayoutCancelled();
            } else if (this.mBitmap == null) {
                this.mLoadBitmap = new AsyncTask<Uri, Boolean, Bitmap>() { // from class: android.support.v4.print.PrintHelperKitkat.3.1
                    public Bitmap doInBackground(Uri... uriArr) {
                        Bitmap bitmap;
                        try {
                            bitmap = PrintHelperKitkat.this.loadConstrainedBitmap(AnonymousClass3.this.val$imageFile, PrintHelperKitkat.MAX_PRINT_SIZE);
                        } catch (FileNotFoundException e) {
                            bitmap = null;
                        }
                        return bitmap;
                    }

                    public void onCancelled(Bitmap bitmap) {
                        layoutResultCallback.onLayoutCancelled();
                        AnonymousClass3.this.mLoadBitmap = null;
                    }

                    /* JADX WARN: Code restructure failed: missing block: B:7:0x0024, code lost:
                        if (android.support.v4.print.PrintHelperKitkat.this.mOrientation == 0) goto L8;
                     */
                    /*
                        Code decompiled incorrectly, please refer to instructions dump.
                    */
                    public void onPostExecute(Bitmap bitmap) {
                        PrintAttributes.MediaSize mediaSize;
                        super.onPostExecute((AnonymousClass1) bitmap);
                        Bitmap bitmap2 = bitmap;
                        if (bitmap != null) {
                            if (PrintHelperKitkat.this.mPrintActivityRespectsOrientation) {
                                bitmap2 = bitmap;
                            }
                            synchronized (this) {
                                mediaSize = AnonymousClass3.this.mAttributes.getMediaSize();
                            }
                            bitmap2 = bitmap;
                            if (mediaSize != null) {
                                bitmap2 = bitmap;
                                if (mediaSize.isPortrait() != PrintHelperKitkat.isPortrait(bitmap)) {
                                    Matrix matrix = new Matrix();
                                    matrix.postRotate(90.0f);
                                    bitmap2 = Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), matrix, true);
                                }
                            }
                        }
                        AnonymousClass3.this.mBitmap = bitmap2;
                        if (bitmap2 != null) {
                            layoutResultCallback.onLayoutFinished(new PrintDocumentInfo.Builder(AnonymousClass3.this.val$jobName).setContentType(1).setPageCount(1).build(), !printAttributes2.equals(printAttributes));
                        } else {
                            layoutResultCallback.onLayoutFailed(null);
                        }
                        AnonymousClass3.this.mLoadBitmap = null;
                    }

                    @Override // android.os.AsyncTask
                    protected void onPreExecute() {
                        cancellationSignal.setOnCancelListener(new CancellationSignal.OnCancelListener() { // from class: android.support.v4.print.PrintHelperKitkat.3.1.1
                            @Override // android.os.CancellationSignal.OnCancelListener
                            public void onCancel() {
                                AnonymousClass3.this.cancelLoad();
                                cancel(false);
                            }
                        });
                    }
                }.execute(new Uri[0]);
            } else {
                PrintDocumentInfo build = new PrintDocumentInfo.Builder(this.val$jobName).setContentType(1).setPageCount(1).build();
                if (printAttributes2.equals(printAttributes)) {
                    z = false;
                }
                layoutResultCallback.onLayoutFinished(build, z);
            }
        }

        @Override // android.print.PrintDocumentAdapter
        public void onWrite(PageRange[] pageRangeArr, ParcelFileDescriptor parcelFileDescriptor, CancellationSignal cancellationSignal, PrintDocumentAdapter.WriteResultCallback writeResultCallback) {
            PrintHelperKitkat.this.writeBitmap(this.mAttributes, this.val$fittingMode, this.mBitmap, parcelFileDescriptor, cancellationSignal, writeResultCallback);
        }
    }

    /* loaded from: classes.jar:android/support/v4/print/PrintHelperKitkat$OnPrintFinishCallback.class */
    public interface OnPrintFinishCallback {
        void onFinish();
    }

    PrintHelperKitkat(Context context) {
        this.mContext = context;
    }

    public Bitmap convertBitmapForColorMode(Bitmap bitmap, int i) {
        if (i == 1) {
            Bitmap createBitmap = Bitmap.createBitmap(bitmap.getWidth(), bitmap.getHeight(), Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(createBitmap);
            Paint paint = new Paint();
            ColorMatrix colorMatrix = new ColorMatrix();
            colorMatrix.setSaturation(0.0f);
            paint.setColorFilter(new ColorMatrixColorFilter(colorMatrix));
            canvas.drawBitmap(bitmap, 0.0f, 0.0f, paint);
            canvas.setBitmap(null);
            bitmap = createBitmap;
        }
        return bitmap;
    }

    public Matrix getMatrix(int i, int i2, RectF rectF, int i3) {
        Matrix matrix = new Matrix();
        float width = rectF.width() / i;
        float max = i3 == 2 ? Math.max(width, rectF.height() / i2) : Math.min(width, rectF.height() / i2);
        matrix.postScale(max, max);
        matrix.postTranslate((rectF.width() - (i * max)) / 2.0f, (rectF.height() - (i2 * max)) / 2.0f);
        return matrix;
    }

    public static boolean isPortrait(Bitmap bitmap) {
        return bitmap.getWidth() <= bitmap.getHeight();
    }

    private Bitmap loadBitmap(Uri uri, BitmapFactory.Options options) throws FileNotFoundException {
        if (uri == null || this.mContext == null) {
            throw new IllegalArgumentException("bad argument to loadBitmap");
        }
        InputStream inputStream = null;
        try {
            InputStream openInputStream = this.mContext.getContentResolver().openInputStream(uri);
            inputStream = openInputStream;
            Bitmap decodeStream = BitmapFactory.decodeStream(openInputStream, null, options);
            if (openInputStream != null) {
                try {
                    openInputStream.close();
                } catch (IOException e) {
                    Log.w(LOG_TAG, "close fail ", e);
                }
            }
            return decodeStream;
        } catch (Throwable th) {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e2) {
                    Log.w(LOG_TAG, "close fail ", e2);
                }
            }
            throw th;
        }
    }

    /* JADX DEBUG: Finally have unexpected throw blocks count: 2, expect 1 */
    public Bitmap loadConstrainedBitmap(Uri uri, int i) throws FileNotFoundException {
        int i2;
        BitmapFactory.Options options;
        if (i <= 0 || uri == null || this.mContext == null) {
            throw new IllegalArgumentException("bad argument to getScaledBitmap");
        }
        BitmapFactory.Options options2 = new BitmapFactory.Options();
        options2.inJustDecodeBounds = true;
        loadBitmap(uri, options2);
        int i3 = options2.outWidth;
        int i4 = options2.outHeight;
        Bitmap bitmap = null;
        if (i3 > 0) {
            if (i4 <= 0) {
                bitmap = null;
            } else {
                int max = Math.max(i3, i4);
                int i5 = 1;
                while (true) {
                    i2 = i5;
                    if (max <= i) {
                        break;
                    }
                    max >>>= 1;
                    i5 = i2 << 1;
                }
                bitmap = null;
                if (i2 > 0) {
                    bitmap = null;
                    if (Math.min(i3, i4) / i2 > 0) {
                        synchronized (this.mLock) {
                            this.mDecodeOptions = new BitmapFactory.Options();
                            this.mDecodeOptions.inMutable = true;
                            this.mDecodeOptions.inSampleSize = i2;
                            options = this.mDecodeOptions;
                        }
                        try {
                            bitmap = loadBitmap(uri, options);
                            synchronized (this.mLock) {
                                this.mDecodeOptions = null;
                            }
                        } catch (Throwable th) {
                            synchronized (this.mLock) {
                                this.mDecodeOptions = null;
                                throw th;
                            }
                        }
                    }
                }
            }
        }
        return bitmap;
    }

    /* JADX WARN: Type inference failed for: r0v6, types: [android.support.v4.print.PrintHelperKitkat$2] */
    public void writeBitmap(final PrintAttributes printAttributes, final int i, final Bitmap bitmap, final ParcelFileDescriptor parcelFileDescriptor, final CancellationSignal cancellationSignal, final PrintDocumentAdapter.WriteResultCallback writeResultCallback) {
        final PrintAttributes build = this.mIsMinMarginsHandlingCorrect ? printAttributes : copyAttributes(printAttributes).setMinMargins(new PrintAttributes.Margins(0, 0, 0, 0)).build();
        new AsyncTask<Void, Void, Throwable>() { // from class: android.support.v4.print.PrintHelperKitkat.2
            public Throwable doInBackground(Void... voidArr) {
                RectF rectF;
                try {
                    if (cancellationSignal.isCanceled()) {
                        th = null;
                    } else {
                        PrintedPdfDocument printedPdfDocument = new PrintedPdfDocument(PrintHelperKitkat.this.mContext, build);
                        Bitmap convertBitmapForColorMode = PrintHelperKitkat.this.convertBitmapForColorMode(bitmap, build.getColorMode());
                        th = null;
                        if (!cancellationSignal.isCanceled()) {
                            PdfDocument.Page startPage = printedPdfDocument.startPage(1);
                            if (PrintHelperKitkat.this.mIsMinMarginsHandlingCorrect) {
                                rectF = new RectF(startPage.getInfo().getContentRect());
                            } else {
                                PrintedPdfDocument printedPdfDocument2 = new PrintedPdfDocument(PrintHelperKitkat.this.mContext, printAttributes);
                                PdfDocument.Page startPage2 = printedPdfDocument2.startPage(1);
                                rectF = new RectF(startPage2.getInfo().getContentRect());
                                printedPdfDocument2.finishPage(startPage2);
                                printedPdfDocument2.close();
                            }
                            Matrix matrix = PrintHelperKitkat.this.getMatrix(convertBitmapForColorMode.getWidth(), convertBitmapForColorMode.getHeight(), rectF, i);
                            if (!PrintHelperKitkat.this.mIsMinMarginsHandlingCorrect) {
                                matrix.postTranslate(rectF.left, rectF.top);
                                startPage.getCanvas().clipRect(rectF);
                            }
                            startPage.getCanvas().drawBitmap(convertBitmapForColorMode, matrix, null);
                            printedPdfDocument.finishPage(startPage);
                            if (cancellationSignal.isCanceled()) {
                                printedPdfDocument.close();
                                if (parcelFileDescriptor != null) {
                                    try {
                                        parcelFileDescriptor.close();
                                    } catch (IOException e) {
                                    }
                                }
                                th = null;
                                if (convertBitmapForColorMode != bitmap) {
                                    convertBitmapForColorMode.recycle();
                                    th = null;
                                }
                            } else {
                                printedPdfDocument.writeTo(new FileOutputStream(parcelFileDescriptor.getFileDescriptor()));
                                printedPdfDocument.close();
                                if (parcelFileDescriptor != null) {
                                    try {
                                        parcelFileDescriptor.close();
                                    } catch (IOException e2) {
                                    }
                                }
                                th = null;
                                if (convertBitmapForColorMode != bitmap) {
                                    convertBitmapForColorMode.recycle();
                                    th = null;
                                }
                            }
                        }
                    }
                } catch (Throwable th) {
                    th = th;
                }
                return th;
            }

            public void onPostExecute(Throwable th) {
                if (cancellationSignal.isCanceled()) {
                    writeResultCallback.onWriteCancelled();
                } else if (th == null) {
                    writeResultCallback.onWriteFinished(new PageRange[]{PageRange.ALL_PAGES});
                } else {
                    Log.e(PrintHelperKitkat.LOG_TAG, "Error writing printed content", th);
                    writeResultCallback.onWriteFailed(null);
                }
            }
        }.execute(new Void[0]);
    }

    protected PrintAttributes.Builder copyAttributes(PrintAttributes printAttributes) {
        PrintAttributes.Builder minMargins = new PrintAttributes.Builder().setMediaSize(printAttributes.getMediaSize()).setResolution(printAttributes.getResolution()).setMinMargins(printAttributes.getMinMargins());
        if (printAttributes.getColorMode() != 0) {
            minMargins.setColorMode(printAttributes.getColorMode());
        }
        return minMargins;
    }

    public int getColorMode() {
        return this.mColorMode;
    }

    public int getOrientation() {
        return this.mOrientation == 0 ? 1 : this.mOrientation;
    }

    public int getScaleMode() {
        return this.mScaleMode;
    }

    public void printBitmap(final String str, final Bitmap bitmap, final OnPrintFinishCallback onPrintFinishCallback) {
        if (bitmap == null) {
            return;
        }
        final int i = this.mScaleMode;
        ((PrintManager) this.mContext.getSystemService("print")).print(str, new PrintDocumentAdapter() { // from class: android.support.v4.print.PrintHelperKitkat.1
            private PrintAttributes mAttributes;

            @Override // android.print.PrintDocumentAdapter
            public void onFinish() {
                if (onPrintFinishCallback != null) {
                    onPrintFinishCallback.onFinish();
                }
            }

            @Override // android.print.PrintDocumentAdapter
            public void onLayout(PrintAttributes printAttributes, PrintAttributes printAttributes2, CancellationSignal cancellationSignal, PrintDocumentAdapter.LayoutResultCallback layoutResultCallback, Bundle bundle) {
                boolean z = true;
                this.mAttributes = printAttributes2;
                PrintDocumentInfo build = new PrintDocumentInfo.Builder(str).setContentType(1).setPageCount(1).build();
                if (printAttributes2.equals(printAttributes)) {
                    z = false;
                }
                layoutResultCallback.onLayoutFinished(build, z);
            }

            @Override // android.print.PrintDocumentAdapter
            public void onWrite(PageRange[] pageRangeArr, ParcelFileDescriptor parcelFileDescriptor, CancellationSignal cancellationSignal, PrintDocumentAdapter.WriteResultCallback writeResultCallback) {
                PrintHelperKitkat.this.writeBitmap(this.mAttributes, i, bitmap, parcelFileDescriptor, cancellationSignal, writeResultCallback);
            }
        }, new PrintAttributes.Builder().setMediaSize(isPortrait(bitmap) ? PrintAttributes.MediaSize.UNKNOWN_PORTRAIT : PrintAttributes.MediaSize.UNKNOWN_LANDSCAPE).setColorMode(this.mColorMode).build());
    }

    public void printBitmap(String str, Uri uri, OnPrintFinishCallback onPrintFinishCallback) throws FileNotFoundException {
        AnonymousClass3 anonymousClass3 = new AnonymousClass3(str, uri, onPrintFinishCallback, this.mScaleMode);
        PrintManager printManager = (PrintManager) this.mContext.getSystemService("print");
        PrintAttributes.Builder builder = new PrintAttributes.Builder();
        builder.setColorMode(this.mColorMode);
        if (this.mOrientation == 1 || this.mOrientation == 0) {
            builder.setMediaSize(PrintAttributes.MediaSize.UNKNOWN_LANDSCAPE);
        } else if (this.mOrientation == 2) {
            builder.setMediaSize(PrintAttributes.MediaSize.UNKNOWN_PORTRAIT);
        }
        printManager.print(str, anonymousClass3, builder.build());
    }

    public void setColorMode(int i) {
        this.mColorMode = i;
    }

    public void setOrientation(int i) {
        this.mOrientation = i;
    }

    public void setScaleMode(int i) {
        this.mScaleMode = i;
    }
}
