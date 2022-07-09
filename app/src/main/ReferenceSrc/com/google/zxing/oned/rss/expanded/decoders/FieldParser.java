package com.google.zxing.oned.rss.expanded.decoders;

import com.google.zxing.NotFoundException;
import org.apache.commons.compress.archivers.tar.TarConstants;

/* loaded from: classes.jar:com/google/zxing/oned/rss/expanded/decoders/FieldParser.class */
final class FieldParser {
    private static final Object VARIABLE_LENGTH = new Object();
    private static final Object[][] TWO_DIGIT_DATA_LENGTH = {new Object[]{TarConstants.VERSION_POSIX, 18}, new Object[]{"01", 14}, new Object[]{"02", 14}, new Object[]{"10", VARIABLE_LENGTH, 20}, new Object[]{"11", 6}, new Object[]{"12", 6}, new Object[]{"13", 6}, new Object[]{"15", 6}, new Object[]{"17", 6}, new Object[]{"20", 2}, new Object[]{"21", VARIABLE_LENGTH, 20}, new Object[]{"22", VARIABLE_LENGTH, 29}, new Object[]{"30", VARIABLE_LENGTH, 8}, new Object[]{"37", VARIABLE_LENGTH, 8}, new Object[]{"90", VARIABLE_LENGTH, 30}, new Object[]{"91", VARIABLE_LENGTH, 30}, new Object[]{"92", VARIABLE_LENGTH, 30}, new Object[]{"93", VARIABLE_LENGTH, 30}, new Object[]{"94", VARIABLE_LENGTH, 30}, new Object[]{"95", VARIABLE_LENGTH, 30}, new Object[]{"96", VARIABLE_LENGTH, 30}, new Object[]{"97", VARIABLE_LENGTH, 30}, new Object[]{"98", VARIABLE_LENGTH, 30}, new Object[]{"99", VARIABLE_LENGTH, 30}};
    private static final Object[][] THREE_DIGIT_DATA_LENGTH = {new Object[]{"240", VARIABLE_LENGTH, 30}, new Object[]{"241", VARIABLE_LENGTH, 30}, new Object[]{"242", VARIABLE_LENGTH, 6}, new Object[]{"250", VARIABLE_LENGTH, 30}, new Object[]{"251", VARIABLE_LENGTH, 30}, new Object[]{"253", VARIABLE_LENGTH, 17}, new Object[]{"254", VARIABLE_LENGTH, 20}, new Object[]{"400", VARIABLE_LENGTH, 30}, new Object[]{"401", VARIABLE_LENGTH, 30}, new Object[]{"402", 17}, new Object[]{"403", VARIABLE_LENGTH, 30}, new Object[]{"410", 13}, new Object[]{"411", 13}, new Object[]{"412", 13}, new Object[]{"413", 13}, new Object[]{"414", 13}, new Object[]{"420", VARIABLE_LENGTH, 20}, new Object[]{"421", VARIABLE_LENGTH, 15}, new Object[]{"422", 3}, new Object[]{"423", VARIABLE_LENGTH, 15}, new Object[]{"424", 3}, new Object[]{"425", 3}, new Object[]{"426", 3}};
    private static final Object[][] THREE_DIGIT_PLUS_DIGIT_DATA_LENGTH = {new Object[]{"310", 6}, new Object[]{"311", 6}, new Object[]{"312", 6}, new Object[]{"313", 6}, new Object[]{"314", 6}, new Object[]{"315", 6}, new Object[]{"316", 6}, new Object[]{"320", 6}, new Object[]{"321", 6}, new Object[]{"322", 6}, new Object[]{"323", 6}, new Object[]{"324", 6}, new Object[]{"325", 6}, new Object[]{"326", 6}, new Object[]{"327", 6}, new Object[]{"328", 6}, new Object[]{"329", 6}, new Object[]{"330", 6}, new Object[]{"331", 6}, new Object[]{"332", 6}, new Object[]{"333", 6}, new Object[]{"334", 6}, new Object[]{"335", 6}, new Object[]{"336", 6}, new Object[]{"340", 6}, new Object[]{"341", 6}, new Object[]{"342", 6}, new Object[]{"343", 6}, new Object[]{"344", 6}, new Object[]{"345", 6}, new Object[]{"346", 6}, new Object[]{"347", 6}, new Object[]{"348", 6}, new Object[]{"349", 6}, new Object[]{"350", 6}, new Object[]{"351", 6}, new Object[]{"352", 6}, new Object[]{"353", 6}, new Object[]{"354", 6}, new Object[]{"355", 6}, new Object[]{"356", 6}, new Object[]{"357", 6}, new Object[]{"360", 6}, new Object[]{"361", 6}, new Object[]{"362", 6}, new Object[]{"363", 6}, new Object[]{"364", 6}, new Object[]{"365", 6}, new Object[]{"366", 6}, new Object[]{"367", 6}, new Object[]{"368", 6}, new Object[]{"369", 6}, new Object[]{"390", VARIABLE_LENGTH, 15}, new Object[]{"391", VARIABLE_LENGTH, 18}, new Object[]{"392", VARIABLE_LENGTH, 15}, new Object[]{"393", VARIABLE_LENGTH, 18}, new Object[]{"703", VARIABLE_LENGTH, 30}};
    private static final Object[][] FOUR_DIGIT_DATA_LENGTH = {new Object[]{"7001", 13}, new Object[]{"7002", VARIABLE_LENGTH, 30}, new Object[]{"7003", 10}, new Object[]{"8001", 14}, new Object[]{"8002", VARIABLE_LENGTH, 20}, new Object[]{"8003", VARIABLE_LENGTH, 30}, new Object[]{"8004", VARIABLE_LENGTH, 30}, new Object[]{"8005", 6}, new Object[]{"8006", 18}, new Object[]{"8007", VARIABLE_LENGTH, 30}, new Object[]{"8008", VARIABLE_LENGTH, 12}, new Object[]{"8018", 18}, new Object[]{"8020", VARIABLE_LENGTH, 25}, new Object[]{"8100", 6}, new Object[]{"8101", 10}, new Object[]{"8102", 2}, new Object[]{"8110", VARIABLE_LENGTH, 30}};

