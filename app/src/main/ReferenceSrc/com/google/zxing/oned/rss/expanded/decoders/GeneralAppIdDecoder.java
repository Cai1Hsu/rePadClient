package com.google.zxing.oned.rss.expanded.decoders;

import com.google.zxing.NotFoundException;
import com.google.zxing.common.BitArray;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.commons.net.telnet.TelnetCommand;

/* loaded from: classes.jar:com/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder.class */
final class GeneralAppIdDecoder {
    private final BitArray information;
    private final CurrentParsingState current = new CurrentParsingState();
    private final StringBuilder buffer = new StringBuilder();

    GeneralAppIdDecoder(BitArray bitArray) {
        this.information = bitArray;
    }

    private DecodedChar decodeAlphanumeric(int i) {
        char c;
        DecodedChar decodedChar;
        int extractNumericValueFromBitArray = extractNumericValueFromBitArray(i, 5);
        if (extractNumericValueFromBitArray == 15) {
            decodedChar = new DecodedChar(i + 5, '$');
        } else if (extractNumericValueFromBitArray < 5 || extractNumericValueFromBitArray >= 15) {
            int extractNumericValueFromBitArray2 = extractNumericValueFromBitArray(i, 6);
            if (extractNumericValueFromBitArray2 < 32 || extractNumericValueFromBitArray2 >= 58) {
                switch (extractNumericValueFromBitArray2) {
                    case 58:
                        c = '*';
                        break;
                    case 59:
                        c = ',';
                        break;
                    case 60:
                        c = '-';
                        break;
                    case 61:
                        c = '.';
                        break;
                    case 62:
                        c = '/';
                        break;
                    default:
                        throw new IllegalStateException("Decoding invalid alphanumeric value: " + extractNumericValueFromBitArray2);
                }
                decodedChar = new DecodedChar(i + 6, c);
            } else {
                decodedChar = new DecodedChar(i + 6, (char) (extractNumericValueFromBitArray2 + 33));
            }
        } else {
            decodedChar = new DecodedChar(i + 5, (char) ((extractNumericValueFromBitArray + 48) - 5));
        }
        return decodedChar;
    }

    private DecodedChar decodeIsoIec646(int i) {
        char c;
        DecodedChar decodedChar;
        int extractNumericValueFromBitArray = extractNumericValueFromBitArray(i, 5);
        if (extractNumericValueFromBitArray == 15) {
            decodedChar = new DecodedChar(i + 5, '$');
        } else if (extractNumericValueFromBitArray < 5 || extractNumericValueFromBitArray >= 15) {
            int extractNumericValueFromBitArray2 = extractNumericValueFromBitArray(i, 7);
            if (extractNumericValueFromBitArray2 >= 64 && extractNumericValueFromBitArray2 < 90) {
                decodedChar = new DecodedChar(i + 7, (char) (extractNumericValueFromBitArray2 + 1));
            } else if (extractNumericValueFromBitArray2 < 90 || extractNumericValueFromBitArray2 >= 116) {
                int extractNumericValueFromBitArray3 = extractNumericValueFromBitArray(i, 8);
                switch (extractNumericValueFromBitArray3) {
                    case 232:
                        c = '!';
                        break;
                    case 233:
                        c = '\"';
                        break;
                    case FTPReply.SECURITY_DATA_EXCHANGE_COMPLETE /* 234 */:
                        c = '%';
                        break;
                    case 235:
                        c = '&';
                        break;
                    case TelnetCommand.EOF /* 236 */:
                        c = '\'';
                        break;
                    case TelnetCommand.SUSP /* 237 */:
                        c = '(';
                        break;
                    case TelnetCommand.ABORT /* 238 */:
                        c = ')';
                        break;
                    case TelnetCommand.EOR /* 239 */:
                        c = '*';
                        break;
                    case 240:
                        c = '+';
                        break;
                    case TelnetCommand.NOP /* 241 */:
                        c = ',';
                        break;
                    case 242:
                        c = '-';
                        break;
                    case TelnetCommand.BREAK /* 243 */:
                        c = '.';
                        break;
                    case TelnetCommand.IP /* 244 */:
                        c = '/';
                        break;
                    case TelnetCommand.AO /* 245 */:
                        c = ':';
                        break;
                    case TelnetCommand.AYT /* 246 */:
                        c = ';';
                        break;
                    case TelnetCommand.EC /* 247 */:
                        c = '<';
                        break;
                    case TelnetCommand.EL /* 248 */:
                        c = '=';
                        break;
                    case TelnetCommand.GA /* 249 */:
                        c = '>';
                        break;
                    case 250:
                        c = '?';
                        break;
                    case 251:
                        c = '_';
                        break;
                    case TelnetCommand.WONT /* 252 */:
                        c = ' ';
                        break;
                    default:
                        throw new IllegalArgumentException("Decoding invalid ISO/IEC 646 value: " + extractNumericValueFromBitArray3);
                }
                decodedChar = new DecodedChar(i + 8, c);
            } else {
                decodedChar = new DecodedChar(i + 7, (char) (extractNumericValueFromBitArray2 + 7));
            }
        } else {
            decodedChar = new DecodedChar(i + 5, (char) ((extractNumericValueFromBitArray + 48) - 5));
        }
        return decodedChar;
    }

