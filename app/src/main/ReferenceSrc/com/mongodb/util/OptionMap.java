package com.mongodb.util;

import java.util.TreeMap;
@Deprecated
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class OptionMap extends TreeMap<String, String> {
    private static final long serialVersionUID = -4415279469780082174L;

    public int getInt(String name, int def) {
        return StringParseUtil.parseIfInt(get(name), def);
    }
}