    private FieldParser() {
    }

    static String parseFieldsInGeneralPurpose(String str) throws NotFoundException {
        Object[][] objArr;
        String processVariableAI;
        if (str.length() == 0) {
            processVariableAI = null;
        } else if (str.length() < 2) {
            throw NotFoundException.getNotFoundInstance();
        } else {
            String substring = str.substring(0, 2);
            Object[][] objArr2 = TWO_DIGIT_DATA_LENGTH;
            int length = objArr2.length;
            int i = 0;
            while (true) {
                if (i < length) {
                    Object[] objArr3 = objArr2[i];
                    if (objArr3[0].equals(substring)) {
                        processVariableAI = objArr3[1] == VARIABLE_LENGTH ? processVariableAI(2, ((Integer) objArr3[2]).intValue(), str) : processFixedAI(2, ((Integer) objArr3[1]).intValue(), str);
                    } else {
                        i++;
                    }
                } else if (str.length() < 3) {
                    throw NotFoundException.getNotFoundInstance();
                } else {
                    String substring2 = str.substring(0, 3);
                    Object[][] objArr4 = THREE_DIGIT_DATA_LENGTH;
                    int length2 = objArr4.length;
                    int i2 = 0;
                    while (true) {
                        if (i2 < length2) {
                            Object[] objArr5 = objArr4[i2];
                            if (objArr5[0].equals(substring2)) {
                                processVariableAI = objArr5[1] == VARIABLE_LENGTH ? processVariableAI(3, ((Integer) objArr5[2]).intValue(), str) : processFixedAI(3, ((Integer) objArr5[1]).intValue(), str);
                            } else {
                                i2++;
                            }
                        } else {
                            Object[][] objArr6 = THREE_DIGIT_PLUS_DIGIT_DATA_LENGTH;
                            int length3 = objArr6.length;
                            int i3 = 0;
                            while (true) {
                                if (i3 >= length3) {
                                    if (str.length() < 4) {
                                        throw NotFoundException.getNotFoundInstance();
                                    }
                                    String substring3 = str.substring(0, 4);
                                    for (Object[] objArr7 : FOUR_DIGIT_DATA_LENGTH) {
                                        if (objArr7[0].equals(substring3)) {
                                            processVariableAI = objArr7[1] == VARIABLE_LENGTH ? processVariableAI(4, ((Integer) objArr7[2]).intValue(), str) : processFixedAI(4, ((Integer) objArr7[1]).intValue(), str);
                                        }
                                    }
                                    throw NotFoundException.getNotFoundInstance();
                                }
                                Object[] objArr8 = objArr6[i3];
                                if (objArr8[0].equals(substring2)) {
                                    processVariableAI = objArr8[1] == VARIABLE_LENGTH ? processVariableAI(4, ((Integer) objArr8[2]).intValue(), str) : processFixedAI(4, ((Integer) objArr8[1]).intValue(), str);
                                } else {
                                    i3++;
                                }
                            }
                        }
                    }
                }
            }
        }
        return processVariableAI;
    }

    private static String processFixedAI(int i, int i2, String str) throws NotFoundException {
        if (str.length() < i) {
            throw NotFoundException.getNotFoundInstance();
        }
        String substring = str.substring(0, i);
        if (str.length() < i + i2) {
            throw NotFoundException.getNotFoundInstance();
        }
        String substring2 = str.substring(i, i + i2);
        String substring3 = str.substring(i + i2);
        String str2 = '(' + substring + ')' + substring2;
        String parseFieldsInGeneralPurpose = parseFieldsInGeneralPurpose(substring3);
        if (parseFieldsInGeneralPurpose != null) {
            str2 = str2 + parseFieldsInGeneralPurpose;
        }
        return str2;
    }

    private static String processVariableAI(int i, int i2, String str) throws NotFoundException {
        String substring = str.substring(0, i);
        int length = str.length() < i + i2 ? str.length() : i + i2;
        String substring2 = str.substring(i, length);
        String substring3 = str.substring(length);
        String str2 = '(' + substring + ')' + substring2;
        String parseFieldsInGeneralPurpose = parseFieldsInGeneralPurpose(substring3);
        if (parseFieldsInGeneralPurpose != null) {
            str2 = str2 + parseFieldsInGeneralPurpose;
        }
        return str2;
    }
}
