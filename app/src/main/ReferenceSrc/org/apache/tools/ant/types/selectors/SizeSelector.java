package org.apache.tools.ant.types.selectors;

import java.io.File;
import org.apache.commons.io.FileUtils;
import org.apache.tools.ant.types.Comparison;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.Parameter;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/SizeSelector.class */
public class SizeSelector extends BaseExtendSelector {
    private static final int END_POS = 36;
    private static final long GIBI = 1073741824;
    private static final int GIBI_POS = 22;
    private static final long GIGA = 1000000000;
    private static final int GIGA_POS = 18;
    private static final int KIBI = 1024;
    private static final int KIBI_POS = 4;
    private static final int KILO = 1000;
    private static final int MEBI = 1048576;
    private static final int MEBI_POS = 13;
    private static final int MEGA = 1000000;
    private static final int MEGA_POS = 9;
    public static final String SIZE_KEY = "value";
    private static final long TEBI = 1099511627776L;
    private static final int TEBI_POS = 31;
    private static final long TERA = 1000000000000L;
    private static final int TERA_POS = 27;
    public static final String UNITS_KEY = "units";
    public static final String WHEN_KEY = "when";
    private long size = -1;
    private long multiplier = 1;
    private long sizelimit = -1;
    private Comparison when = Comparison.EQUAL;

    /* loaded from: classes.jar:org/apache/tools/ant/types/selectors/SizeSelector$ByteUnits.class */
    public static class ByteUnits extends EnumeratedAttribute {
        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"K", "k", "kilo", "KILO", "Ki", "KI", "ki", "kibi", "KIBI", "M", "m", "mega", "MEGA", "Mi", "MI", "mi", "mebi", "MEBI", "G", "g", "giga", "GIGA", "Gi", "GI", "gi", "gibi", "GIBI", "T", "t", "tera", "TERA", "Ti", "TI", "ti", "tebi", "TEBI"};
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/types/selectors/SizeSelector$SizeComparisons.class */
    public static class SizeComparisons extends Comparison {
    }

    @Override // org.apache.tools.ant.types.selectors.BaseExtendSelector, org.apache.tools.ant.types.selectors.BaseSelector, org.apache.tools.ant.types.selectors.FileSelector
    public boolean isSelected(File file, String str, File file2) {
        boolean evaluate;
        validate();
        if (file2.isDirectory()) {
            evaluate = true;
        } else {
            long length = file2.length() - this.sizelimit;
            evaluate = this.when.evaluate(length == 0 ? 0 : (int) (length / Math.abs(length)));
        }
        return evaluate;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:12:0x0035 -> B:10:0x002e). Please submit an issue!!! */
    @Override // org.apache.tools.ant.types.selectors.BaseExtendSelector, org.apache.tools.ant.types.Parameterizable
    public void setParameters(Parameter[] parameterArr) {
        super.setParameters(parameterArr);
        if (parameterArr != null) {
            for (int i = 0; i < parameterArr.length; i++) {
                String name = parameterArr[i].getName();
                if (SIZE_KEY.equalsIgnoreCase(name)) {
                    try {
                        setValue(Long.parseLong(parameterArr[i].getValue()));
                    } catch (NumberFormatException e) {
                        setError(new StringBuffer().append("Invalid size setting ").append(parameterArr[i].getValue()).toString());
                    }
                } else if (UNITS_KEY.equalsIgnoreCase(name)) {
                    ByteUnits byteUnits = new ByteUnits();
                    byteUnits.setValue(parameterArr[i].getValue());
                    setUnits(byteUnits);
                } else if ("when".equalsIgnoreCase(name)) {
                    SizeComparisons sizeComparisons = new SizeComparisons();
                    sizeComparisons.setValue(parameterArr[i].getValue());
                    setWhen(sizeComparisons);
                } else {
                    setError(new StringBuffer().append("Invalid parameter ").append(name).toString());
                }
            }
        }
    }

    public void setUnits(ByteUnits byteUnits) {
        int index = byteUnits.getIndex();
        this.multiplier = 0L;
        if (index > -1 && index < 4) {
            this.multiplier = 1000L;
        } else if (index < 9) {
            this.multiplier = 1024L;
        } else if (index < 13) {
            this.multiplier = 1000000L;
        } else if (index < 18) {
            this.multiplier = FileUtils.ONE_MB;
        } else if (index < 22) {
            this.multiplier = GIGA;
        } else if (index < 27) {
            this.multiplier = 1073741824L;
        } else if (index < 31) {
            this.multiplier = TERA;
        } else if (index < 36) {
            this.multiplier = 1099511627776L;
        }
        if (this.multiplier <= 0 || this.size <= -1) {
            return;
        }
        this.sizelimit = this.size * this.multiplier;
    }

    public void setValue(long j) {
        this.size = j;
        if (this.multiplier == 0 || j <= -1) {
            return;
        }
        this.sizelimit = this.multiplier * j;
    }

    public void setWhen(SizeComparisons sizeComparisons) {
        this.when = sizeComparisons;
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        StringBuffer stringBuffer = new StringBuffer("{sizeselector value: ");
        stringBuffer.append(this.sizelimit);
        stringBuffer.append("compare: ").append(this.when.getValue());
        stringBuffer.append("}");
        return stringBuffer.toString();
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelector
    public void verifySettings() {
        if (this.size < 0) {
            setError("The value attribute is required, and must be positive");
        } else if (this.multiplier < 1) {
            setError("Invalid Units supplied, must be K,Ki,M,Mi,G,Gi,T,or Ti");
        } else if (this.sizelimit >= 0) {
        } else {
            setError("Internal error: Code is not setting sizelimit correctly");
        }
    }
}