    private DecodedNumeric decodeNumeric(int i) {
        DecodedNumeric decodedNumeric;
        if (i + 7 > this.information.getSize()) {
            int extractNumericValueFromBitArray = extractNumericValueFromBitArray(i, 4);
            decodedNumeric = extractNumericValueFromBitArray == 0 ? new DecodedNumeric(this.information.getSize(), 10, 10) : new DecodedNumeric(this.information.getSize(), extractNumericValueFromBitArray - 1, 10);
        } else {
            int extractNumericValueFromBitArray2 = extractNumericValueFromBitArray(i, 7);
            decodedNumeric = new DecodedNumeric(i + 7, (extractNumericValueFromBitArray2 - 8) / 11, (extractNumericValueFromBitArray2 - 8) % 11);
        }
        return decodedNumeric;
    }

    static int extractNumericValueFromBitArray(BitArray bitArray, int i, int i2) {
        if (i2 > 32) {
            throw new IllegalArgumentException("extractNumberValueFromBitArray can't handle more than 32 bits");
        }
        int i3 = 0;
        int i4 = 0;
        while (i4 < i2) {
            int i5 = i3;
            if (bitArray.get(i + i4)) {
                i5 = i3 | (1 << ((i2 - i4) - 1));
            }
            i4++;
            i3 = i5;
        }
        return i3;
    }

    private boolean isAlphaOr646ToNumericLatch(int i) {
        boolean z;
        if (i + 3 <= this.information.getSize()) {
            int i2 = i;
            while (true) {
                if (i2 >= i + 3) {
                    z = true;
                    break;
                }
                z = false;
                if (this.information.get(i2)) {
                    break;
                }
                i2++;
            }
        } else {
            z = false;
        }
        return z;
    }

    private boolean isAlphaTo646ToAlphaLatch(int i) {
        boolean z;
        if (i + 1 > this.information.getSize()) {
            z = false;
        } else {
            for (int i2 = 0; i2 < 5 && i2 + i < this.information.getSize(); i2++) {
                if (i2 == 2) {
                    z = false;
                    if (!this.information.get(i + 2)) {
                        break;
                    }
                } else if (this.information.get(i + i2)) {
                    z = false;
                    break;
                }
            }
            z = true;
        }
        return z;
    }

    private boolean isNumericToAlphaNumericLatch(int i) {
        boolean z;
        if (i + 1 > this.information.getSize()) {
            z = false;
        } else {
            for (int i2 = 0; i2 < 4 && i2 + i < this.information.getSize(); i2++) {
                z = false;
                if (this.information.get(i + i2)) {
                    break;
                }
            }
            z = true;
        }
        return z;
    }

