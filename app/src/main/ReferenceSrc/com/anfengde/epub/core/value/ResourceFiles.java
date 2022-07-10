package com.anfengde.epub.core.value;

import android.content.Context;
import com.anfengde.epub.ui.R;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class ResourceFiles {
    private static ArrayList<ResourceData> getImageResourceArray() {
        ArrayList<ResourceData> resourceArray = new ArrayList<>();
        ResourceData resourceData = new ResourceData();
        resourceData.resourceId = R.drawable.afd_back;
        resourceData.resourceName = "afd_back.png";
        resourceArray.add(resourceData);
        ResourceData resourceData2 = new ResourceData();
        resourceData2.resourceId = R.drawable.afd_tablecontentsbtn;
        resourceData2.resourceName = "afd_tablecontentsbtn.png";
        resourceArray.add(resourceData2);
        ResourceData resourceData3 = new ResourceData();
        resourceData3.resourceId = R.drawable.afd_fontsize;
        resourceData3.resourceName = "afd_fontsize.png";
        resourceArray.add(resourceData3);
        ResourceData resourceData4 = new ResourceData();
        resourceData4.resourceId = R.drawable.afd_font_zoomin;
        resourceData4.resourceName = "afd_font_zoomin.png";
        resourceArray.add(resourceData4);
        ResourceData resourceData5 = new ResourceData();
        resourceData5.resourceId = R.drawable.afd_font_zoomout;
        resourceData5.resourceName = "afd_font_zoomout.png";
        resourceArray.add(resourceData5);
        ResourceData resourceData6 = new ResourceData();
        resourceData6.resourceId = R.drawable.afd_bookmark;
        resourceData6.resourceName = "afd_bookmark.png";
        resourceArray.add(resourceData6);
        ResourceData resourceData7 = new ResourceData();
        resourceData7.resourceId = R.drawable.afd_topmenu;
        resourceData7.resourceName = "afd_topmenu.png";
        resourceArray.add(resourceData7);
        ResourceData resourceData8 = new ResourceData();
        resourceData8.resourceId = R.drawable.afd_backreadview;
        resourceData8.resourceName = "afd_backreadview.png";
        resourceArray.add(resourceData8);
        ResourceData resourceData9 = new ResourceData();
        resourceData9.resourceId = R.drawable.afd_white_left;
        resourceData9.resourceName = "afd_white_left.png";
        resourceArray.add(resourceData9);
        ResourceData resourceData10 = new ResourceData();
        resourceData10.resourceId = R.drawable.afd_white_right;
        resourceData10.resourceName = "afd_white_right.png";
        resourceArray.add(resourceData10);
        ResourceData resourceData11 = new ResourceData();
        resourceData11.resourceId = R.drawable.afd_green_left;
        resourceData11.resourceName = "afd_green_left.png";
        resourceArray.add(resourceData11);
        ResourceData resourceData12 = new ResourceData();
        resourceData12.resourceId = R.drawable.afd_green_right;
        resourceData12.resourceName = "afd_green_right.png";
        resourceArray.add(resourceData12);
        ResourceData resourceData13 = new ResourceData();
        resourceData13.resourceId = R.drawable.afd_bookmark_yellow;
        resourceData13.resourceName = "afd_bookmark_yellow.png";
        resourceArray.add(resourceData13);
        ResourceData resourceData14 = new ResourceData();
        resourceData14.resourceId = R.drawable.afd_deletebg;
        resourceData14.resourceName = "afd_deletebg.png";
        resourceArray.add(resourceData14);
        ResourceData resourceData15 = new ResourceData();
        resourceData15.resourceId = R.drawable.afd_delete;
        resourceData15.resourceName = "afd_delete.png";
        resourceArray.add(resourceData15);
        ResourceData resourceData16 = new ResourceData();
        resourceData16.resourceId = R.drawable.afd_drug;
        resourceData16.resourceName = "afd_drug.png";
        resourceArray.add(resourceData16);
        ResourceData resourceData17 = new ResourceData();
        resourceData17.resourceId = R.drawable.afd_prev;
        resourceData17.resourceName = "afd_prev.png";
        resourceArray.add(resourceData17);
        ResourceData resourceData18 = new ResourceData();
        resourceData18.resourceId = R.drawable.afd_next;
        resourceData18.resourceName = "afd_next.png";
        resourceArray.add(resourceData18);
        ResourceData resourceData19 = new ResourceData();
        resourceData19.resourceId = R.drawable.afd_skip;
        resourceData19.resourceName = "afd_skip.png";
        resourceArray.add(resourceData19);
        ResourceData resourceData20 = new ResourceData();
        resourceData20.resourceId = R.drawable.afd_setting;
        resourceData20.resourceName = "afd_setting.png";
        resourceArray.add(resourceData20);
        ResourceData resourceData21 = new ResourceData();
        resourceData21.resourceId = R.drawable.afd_bright;
        resourceData21.resourceName = "afd_bright.png";
        resourceArray.add(resourceData21);
        ResourceData resourceData22 = new ResourceData();
        resourceData22.resourceId = R.drawable.afd_day;
        resourceData22.resourceName = "afd_day.png";
        resourceArray.add(resourceData22);
        ResourceData resourceData23 = new ResourceData();
        resourceData23.resourceId = R.drawable.afd_divide;
        resourceData23.resourceName = "afd_divide.png";
        resourceArray.add(resourceData23);
        ResourceData resourceData24 = new ResourceData();
        resourceData24.resourceId = R.drawable.afd_night;
        resourceData24.resourceName = "afd_night.png";
        resourceArray.add(resourceData24);
        ResourceData resourceData25 = new ResourceData();
        resourceData25.resourceId = R.drawable.afd_index_add;
        resourceData25.resourceName = "afd_index_add.png";
        resourceArray.add(resourceData25);
        ResourceData resourceData26 = new ResourceData();
        resourceData26.resourceId = R.drawable.afd_index_bg_image;
        resourceData26.resourceName = "afd_index_bg_image.png";
        resourceArray.add(resourceData26);
        ResourceData resourceData27 = new ResourceData();
        resourceData27.resourceId = R.drawable.afd_index_bookbase;
        resourceData27.resourceName = "afd_index_bookbase.png";
        resourceArray.add(resourceData27);
        ResourceData resourceData28 = new ResourceData();
        resourceData28.resourceId = R.drawable.afd_index_edit;
        resourceData28.resourceName = "afd_index_edit.png";
        resourceArray.add(resourceData28);
        ResourceData resourceData29 = new ResourceData();
        resourceData29.resourceId = R.drawable.afd_index_quit;
        resourceData29.resourceName = "afd_index_quit.png";
        resourceArray.add(resourceData29);
        ResourceData resourceData30 = new ResourceData();
        resourceData30.resourceId = R.drawable.afd_coverimg;
        resourceData30.resourceName = "afd_coverimg.png";
        resourceArray.add(resourceData30);
        ResourceData resourceData31 = new ResourceData();
        resourceData31.resourceId = R.drawable.afd_edit_allorang;
        resourceData31.resourceName = "afd_edit_allorang.png";
        resourceArray.add(resourceData31);
        ResourceData resourceData32 = new ResourceData();
        resourceData32.resourceId = R.drawable.afd_edit_all;
        resourceData32.resourceName = "afd_edit_all.png";
        resourceArray.add(resourceData32);
        ResourceData resourceData33 = new ResourceData();
        resourceData33.resourceId = R.drawable.afd_edit_back;
        resourceData33.resourceName = "afd_edit_back.png";
        resourceArray.add(resourceData33);
        ResourceData resourceData34 = new ResourceData();
        resourceData34.resourceId = R.drawable.afd_edit_cancel;
        resourceData34.resourceName = "afd_edit_cancel.png";
        resourceArray.add(resourceData34);
        ResourceData resourceData35 = new ResourceData();
        resourceData35.resourceId = R.drawable.afd_edit_del;
        resourceData35.resourceName = "afd_edit_del.png";
        resourceArray.add(resourceData35);
        ResourceData resourceData36 = new ResourceData();
        resourceData36.resourceId = R.drawable.afd_edit_selected;
        resourceData36.resourceName = "afd_edit_selected.png";
        resourceArray.add(resourceData36);
        ResourceData resourceData37 = new ResourceData();
        resourceData37.resourceId = R.drawable.afd_import_currenth3bg;
        resourceData37.resourceName = "afd_import_currenth3bg.png";
        resourceArray.add(resourceData37);
        ResourceData resourceData38 = new ResourceData();
        resourceData38.resourceId = R.drawable.afd_import_h3bg;
        resourceData38.resourceName = "afd_import_h3bg.png";
        resourceArray.add(resourceData38);
        ResourceData resourceData39 = new ResourceData();
        resourceData39.resourceId = R.drawable.afd_import_local;
        resourceData39.resourceName = "afd_import_local.png";
        resourceArray.add(resourceData39);
        ResourceData resourceData40 = new ResourceData();
        resourceData40.resourceId = R.drawable.afd_import_net;
        resourceData40.resourceName = "afd_import_net.png";
        resourceArray.add(resourceData40);
        ResourceData resourceData41 = new ResourceData();
        resourceData41.resourceId = R.drawable.afd_import_popuptabbg;
        resourceData41.resourceName = "afd_import_popuptabbg.png";
        resourceArray.add(resourceData41);
        ResourceData resourceData42 = new ResourceData();
        resourceData42.resourceId = R.drawable.afd_import_titlebg;
        resourceData42.resourceName = "afd_import_titlebg.png";
        resourceArray.add(resourceData42);
        ResourceData resourceData43 = new ResourceData();
        resourceData43.resourceId = R.drawable.afd_import_wifi;
        resourceData43.resourceName = "afd_import_wifi.png";
        resourceArray.add(resourceData43);
        ResourceData resourceData44 = new ResourceData();
        resourceData44.resourceId = R.drawable.afd_tts;
        resourceData44.resourceName = "afd_tts.png";
        resourceArray.add(resourceData44);
        ResourceData resourceData45 = new ResourceData();
        resourceData45.resourceId = R.drawable.twitter_bird_callout;
        resourceData45.resourceName = "twitter_bird_callout.png";
        resourceArray.add(resourceData45);
        ResourceData resourceData46 = new ResourceData();
        resourceData46.resourceId = R.drawable.gplus_64;
        resourceData46.resourceName = "gplus_64.png";
        resourceArray.add(resourceData46);
        ResourceData resourceData47 = new ResourceData();
        resourceData47.resourceId = R.drawable.afd_bookshelf;
        resourceData47.resourceName = "afd_bookshelf.png";
        resourceArray.add(resourceData47);
        ResourceData resourceData48 = new ResourceData();
        resourceData48.resourceId = R.drawable.afd_bookbase;
        resourceData48.resourceName = "afd_bookbase.png";
        resourceArray.add(resourceData48);
        ResourceData resourceData49 = new ResourceData();
        resourceData49.resourceId = R.drawable.afd_quit;
        resourceData49.resourceName = "afd_quit.png";
        resourceArray.add(resourceData49);
        ResourceData resourceData50 = new ResourceData();
        resourceData50.resourceId = R.drawable.afd_storemenu;
        resourceData50.resourceName = "afd_storemenu.png";
        resourceArray.add(resourceData50);
        ResourceData resourceData51 = new ResourceData();
        resourceData51.resourceId = R.drawable.afd_bookshelf_border;
        resourceData51.resourceName = "afd_bookshelf_border.png";
        resourceArray.add(resourceData51);
        return resourceArray;
    }

    private static ArrayList<ResourceData> getHtmlResourceArray() {
        ArrayList<ResourceData> resourceArray = new ArrayList<>();
        ResourceData resourceData = new ResourceData();
        resourceData.resourceId = R.raw.toc;
        resourceData.resourceName = "toc.html";
        resourceArray.add(resourceData);
        ResourceData resourceData2 = new ResourceData();
        resourceData2.resourceId = R.raw.index;
        resourceData2.resourceName = "index.html";
        resourceArray.add(resourceData2);
        ResourceData resourceData3 = new ResourceData();
        resourceData3.resourceId = R.raw.setting;
        resourceData3.resourceName = "setting.html";
        resourceArray.add(resourceData3);
        return resourceArray;
    }

    private static ArrayList<ResourceData> getJSResourceArray() {
        ArrayList<ResourceData> resourceArray = new ArrayList<>();
        ResourceData resourceData = new ResourceData();
        resourceData.resourceId = R.raw.control;
        resourceData.resourceName = "control.js";
        resourceArray.add(resourceData);
        ResourceData resourceData2 = new ResourceData();
        resourceData2.resourceId = R.raw.jtoc;
        resourceData2.resourceName = "jtoc.js";
        resourceArray.add(resourceData2);
        ResourceData resourceData3 = new ResourceData();
        resourceData3.resourceId = R.raw.jquery;
        resourceData3.resourceName = "jquery.min.js";
        resourceArray.add(resourceData3);
        ResourceData resourceData4 = new ResourceData();
        resourceData4.resourceId = R.raw.jsetting;
        resourceData4.resourceName = "jsetting.js";
        resourceArray.add(resourceData4);
        ResourceData resourceData5 = new ResourceData();
        resourceData5.resourceId = R.raw.jindex;
        resourceData5.resourceName = "jindex.js";
        resourceArray.add(resourceData5);
        ResourceData resourceData6 = new ResourceData();
        resourceData6.resourceId = R.raw.rangyserializer;
        resourceData6.resourceName = "rangyserializer.js";
        resourceArray.add(resourceData6);
        ResourceData resourceData7 = new ResourceData();
        resourceData7.resourceId = R.raw.rangycore;
        resourceData7.resourceName = "rangycore.js";
        resourceArray.add(resourceData7);
        ResourceData resourceData8 = new ResourceData();
        resourceData8.resourceId = R.raw.androidselection;
        resourceData8.resourceName = "androidselection.js";
        resourceArray.add(resourceData8);
        return resourceArray;
    }

    private static ArrayList<ResourceData> getCSSResourceArray() {
        ArrayList<ResourceData> resourceArray = new ArrayList<>();
        ResourceData resourceData = new ResourceData();
        resourceData.resourceId = R.raw.sindex;
        resourceData.resourceName = "sindex.css";
        resourceArray.add(resourceData);
        ResourceData resourceData2 = new ResourceData();
        resourceData2.resourceId = R.raw.readpage;
        resourceData2.resourceName = "readpage.css";
        resourceArray.add(resourceData2);
        ResourceData resourceData3 = new ResourceData();
        resourceData3.resourceId = R.raw.ssetting;
        resourceData3.resourceName = "ssetting.css";
        resourceArray.add(resourceData3);
        ResourceData resourceData4 = new ResourceData();
        resourceData4.resourceId = R.raw.stoc;
        resourceData4.resourceName = "stoc.css";
        resourceArray.add(resourceData4);
        return resourceArray;
    }

    private static void writeFilesToSdacrd(ArrayList<ResourceData> resourceArray, String folder, String afd_cachePath, Context context) {
        Exception e;
        for (int i = 0; i < resourceArray.size(); i++) {
            int fileID = resourceArray.get(i).resourceId;
            String fileName = resourceArray.get(i).resourceName;
            String pathName = String.valueOf(afd_cachePath) + "/" + folder + "/" + fileName;
            File file = new File(pathName);
            if (!file.exists()) {
                try {
                    InputStream input = context.getResources().openRawResource(fileID);
                    String dir = String.valueOf(afd_cachePath) + "/" + folder;
                    new File(dir).mkdir();
                    while (true) {
                        try {
                            file.createNewFile();
                            break;
                        } catch (Exception e2) {
                            Thread.sleep(50L);
                        }
                    }
                    OutputStream output = new FileOutputStream(file);
                    try {
                        byte[] buffer = new byte[4096];
                        while (true) {
                            int len = input.read(buffer);
                            if (len == -1) {
                                break;
                            }
                            output.write(buffer, 0, len);
                        }
                        output.flush();
                    } catch (Exception e3) {
                        e = e3;
                        e.printStackTrace();
                    }
                } catch (Exception e4) {
                    e = e4;
                }
            }
        }
    }

    public static void copyResourceFiles(String cachePath, Context context) {
        new ArrayList();
        ArrayList<ResourceData> imageArray = getImageResourceArray();
        writeFilesToSdacrd(imageArray, "image", cachePath, context);
        new ArrayList();
        ArrayList<ResourceData> htmlArray = getHtmlResourceArray();
        writeFilesToSdacrd(htmlArray, "html", cachePath, context);
        new ArrayList();
        ArrayList<ResourceData> jsArray = getJSResourceArray();
        writeFilesToSdacrd(jsArray, "js", cachePath, context);
        new ArrayList();
        ArrayList<ResourceData> cssArray = getCSSResourceArray();
        writeFilesToSdacrd(cssArray, "css", cachePath, context);
    }
}
