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

/* loaded from: classes.jar:com/edutech/idauthentication/Async.class */
public class Async extends AsyncTask<String, Integer, String> {
    public static List<ProgressBar> listPb = new ArrayList();
    public static int peerdata = 10240;
    private boolean finished = true;
    private boolean paused = false;
    public long downloadsize = 0;
    public boolean isFinish = false;

    public void continued() {
        this.paused = false;
    }

    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:157:0x0675 */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:189:0x0052 */
    /* JADX DEBUG: Multi-variable search result rejected for r8v10, resolved type: java.io.IOException */
    /* JADX DEBUG: Multi-variable search result rejected for r8v16, resolved type: java.io.IOException */
    /* JADX DEBUG: Multi-variable search result rejected for r8v6, resolved type: java.io.IOException */
    /* JADX DEBUG: Multi-variable search result rejected for r8v8, resolved type: java.io.IOException */
    /* JADX WARN: Multi-variable type inference failed */
    public String doInBackground(String... strArr) {
        HttpURLConnection httpURLConnection;
        RandomAccessFile randomAccessFile;
        HttpURLConnection httpURLConnection2;
        InputStream inputStream;
        RandomAccessFile randomAccessFile2;
        Throwable th;
        InterruptedException e;
        InputStream inputStream2;
        RandomAccessFile randomAccessFile3;
        String str = strArr[0];
        String str2 = strArr[1];
        HttpURLConnection httpURLConnection3 = null;
        InputStream inputStream3 = null;
        HttpURLConnection httpURLConnection4 = null;
        InputStream inputStream4 = null;
        RandomAccessFile randomAccessFile4 = null;
        try {
            try {
                URL url = new URL(str2);
                httpURLConnection = null;
                InputStream inputStream5 = null;
                HttpURLConnection httpURLConnection5 = null;
                InputStream inputStream6 = null;
                HttpURLConnection httpURLConnection6 = null;
                InputStream inputStream7 = null;
                HttpURLConnection httpURLConnection7 = null;
                inputStream = null;
                try {
                    HttpURLConnection httpURLConnection8 = (HttpURLConnection) url.openConnection();
                    httpURLConnection8.setRequestProperty("Range", "bytes=0-1024");
                    httpURLConnection8.connect();
                    boolean z = httpURLConnection8.getContentLength() == 1025;
                    if (httpURLConnection8 != null) {
                        httpURLConnection8.disconnect();
                    }
                    httpURLConnection4 = (HttpURLConnection) url.openConnection();
                    httpURLConnection4.setConnectTimeout(TFTP.DEFAULT_TIMEOUT);
                    httpURLConnection4.setRequestMethod(HttpGet.METHOD_NAME);
                    httpURLConnection4.setRequestProperty("Accept", "image/gif, image/jpeg, image/pjpeg, image/pjpeg, application/x-shockwave-flash, application/xaml+xml, application/vnd.ms-xpsdocument, application/x-ms-xbap, application/x-ms-application, application/vnd.ms-excel, application/vnd.ms-powerpoint, application/msword, */*");
                    httpURLConnection4.setRequestProperty("Accept-Language", "zh-CN");
                    httpURLConnection4.setRequestProperty("Referer", str2);
                    httpURLConnection4.setRequestProperty("Charset", "UTF-8");
                    httpURLConnection4.setRequestProperty(HTTP.USER_AGENT, "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)");
                    httpURLConnection4.setRequestProperty(HTTP.CONN_DIRECTIVE, HTTP.CONN_KEEP_ALIVE);
                    File file = new File(String.valueOf(AppEnvironment.FOLDER_EDUTECH) + str);
                    long j = 0;
                    if (file.exists()) {
                        j = z ? file.length() : 0L;
                        httpURLConnection4.setRequestProperty("Range", "bytes=" + j + "-");
                    } else {
                        FileInOutHelper.createNewFile(file);
                    }
                    httpURLConnection4.connect();
                    long contentLength = httpURLConnection4.getContentLength();
                    if (contentLength == -1) {
                        this.downloadsize = -1L;
                    }
                    inputStream4 = httpURLConnection4.getInputStream();
                    httpURLConnection = httpURLConnection4;
                    inputStream5 = inputStream4;
                    httpURLConnection5 = httpURLConnection4;
                    inputStream6 = inputStream4;
                    httpURLConnection6 = httpURLConnection4;
                    inputStream7 = inputStream4;
                    httpURLConnection7 = httpURLConnection4;
                    inputStream = inputStream4;
                    randomAccessFile4 = new RandomAccessFile(file, "rw");
                    try {
                        randomAccessFile4.seek(j);
                        byte[] bArr = new byte[peerdata];
                        long j2 = j;
                        while (true) {
                            if (this.finished) {
                                while (this.paused) {
                                    Thread.sleep(500L);
                                }
                                int read = inputStream4.read(bArr);
                                if (read == -1) {
                                    break;
                                }
                                randomAccessFile4.write(bArr, 0, read);
                                j2 += read;
                                if (j2 == contentLength + j) {
                                    this.isFinish = true;
                                    break;
                                }
                                Thread.sleep(10L);
                            } else {
                                break;
                            }
                        }
                        inputStream4.close();
                        randomAccessFile4.close();
                        httpURLConnection4.disconnect();
                        this.finished = false;
                        httpURLConnection4 = httpURLConnection4;
                        if (inputStream4 != null) {
                            try {
                                inputStream4.close();
                                if (randomAccessFile4 != null) {
                                    randomAccessFile4.close();
                                }
                                httpURLConnection4 = httpURLConnection4;
                                if (httpURLConnection4 != null) {
                                    httpURLConnection4.disconnect();
                                    httpURLConnection4 = httpURLConnection4;
                                }
                            } catch (IOException e2) {
                                e2.printStackTrace();
                                httpURLConnection4 = e2;
                            }
                        }
                    } catch (IOException e3) {
                        e = e3;
                        randomAccessFile2 = randomAccessFile4;
                        inputStream = inputStream4;
                        httpURLConnection2 = httpURLConnection4;
                        HttpURLConnection httpURLConnection9 = httpURLConnection2;
                        inputStream4 = inputStream;
                        randomAccessFile4 = randomAccessFile2;
                        e.printStackTrace();
                        this.finished = false;
                        httpURLConnection4 = httpURLConnection9;
                        if (inputStream != null) {
                            try {
                                inputStream.close();
                                if (randomAccessFile2 != null) {
                                    randomAccessFile2.close();
                                }
                                httpURLConnection4 = httpURLConnection9;
                                if (httpURLConnection2 != null) {
                                    httpURLConnection2.disconnect();
                                    httpURLConnection4 = httpURLConnection9;
                                }
                            } catch (IOException e4) {
                                e4.printStackTrace();
                                httpURLConnection4 = e4;
                            }
                        }
                        return str2;
                    } catch (InterruptedException e5) {
                        e = e5;
                        httpURLConnection3 = httpURLConnection4;
                        inputStream2 = inputStream4;
                        randomAccessFile3 = randomAccessFile4;
                        HttpURLConnection httpURLConnection10 = httpURLConnection3;
                        inputStream4 = inputStream2;
                        randomAccessFile4 = randomAccessFile3;
                        e.printStackTrace();
                        this.finished = false;
                        httpURLConnection4 = httpURLConnection10;
                        if (inputStream2 != null) {
                            try {
                                inputStream2.close();
                                if (randomAccessFile3 != null) {
                                    randomAccessFile3.close();
                                }
                                httpURLConnection4 = httpURLConnection10;
                                if (httpURLConnection3 != null) {
                                    httpURLConnection3.disconnect();
                                    httpURLConnection4 = httpURLConnection10;
                                }
                            } catch (IOException e6) {
                                e6.printStackTrace();
                                httpURLConnection4 = e6;
                            }
                        }
                        return str2;
                    } catch (MalformedURLException e7) {
                        e = e7;
                        httpURLConnection = httpURLConnection4;
                        inputStream3 = inputStream4;
                        randomAccessFile = randomAccessFile4;
                        HttpURLConnection httpURLConnection11 = httpURLConnection;
                        inputStream4 = inputStream3;
                        randomAccessFile4 = randomAccessFile;
                        e.printStackTrace();
                        this.finished = false;
                        httpURLConnection4 = httpURLConnection11;
                        if (inputStream3 != null) {
                            try {
                                inputStream3.close();
                                if (randomAccessFile != null) {
                                    randomAccessFile.close();
                                }
                                httpURLConnection4 = httpURLConnection11;
                                if (httpURLConnection != null) {
                                    httpURLConnection.disconnect();
                                    httpURLConnection4 = httpURLConnection11;
                                }
                            } catch (IOException e8) {
                                e8.printStackTrace();
                                httpURLConnection4 = e8;
                            }
                        }
                        return str2;
                    } catch (Throwable th2) {
                        th = th2;
                        this.finished = false;
                        if (inputStream4 != null) {
                            try {
                                inputStream4.close();
                                if (randomAccessFile4 != null) {
                                    randomAccessFile4.close();
                                }
                                if (httpURLConnection4 != null) {
                                    httpURLConnection4.disconnect();
                                }
                            } catch (IOException e9) {
                                e9.printStackTrace();
                            }
                        }
                        throw th;
                    }
                } catch (InterruptedException e10) {
                    e = e10;
                    httpURLConnection3 = httpURLConnection6;
                    inputStream2 = inputStream7;
                    randomAccessFile3 = null;
                } catch (MalformedURLException e11) {
                    e = e11;
                    randomAccessFile = null;
                    inputStream3 = inputStream5;
                } catch (IOException e12) {
                    e = e12;
                    httpURLConnection2 = httpURLConnection7;
                    randomAccessFile2 = null;
                } catch (Throwable th3) {
                    th = th3;
                    httpURLConnection4 = httpURLConnection5;
                    inputStream4 = inputStream6;
                    randomAccessFile4 = null;
                }
            } catch (Throwable th4) {
                th = th4;
            }
        } catch (IOException e13) {
            e = e13;
            httpURLConnection2 = null;
            inputStream = null;
            randomAccessFile2 = null;
        } catch (InterruptedException e14) {
            e = e14;
            randomAccessFile3 = null;
            inputStream2 = null;
        } catch (MalformedURLException e15) {
            e = e15;
            httpURLConnection = null;
            randomAccessFile = null;
        }
        return str2;
    }

