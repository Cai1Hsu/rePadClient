package com.edutech.idauthentication;

import android.os.AsyncTask;
import android.widget.ProgressBar;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.net.tftp.TFTP;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.protocol.HTTP;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class Async extends AsyncTask<String, Integer, String> {
    public static List<ProgressBar> listPb = new ArrayList();
    public static int peerdata = 10240;
    private boolean finished = true;
    private boolean paused = false;
    public long downloadsize = 0;
    public boolean isFinish = false;

    public boolean isPaused() {
        return this.paused;
    }

    public String doInBackground(String... Params) {
        Throwable th;
        InterruptedException e;
        RandomAccessFile outputStream;
        String filename = Params[0];
        String webpath = Params[1];
        HttpURLConnection httpURLConnection = null;
        InputStream inputStream = null;
        RandomAccessFile outputStream2 = null;
        try {
            try {
                URL url = new URL(webpath);
                try {
                    HttpURLConnection tempURLCon = (HttpURLConnection) url.openConnection();
                    tempURLCon.setRequestProperty("Range", "bytes=0-1024");
                    tempURLCon.connect();
                    int templength = tempURLCon.getContentLength();
                    boolean isSuppertRange = templength == 1025;
                    if (tempURLCon != null) {
                        tempURLCon.disconnect();
                    }
                    httpURLConnection = (HttpURLConnection) url.openConnection();
                    httpURLConnection.setConnectTimeout(TFTP.DEFAULT_TIMEOUT);
                    httpURLConnection.setRequestMethod(HttpGet.METHOD_NAME);
                    httpURLConnection.setRequestProperty("Accept", "image/gif, image/jpeg, image/pjpeg, image/pjpeg, application/x-shockwave-flash, application/xaml+xml, application/vnd.ms-xpsdocument, application/x-ms-xbap, application/x-ms-application, application/vnd.ms-excel, application/vnd.ms-powerpoint, application/msword, */*");
                    httpURLConnection.setRequestProperty("Accept-Language", "zh-CN");
                    httpURLConnection.setRequestProperty("Referer", webpath);
                    httpURLConnection.setRequestProperty("Charset", "UTF-8");
                    httpURLConnection.setRequestProperty(HTTP.USER_AGENT, "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)");
                    httpURLConnection.setRequestProperty(HTTP.CONN_DIRECTIVE, HTTP.CONN_KEEP_ALIVE);
                    String savepath = String.valueOf(AppEnvironment.FOLDER_EDUTECH) + filename;
                    File outFile = new File(savepath);
                    long startPosition = 0;
                    if (outFile.exists()) {
                        startPosition = isSuppertRange ? outFile.length() : 0L;
                        httpURLConnection.setRequestProperty("Range", "bytes=" + startPosition + "-");
                    } else {
                        FileInOutHelper.createNewFile(outFile);
                    }
                    httpURLConnection.connect();
                    long length = httpURLConnection.getContentLength();
                    if (length == -1) {
                        this.downloadsize = -1L;
                    }
                    inputStream = httpURLConnection.getInputStream();
                    outputStream = new RandomAccessFile(outFile, "rw");
                    try {
                        outputStream.seek(startPosition);
                        byte[] buf = new byte[peerdata];
                        long curSize = startPosition;
                        long length2 = length + startPosition;
                        while (true) {
                            if (this.finished) {
                                while (this.paused) {
                                    Thread.sleep(500L);
                                }
                                int read = inputStream.read(buf);
                                if (read == -1) {
                                    break;
                                }
                                outputStream.write(buf, 0, read);
                                curSize += read;
                                if (curSize == length2) {
                                    this.isFinish = true;
                                    break;
                                }
                                Thread.sleep(10L);
                            } else {
                                break;
                            }
                        }
                        inputStream.close();
                        outputStream.close();
                        httpURLConnection.disconnect();
                        this.finished = false;
                    } catch (MalformedURLException e2) {
                        e = e2;
                        outputStream2 = outputStream;
                        e.printStackTrace();
                        this.finished = false;
                        if (inputStream != null) {
                            try {
                                inputStream.close();
                                if (outputStream2 != null) {
                                    outputStream2.close();
                                }
                                if (httpURLConnection != null) {
                                    httpURLConnection.disconnect();
                                }
                            } catch (IOException e3) {
                                e3.printStackTrace();
                            }
                        }
                        return webpath;
                    } catch (IOException e4) {
                        e = e4;
                        outputStream2 = outputStream;
                        e.printStackTrace();
                        this.finished = false;
                        if (inputStream != null) {
                            try {
                                inputStream.close();
                                if (outputStream2 != null) {
                                    outputStream2.close();
                                }
                                if (httpURLConnection != null) {
                                    httpURLConnection.disconnect();
                                }
                            } catch (IOException e5) {
                                e5.printStackTrace();
                            }
                        }
                        return webpath;
                    } catch (InterruptedException e6) {
                        e = e6;
                        outputStream2 = outputStream;
                        e.printStackTrace();
                        this.finished = false;
                        if (inputStream != null) {
                            try {
                                inputStream.close();
                                if (outputStream2 != null) {
                                    outputStream2.close();
                                }
                                if (httpURLConnection != null) {
                                    httpURLConnection.disconnect();
                                }
                            } catch (IOException e7) {
                                e7.printStackTrace();
                            }
                        }
                        return webpath;
                    } catch (Throwable th2) {
                        th = th2;
                        outputStream2 = outputStream;
                        this.finished = false;
                        if (inputStream != null) {
                            try {
                                inputStream.close();
                                if (outputStream2 != null) {
                                    outputStream2.close();
                                }
                                if (httpURLConnection != null) {
                                    httpURLConnection.disconnect();
                                }
                            } catch (IOException e8) {
                                e8.printStackTrace();
                            }
                        }
                        throw th;
                    }
                } catch (InterruptedException e9) {
                    e = e9;
                } catch (MalformedURLException e10) {
                    e = e10;
                } catch (IOException e11) {
                    e = e11;
                } catch (Throwable th3) {
                    th = th3;
                }
            } catch (Throwable th4) {
                th = th4;
            }
        } catch (InterruptedException e12) {
            e = e12;
        } catch (MalformedURLException e13) {
            e = e13;
        } catch (IOException e14) {
            e = e14;
        }
        if (inputStream != null) {
            try {
                inputStream.close();
                if (outputStream != null) {
                    outputStream.close();
                }
            } catch (IOException e15) {
                e15.printStackTrace();
            }
            if (httpURLConnection != null) {
                httpURLConnection.disconnect();
                outputStream2 = outputStream;
                return webpath;
            }
        }
        outputStream2 = outputStream;
        return webpath;
    }

    public void pause() {
        this.paused = true;
    }

    public void continued() {
        this.paused = false;
    }

    @Override // android.os.AsyncTask
    protected void onCancelled() {
        this.finished = false;
        super.onCancelled();
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0024, code lost:
        if (r8.isFinish == false) goto L22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:11:0x0026, code lost:
        r7 = com.edutech.idauthentication.MainActivity.apkdownloadlist.iterator();
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0030, code lost:
        if (r7.hasNext() != false) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x0032, code lost:
        com.edutech.idauthentication.MainActivity.apkTaskList.remove(r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x003d, code lost:
        r4 = r7.next();
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x004a, code lost:
        if (r4.get("appwebpath") == null) goto L40;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0059, code lost:
        if (r4.get("appwebpath").equals(r9) == false) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x005b, code lost:
        r2 = java.lang.String.valueOf(com.edutech.idauthentication.AppEnvironment.FOLDER_EDUTECH) + r4.get("appname");
        com.edutech.idauthentication.MainActivity.apkfinList.add(r2);
        com.edutech.idauthentication.MainActivity.apkdownloadlist.remove(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0082, code lost:
        r7 = com.edutech.idauthentication.MainActivity.apkdownloadlist.iterator();
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x008c, code lost:
        if (r7.hasNext() == false) goto L43;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x008e, code lost:
        r4 = r7.next();
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x009b, code lost:
        if (r4.get("appwebpath") == null) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x00aa, code lost:
        if (r4.get("appwebpath").equals(r9) == false) goto L47;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x00ac, code lost:
        r3 = java.lang.Integer.valueOf(r4.get("redownload_count")).intValue();
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x00be, code lost:
        if (r3 >= 3) goto L32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x00c0, code lost:
        r4.put("redownload_count", java.lang.String.valueOf(r3 + 1));
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00ce, code lost:
        r2 = java.lang.String.valueOf(com.edutech.idauthentication.AppEnvironment.FOLDER_EDUTECH) + r4.get("appname");
        com.edutech.idauthentication.MainActivity.apkfinList.add(r2);
        com.edutech.idauthentication.MainActivity.apkdownloadlist.remove(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:9:0x001f, code lost:
        r8.finished = false;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void onPostExecute(String result) {
        int i = 0;
        while (true) {
            try {
                if (i >= MainActivity.apkTaskList.size()) {
                    break;
                } else if (MainActivity.apkTaskList.get(i).get(result) != null) {
                    break;
                } else {
                    i++;
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        super.onPostExecute((Async) result);
    }

    @Override // android.os.AsyncTask
    protected void onPreExecute() {
        super.onPreExecute();
    }

    public void onProgressUpdate(Integer... values) {
        listPb.get(values[1].intValue()).setProgress(values[0].intValue());
        super.onProgressUpdate((Object[]) values);
    }
}