    private boolean isStillAlpha(int i) {
        boolean z = false;
        if (i + 5 <= this.information.getSize()) {
            int extractNumericValueFromBitArray = extractNumericValueFromBitArray(i, 5);
            if (extractNumericValueFromBitArray >= 5 && extractNumericValueFromBitArray < 16) {
                z = true;
            } else if (i + 6 <= this.information.getSize()) {
                int extractNumericValueFromBitArray2 = extractNumericValueFromBitArray(i, 6);
                z = extractNumericValueFromBitArray2 >= 16 && extractNumericValueFromBitArray2 < 63;
            }
        }
        return z;
    }

    private boolean isStillIsoIec646(int i) {
        boolean z;
        if (i + 5 > this.information.getSize()) {
            z = false;
        } else {
            int extractNumericValueFromBitArray = extractNumericValueFromBitArray(i, 5);
            if (extractNumericValueFromBitArray < 5 || extractNumericValueFromBitArray >= 16) {
                z = false;
                if (i + 7 <= this.information.getSize()) {
                    int extractNumericValueFromBitArray2 = extractNumericValueFromBitArray(i, 7);
                    if (extractNumericValueFromBitArray2 < 64 || extractNumericValueFromBitArray2 >= 116) {
                        z = false;
                        if (i + 8 <= this.information.getSize()) {
                            int extractNumericValueFromBitArray3 = extractNumericValueFromBitArray(i, 8);
                            z = extractNumericValueFromBitArray3 >= 232 && extractNumericValueFromBitArray3 < 253;
                        }
                    } else {
                        z = true;
                    }
                }
            } else {
                z = true;
            }
        }
        return z;
    }

    private boolean isStillNumeric(int i) {
        boolean z;
        if (i + 7 <= this.information.getSize()) {
            int i2 = i;
            while (true) {
                if (i2 >= i + 3) {
                    z = this.information.get(i + 3);
                    break;
                }
                z = true;
                if (this.information.get(i2)) {
                    break;
                }
                i2++;
            }
        } else {
            z = i + 4 <= this.information.getSize();
        }
        return z;
    }

    private BlockParsedResult parseAlphaBlock() {
        BlockParsedResult blockParsedResult;
        while (true) {
            if (isStillAlpha(this.current.getPosition())) {
                DecodedChar decodeAlphanumeric = decodeAlphanumeric(this.current.getPosition());
                this.current.setPosition(decodeAlphanumeric.getNewPosition());
                if (decodeAlphanumeric.isFNC1()) {
                    blockParsedResult = new BlockParsedResult(new DecodedInformation(this.current.getPosition(), this.buffer.toString()), true);
                    break;
                }
                this.buffer.append(decodeAlphanumeric.getValue());
            } else {
                if (isAlphaOr646ToNumericLatch(this.current.getPosition())) {
                    this.current.incrementPosition(3);
                    this.current.setNumeric();
                } else if (isAlphaTo646ToAlphaLatch(this.current.getPosition())) {
                    if (this.current.getPosition() + 5 < this.information.getSize()) {
                        this.current.incrementPosition(5);
                    } else {
                        this.current.setPosition(this.information.getSize());
                    }
                    this.current.setIsoIec646();
                }
                blockParsedResult = new BlockParsedResult(false);
            }
        }
        return blockParsedResult;
    }

    private DecodedInformation parseBlocks() {
        BlockParsedResult parseNumericBlock;
        boolean isFinished;
        do {
            int position = this.current.getPosition();
            if (this.current.isAlpha()) {
                parseNumericBlock = parseAlphaBlock();
                isFinished = parseNumericBlock.isFinished();
            } else if (this.current.isIsoIec646()) {
                parseNumericBlock = parseIsoIec646Block();
                isFinished = parseNumericBlock.isFinished();
            } else {
                parseNumericBlock = parseNumericBlock();
                isFinished = parseNumericBlock.isFinished();
            }
            if (!(position != this.current.getPosition()) && !isFinished) {
                break;
            }
        } while (!isFinished);
        return parseNumericBlock.getDecodedInformation();
    }

