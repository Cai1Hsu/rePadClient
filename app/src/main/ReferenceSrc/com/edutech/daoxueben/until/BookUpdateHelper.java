package com.edutech.daoxueben.until;

import android.util.Log;
import com.edutech.daoxueben.sysconfig.AppEnvironment;
import com.edutech.json.JsonPort;
import com.edutech.json.KeyEnvironment;
import com.edutech.json.Tree;
import com.edutech.publicedu.log.LogHelp;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSSConstants;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/* loaded from: classes.dex */
public class BookUpdateHelper {
    public ArrayList<BookUpdateInfo> JsonUpdateHttpPost(String ip, String studentid, String json, ArrayList<BookUpdateInfo> updateinfo) {
        String url = AppEnvironment.UPDATEJSON_HTTPPOST_URL(ip, studentid);
        if (json == null || "".equals(json)) {
            return updateinfo;
        }
        HttpPost httpRequest = new HttpPost(url);
        List<NameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("data", json));
        try {
            httpRequest.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
            HttpResponse httpResponse = new DefaultHttpClient().execute(httpRequest);
            if (httpResponse.getStatusLine().getStatusCode() == 200) {
                String strResult = EntityUtils.toString(httpResponse.getEntity());
                return parseHttpPostReturnJson(strResult, updateinfo);
            }
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        } catch (Exception e3) {
            e3.printStackTrace();
        }
        return updateinfo;
    }

    public ArrayList<BookUpdateInfo> parseHttpPostReturnJson(String json, ArrayList<BookUpdateInfo> updateinfo) {
        if (!"".equals(json)) {
            try {
                JSONTokener jsonTokener = new JSONTokener(json);
                JSONObject jsonObject = (JSONObject) jsonTokener.nextValue();
                boolean status = JsonHelper.getBooleanPropertyName(jsonObject, "status");
                int errorNum = JsonHelper.getIntPropertyName(jsonObject, "errorNum");
                String errorInfo = JsonHelper.getPropertyName(jsonObject, "errorInfo");
                JSONArray array = jsonObject.getJSONArray("data");
                for (int i = 0; i < array.length(); i++) {
                    JSONObject object = array.getJSONObject(i);
                    String id = JsonHelper.getPropertyName(object, "id");
                    String type = JsonHelper.getPropertyName(object, "type");
                    String source = JsonHelper.getPropertyName(object, "source");
                    boolean updated = JsonHelper.getBooleanPropertyName(object, MSVSSConstants.TIME_UPDATED);
                    String updatetime = JsonHelper.getPropertyName(object, "updatetime");
                    if (updated) {
                        Iterator<BookUpdateInfo> it = updateinfo.iterator();
                        while (true) {
                            if (!it.hasNext()) {
                                break;
                            }
                            BookUpdateInfo tempupdateinfo = it.next();
                            if (id.equals(tempupdateinfo.getid()) && type.equals(tempupdateinfo.gettype()) && source.equals(tempupdateinfo.getsource())) {
                                tempupdateinfo.setupdated(true);
                                tempupdateinfo.setupdatetime(updatetime);
                                break;
                            }
                        }
                    }
                }
                if (status && errorNum == 0) {
                    if ("".equals(errorInfo)) {
                    }
                }
            } catch (JSONException e) {
                e.printStackTrace();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return updateinfo;
    }

    public ArrayList<BookUpdateInfo> BookUpdateBook(ArrayList<BookUpdateInfo> updateinfo) {
        ArrayList<OldBooks> books = new ArrayList<>();
        Iterator<OldBooks> it = JsonHelper.booksparserJson(books).iterator();
        while (it.hasNext()) {
            OldBooks entry = it.next();
            String book_id = entry.getbook_id();
            String book_updatetime = entry.getBook_updatetime();
            int book_total = entry.getBook_total();
            BookUpdateInfo bookupdateinfo = new BookUpdateInfo();
            bookupdateinfo.setid(book_id);
            bookupdateinfo.settype(LogHelp.TYPE_GUIDANCE);
            bookupdateinfo.setsource(LogHelp.TYPE_GUIDANCE);
            bookupdateinfo.setupdatetime(book_updatetime);
            bookupdateinfo.settotal(book_total);
            updateinfo.add(bookupdateinfo);
        }
        return updateinfo;
    }

    public ArrayList<BookInfo> BookUpdateGetPeerBook(String tempbook_id, ArrayList<BookInfo> localpeerbook) {
        String bookJsonPath = String.valueOf(AppEnvironment.OFFLINE_DOWNLOAD) + tempbook_id + "//json.json";
        File bookJsonFile = new File(bookJsonPath);
        if (bookJsonFile.exists()) {
            String localjson = JsonHelper.getFileString(bookJsonPath);
            return JsonHelper.peerbookparserJson(localpeerbook, localjson);
        }
        return localpeerbook;
    }

    public ArrayList<BookUpdateInfo> BookUpdateChapter(ArrayList<BookUpdateInfo> updateinfo, ArrayList<BookInfo> books) {
        return updateinfo;
    }

    public ArrayList<BookUpdateInfo> BookUpdateSection(ArrayList<BookUpdateInfo> updateinfo, ArrayList<BookInfo> localpeerbook) {
        for (int j = 0; j < localpeerbook.size(); j++) {
            BookInfo bookinfo = localpeerbook.get(j);
            boolean isdwon = bookinfo.isIsdown();
            if (isdwon) {
                String section_id = bookinfo.getSection_id();
                String section_updatetime = bookinfo.getsection_updatetime();
                int total = bookinfo.getSection_webpath().size() + bookinfo.getExams().size();
                BookUpdateInfo bookupdateinfo = new BookUpdateInfo();
                bookupdateinfo.setid(section_id);
                bookupdateinfo.settype(LogHelp.TYPE_HWHELP);
                bookupdateinfo.setsource(LogHelp.TYPE_GUIDANCE);
                bookupdateinfo.setupdatetime(section_updatetime);
                bookupdateinfo.settotal(total);
                updateinfo.add(bookupdateinfo);
            }
        }
        return updateinfo;
    }

    public ArrayList<BookUpdateInfo> BookUpdateQuestion(ArrayList<BookUpdateInfo> updateinfo, ArrayList<BookInfo> localpeerbook) {
        for (int j = 0; j < localpeerbook.size(); j++) {
            BookInfo bookinfo = localpeerbook.get(j);
            boolean isdwon = bookinfo.isIsdown();
            if (isdwon) {
                bookinfo.getSection_id();
                bookinfo.getsection_updatetime();
                int size = bookinfo.getSection_webpath().size() + bookinfo.getExams().size();
            }
        }
        return updateinfo;
    }

    public ArrayList<BookInfo> BookUpdateLocalJson(ArrayList<BookInfo> localpeerbook, String sectionid) {
        int j = 0;
        while (true) {
            if (j >= localpeerbook.size()) {
                break;
            }
            BookInfo bookinfo = localpeerbook.get(j);
            boolean isdwon = bookinfo.isIsdown();
            if (isdwon) {
                String section_id = bookinfo.getSection_id();
                if (section_id.equals(sectionid)) {
                    localpeerbook.get(j).setIsnew(true);
                    break;
                }
            }
            j++;
        }
        return localpeerbook;
    }

    public void BookUpdateLocalJsonJson(ArrayList<BookInfo> localpeerbook, String book_id) {
        String NewBookPath = String.valueOf(AppEnvironment.OFFLINE_DOWNLOAD) + book_id;
        String Newjson = JsonHelper.peerbookcreateJson(localpeerbook);
        Log.d("CreateJson", "BookUpdateLocalJsonJson" + Newjson);
        JsonHelper.CreateFile(Newjson, String.valueOf(NewBookPath) + "//json.json");
    }

    public void BookUpdateLocalBookJson(ArrayList<BookUpdateInfo> updateinfo) {
        ArrayList<OldBooks> books = JsonHelper.booksparserJson(new ArrayList<>());
        Iterator<BookUpdateInfo> it = updateinfo.iterator();
        while (it.hasNext()) {
            BookUpdateInfo tempupdateinfo = it.next();
            String tempbookid = tempupdateinfo.getid();
            Iterator<OldBooks> it2 = books.iterator();
            if (it2.hasNext()) {
                OldBooks entry = it2.next();
                if (tempbookid.equals(entry.getbook_id())) {
                    entry.setBook_isnew(tempupdateinfo.getBook_isnew());
                    entry.setBook_updatetime(tempupdateinfo.getupdatetime());
                }
            }
        }
        String Newjson = JsonHelper.bookscreateJson(books);
        JsonHelper.CreateFile(Newjson, AppEnvironment.JSON_BOOKS_File);
    }

    public Tree<HashMap<String, Object>> getLocalJsonTree(String book_id, Tree<HashMap<String, Object>> localtree, JsonPort jsonPort) {
        String bookJsonPath = String.valueOf(AppEnvironment.OFFLINE_DOWNLOAD) + book_id + "/json.json";
        File bookJsonFile = new File(bookJsonPath);
        if (bookJsonFile.exists()) {
            String localjson = JsonHelper.getFileString(bookJsonPath);
            return jsonPort.parseJson(localtree, localjson, "data", "children");
        }
        return localtree;
    }

    public Tree<HashMap<String, Object>> updateIsNew(Tree<HashMap<String, Object>> localtree, JsonPort jsonPort) {
        if (localtree != null && localtree.getHead() != null && localtree.getHead().get("id") != null) {
            localtree.getHead().get("id").toString();
        }
        return localtree;
    }

    public int getIsDownTrue(String parId, Tree<HashMap<String, Object>> localtree, HashMap<String, Object> head, JsonPort jsonPort, String key, HashMap<String, Integer> idSourceCount) {
        ArrayList<Object> examsobjectList;
        ArrayList<Object> webpathList;
        Collection<HashMap<String, Object>> Successors = localtree.getSuccessors(head);
        ArrayList<String> idList = new ArrayList<>();
        for (HashMap<String, Object> tempSuccessors : Successors) {
            if (tempSuccessors != null && tempSuccessors.get(key) != null) {
                String sourceId = tempSuccessors.get(key).toString();
                int total = 0;
                if (tempSuccessors.get(KeyEnvironment.KEYWEBPATH) != null && (webpathList = jsonPort.getValueList(new ArrayList<>(), tempSuccessors.get(KeyEnvironment.KEYWEBPATH))) != null && webpathList.size() > 0) {
                    total = 0 + webpathList.size();
                }
                if (tempSuccessors.get("exams") != null && (examsobjectList = jsonPort.getValueList(new ArrayList<>(), tempSuccessors.get("exams"))) != null && examsobjectList.size() > 0) {
                    total += examsobjectList.size();
                }
                idSourceCount.put(sourceId, Integer.valueOf(total));
                if (tempSuccessors.get("isdown") != null) {
                    boolean isdown = jsonPort.objectToBoolean(tempSuccessors, "isdown");
                    if (isdown) {
                        idList.add(sourceId);
                    }
                }
            }
        }
        return 0;
    }
}
