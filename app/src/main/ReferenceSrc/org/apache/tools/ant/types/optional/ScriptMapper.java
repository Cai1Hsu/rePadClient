package org.apache.tools.ant.types.optional;

import java.util.ArrayList;
import org.apache.tools.ant.util.FileNameMapper;

/* loaded from: classes.jar:org/apache/tools/ant/types/optional/ScriptMapper.class */
public class ScriptMapper extends AbstractScriptComponent implements FileNameMapper {
    static final String[] EMPTY_STRING_ARRAY = new String[0];
    private ArrayList files;

    public void addMappedName(String str) {
        this.files.add(str);
    }

    public void clear() {
        this.files = new ArrayList(1);
    }

    @Override // org.apache.tools.ant.util.FileNameMapper
    public String[] mapFileName(String str) {
        initScriptRunner();
        getRunner().addBean("source", str);
        clear();
        executeScript("ant_mapper");
        return this.files.size() == 0 ? null : (String[]) this.files.toArray(EMPTY_STRING_ARRAY);
    }

    @Override // org.apache.tools.ant.util.FileNameMapper
    public void setFrom(String str) {
    }

    @Override // org.apache.tools.ant.util.FileNameMapper
    public void setTo(String str) {
    }
}
