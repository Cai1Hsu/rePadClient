package org.apache.tools.ant.taskdefs.optional.depend.constantpool;

import java.io.DataInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Vector;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPool.class */
public class ConstantPool {
    private Vector entries = new Vector();
    private Hashtable utf8Indexes = new Hashtable();

    public ConstantPool() {
        this.entries.addElement(null);
    }

    public int addEntry(ConstantPoolEntry constantPoolEntry) {
        int size = this.entries.size();
        this.entries.addElement(constantPoolEntry);
        int numEntries = constantPoolEntry.getNumEntries();
        for (int i = 0; i < numEntries - 1; i++) {
            this.entries.addElement(null);
        }
        if (constantPoolEntry instanceof Utf8CPInfo) {
            this.utf8Indexes.put(((Utf8CPInfo) constantPoolEntry).getValue(), new Integer(size));
        }
        return size;
    }

    public int getClassEntry(String str) {
        int i = -1;
        int size = this.entries.size();
        int i2 = 0;
        while (i2 < size && i == -1) {
            Object elementAt = this.entries.elementAt(i2);
            int i3 = i;
            if (elementAt instanceof ClassCPInfo) {
                i3 = i;
                if (((ClassCPInfo) elementAt).getClassName().equals(str)) {
                    i3 = i2;
                }
            }
            i2++;
            i = i3;
        }
        return i;
    }

    public int getConstantEntry(Object obj) {
        int i = -1;
        int size = this.entries.size();
        int i2 = 0;
        while (i2 < size && i == -1) {
            Object elementAt = this.entries.elementAt(i2);
            int i3 = i;
            if (elementAt instanceof ConstantCPInfo) {
                i3 = i;
                if (((ConstantCPInfo) elementAt).getValue().equals(obj)) {
                    i3 = i2;
                }
            }
            i2++;
            i = i3;
        }
        return i;
    }

    public ConstantPoolEntry getEntry(int i) {
        return (ConstantPoolEntry) this.entries.elementAt(i);
    }

    public int getFieldRefEntry(String str, String str2, String str3) {
        int i = -1;
        int size = this.entries.size();
        int i2 = 0;
        while (i2 < size && i == -1) {
            Object elementAt = this.entries.elementAt(i2);
            int i3 = i;
            if (elementAt instanceof FieldRefCPInfo) {
                FieldRefCPInfo fieldRefCPInfo = (FieldRefCPInfo) elementAt;
                i3 = i;
                if (fieldRefCPInfo.getFieldClassName().equals(str)) {
                    i3 = i;
                    if (fieldRefCPInfo.getFieldName().equals(str2)) {
                        i3 = i;
                        if (fieldRefCPInfo.getFieldType().equals(str3)) {
                            i3 = i2;
                        }
                    }
                }
            }
            i2++;
            i = i3;
        }
        return i;
    }

    public int getInterfaceMethodRefEntry(String str, String str2, String str3) {
        int i = -1;
        int size = this.entries.size();
        int i2 = 0;
        while (i2 < size && i == -1) {
            Object elementAt = this.entries.elementAt(i2);
            int i3 = i;
            if (elementAt instanceof InterfaceMethodRefCPInfo) {
                InterfaceMethodRefCPInfo interfaceMethodRefCPInfo = (InterfaceMethodRefCPInfo) elementAt;
                i3 = i;
                if (interfaceMethodRefCPInfo.getInterfaceMethodClassName().equals(str)) {
                    i3 = i;
                    if (interfaceMethodRefCPInfo.getInterfaceMethodName().equals(str2)) {
                        i3 = i;
                        if (interfaceMethodRefCPInfo.getInterfaceMethodType().equals(str3)) {
                            i3 = i2;
                        }
                    }
                }
            }
            i2++;
            i = i3;
        }
        return i;
    }

    public int getMethodRefEntry(String str, String str2, String str3) {
        int i = -1;
        int size = this.entries.size();
        int i2 = 0;
        while (i2 < size && i == -1) {
            Object elementAt = this.entries.elementAt(i2);
            int i3 = i;
            if (elementAt instanceof MethodRefCPInfo) {
                MethodRefCPInfo methodRefCPInfo = (MethodRefCPInfo) elementAt;
                i3 = i;
                if (methodRefCPInfo.getMethodClassName().equals(str)) {
                    i3 = i;
                    if (methodRefCPInfo.getMethodName().equals(str2)) {
                        i3 = i;
                        if (methodRefCPInfo.getMethodType().equals(str3)) {
                            i3 = i2;
                        }
                    }
                }
            }
            i2++;
            i = i3;
        }
        return i;
    }

    public int getNameAndTypeEntry(String str, String str2) {
        int i = -1;
        int size = this.entries.size();
        int i2 = 0;
        while (i2 < size && i == -1) {
            Object elementAt = this.entries.elementAt(i2);
            int i3 = i;
            if (elementAt instanceof NameAndTypeCPInfo) {
                NameAndTypeCPInfo nameAndTypeCPInfo = (NameAndTypeCPInfo) elementAt;
                i3 = i;
                if (nameAndTypeCPInfo.getName().equals(str)) {
                    i3 = i;
                    if (nameAndTypeCPInfo.getType().equals(str2)) {
                        i3 = i2;
                    }
                }
            }
            i2++;
            i = i3;
        }
        return i;
    }

    public int getUTF8Entry(String str) {
        int i = -1;
        Integer num = (Integer) this.utf8Indexes.get(str);
        if (num != null) {
            i = num.intValue();
        }
        return i;
    }

    public void read(DataInputStream dataInputStream) throws IOException {
        int readUnsignedShort = dataInputStream.readUnsignedShort();
        int i = 1;
        while (i < readUnsignedShort) {
            ConstantPoolEntry readEntry = ConstantPoolEntry.readEntry(dataInputStream);
            i += readEntry.getNumEntries();
            addEntry(readEntry);
        }
    }

    public void resolve() {
        Enumeration elements = this.entries.elements();
        while (elements.hasMoreElements()) {
            ConstantPoolEntry constantPoolEntry = (ConstantPoolEntry) elements.nextElement();
            if (constantPoolEntry != null && !constantPoolEntry.isResolved()) {
                constantPoolEntry.resolve(this);
            }
        }
    }

    public int size() {
        return this.entries.size();
    }

    public String toString() {
        StringBuffer stringBuffer = new StringBuffer("\n");
        int size = this.entries.size();
        for (int i = 0; i < size; i++) {
            stringBuffer.append(new StringBuffer().append("[").append(i).append("] = ").append(getEntry(i)).append("\n").toString());
        }
        return stringBuffer.toString();
    }
}