    private BlockParsedResult parseIsoIec646Block() {
        BlockParsedResult blockParsedResult;
        while (true) {
            if (isStillIsoIec646(this.current.getPosition())) {
                DecodedChar decodeIsoIec646 = decodeIsoIec646(this.current.getPosition());
                this.current.setPosition(decodeIsoIec646.getNewPosition());
                if (decodeIsoIec646.isFNC1()) {
                    blockParsedResult = new BlockParsedResult(new DecodedInformation(this.current.getPosition(), this.buffer.toString()), true);
                    break;
                }
                this.buffer.append(decodeIsoIec646.getValue());
            } else {
                if (isAlphaOr646ToNumericLatch(this.current.getPosition())) {
                    this.current.incrementPosition(3);
                    this.current.setNumeric();
                } else if (isAlphaTo646ToAlphaLatch(this.current.getPosition())) {
                    if (this.current.getPosition() + 5 < this.information.getSize()) {
                        this.current.incrementPosition(5);
                    } else {
                        this.current.setPosition(this.information.getSize());
                    }
                    this.current.setAlpha();
                }
                blockParsedResult = new BlockParsedResult(false);
            }
        }
        return blockParsedResult;
    }

    private BlockParsedResult parseNumericBlock() {
        BlockParsedResult blockParsedResult;
        while (true) {
            if (isStillNumeric(this.current.getPosition())) {
                DecodedNumeric decodeNumeric = decodeNumeric(this.current.getPosition());
                this.current.setPosition(decodeNumeric.getNewPosition());
                if (decodeNumeric.isFirstDigitFNC1()) {
                    blockParsedResult = new BlockParsedResult(decodeNumeric.isSecondDigitFNC1() ? new DecodedInformation(this.current.getPosition(), this.buffer.toString()) : new DecodedInformation(this.current.getPosition(), this.buffer.toString(), decodeNumeric.getSecondDigit()), true);
                } else {
                    this.buffer.append(decodeNumeric.getFirstDigit());
                    if (decodeNumeric.isSecondDigitFNC1()) {
                        blockParsedResult = new BlockParsedResult(new DecodedInformation(this.current.getPosition(), this.buffer.toString()), true);
                        break;
                    }
                    this.buffer.append(decodeNumeric.getSecondDigit());
                }
            } else {
                if (isNumericToAlphaNumericLatch(this.current.getPosition())) {
                    this.current.setAlpha();
                    this.current.incrementPosition(4);
                }
                blockParsedResult = new BlockParsedResult(false);
            }
        }
        return blockParsedResult;
    }

    String decodeAllCodes(StringBuilder sb, int i) throws NotFoundException {
        String str = null;
        while (true) {
            DecodedInformation decodeGeneralPurposeField = decodeGeneralPurposeField(i, str);
            String parseFieldsInGeneralPurpose = FieldParser.parseFieldsInGeneralPurpose(decodeGeneralPurposeField.getNewString());
            if (parseFieldsInGeneralPurpose != null) {
                sb.append(parseFieldsInGeneralPurpose);
            }
            str = decodeGeneralPurposeField.isRemaining() ? String.valueOf(decodeGeneralPurposeField.getRemainingValue()) : null;
            if (i == decodeGeneralPurposeField.getNewPosition()) {
                return sb.toString();
            }
            i = decodeGeneralPurposeField.getNewPosition();
        }
    }

    DecodedInformation decodeGeneralPurposeField(int i, String str) {
        this.buffer.setLength(0);
        if (str != null) {
            this.buffer.append(str);
        }
        this.current.setPosition(i);
        DecodedInformation parseBlocks = parseBlocks();
        return (parseBlocks == null || !parseBlocks.isRemaining()) ? new DecodedInformation(this.current.getPosition(), this.buffer.toString()) : new DecodedInformation(this.current.getPosition(), this.buffer.toString(), parseBlocks.getRemainingValue());
    }

    int extractNumericValueFromBitArray(int i, int i2) {
        return extractNumericValueFromBitArray(this.information, i, i2);
    }
}