    public boolean isPaused() {
        return this.paused;
    }

    @Override // android.os.AsyncTask
    protected void onCancelled() {
        this.finished = false;
        super.onCancelled();
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0027, code lost:
        r5.finished = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:11:0x0030, code lost:
        if (r5.isFinish == false) goto L25;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0033, code lost:
        r0 = com.edutech.idauthentication.MainActivity.apkdownloadlist.iterator();
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0042, code lost:
        if (r0.hasNext() != false) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0048, code lost:
        com.edutech.idauthentication.MainActivity.apkTaskList.remove(r7);
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x005a, code lost:
        r0 = r0.next();
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x006e, code lost:
        if (r0.get("appwebpath") == null) goto L45;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0080, code lost:
        if (r0.get("appwebpath").equals(r6) == false) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0083, code lost:
        com.edutech.idauthentication.MainActivity.apkfinList.add(java.lang.String.valueOf(com.edutech.idauthentication.AppEnvironment.FOLDER_EDUTECH) + r0.get("appname"));
        com.edutech.idauthentication.MainActivity.apkdownloadlist.remove(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x00bd, code lost:
        r0 = com.edutech.idauthentication.MainActivity.apkdownloadlist.iterator();
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x00cc, code lost:
        if (r0.hasNext() == false) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x00cf, code lost:
        r0 = r0.next();
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x00e3, code lost:
        if (r0.get("appwebpath") == null) goto L51;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00f5, code lost:
        if (r0.get("appwebpath").equals(r6) == false) goto L52;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x00f8, code lost:
        r0 = java.lang.Integer.valueOf(r0.get("redownload_count")).intValue();
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x010c, code lost:
        if (r0 >= 3) goto L37;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x010f, code lost:
        r0.put("redownload_count", java.lang.String.valueOf(r0 + 1));
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0121, code lost:
        com.edutech.idauthentication.MainActivity.apkfinList.add(java.lang.String.valueOf(com.edutech.idauthentication.AppEnvironment.FOLDER_EDUTECH) + r0.get("appname"));
        com.edutech.idauthentication.MainActivity.apkdownloadlist.remove(r0);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void onPostExecute(String str) {
        int i = 0;
        while (true) {
            try {
                if (i >= MainActivity.apkTaskList.size()) {
                    break;
                } else if (MainActivity.apkTaskList.get(i).get(str) != null) {
                    break;
                } else {
                    i++;
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        super.onPostExecute((Async) str);
    }

    @Override // android.os.AsyncTask
    protected void onPreExecute() {
        super.onPreExecute();
    }

    public void onProgressUpdate(Integer... numArr) {
        listPb.get(numArr[1].intValue()).setProgress(numArr[0].intValue());
        super.onProgressUpdate((Object[]) numArr);
    }

    public void pause() {
        this.paused = true;
    }
}
