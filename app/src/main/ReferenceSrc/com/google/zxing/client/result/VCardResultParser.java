package com.google.zxing.client.result;

import com.google.zxing.Result;
import com.mining.app.zxing.decoding.Intents;
import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes.dex */
public final class VCardResultParser extends ResultParser {
    private static final Pattern BEGIN_VCARD = Pattern.compile("BEGIN:VCARD", 2);
    private static final Pattern VCARD_LIKE_DATE = Pattern.compile("\\d{4}-?\\d{2}-?\\d{2}");
    private static final Pattern CR_LF_SPACE_TAB = Pattern.compile("\r\n[ \t]");
    private static final Pattern NEWLINE_ESCAPE = Pattern.compile("\\\\[nN]");
    private static final Pattern VCARD_ESCAPES = Pattern.compile("\\\\([,;\\\\])");
    private static final Pattern EQUALS = Pattern.compile("=");
    private static final Pattern SEMICOLON = Pattern.compile(";");

    @Override // com.google.zxing.client.result.ResultParser
    public AddressBookParsedResult parse(Result result) {
        String rawText = result.getText();
        Matcher m = BEGIN_VCARD.matcher(rawText);
        if (!m.find() || m.start() != 0) {
            return null;
        }
        List<List<String>> names = matchVCardPrefixedField("FN", rawText, true);
        if (names == null) {
            names = matchVCardPrefixedField("N", rawText, true);
            formatNames(names);
        }
        List<List<String>> phoneNumbers = matchVCardPrefixedField("TEL", rawText, true);
        List<List<String>> emails = matchVCardPrefixedField("EMAIL", rawText, true);
        List<String> note = matchSingleVCardPrefixedField("NOTE", rawText, false);
        List<List<String>> addresses = matchVCardPrefixedField("ADR", rawText, true);
        if (addresses != null) {
            for (List<String> list : addresses) {
                list.set(0, list.get(0));
            }
        }
        List<String> org2 = matchSingleVCardPrefixedField("ORG", rawText, true);
        List<String> birthday = matchSingleVCardPrefixedField("BDAY", rawText, true);
        if (birthday != null && !isLikeVCardDate(birthday.get(0))) {
            birthday = null;
        }
        List<String> title = matchSingleVCardPrefixedField("TITLE", rawText, true);
        List<String> url = matchSingleVCardPrefixedField("URL", rawText, true);
        List<String> instantMessenger = matchSingleVCardPrefixedField("IMPP", rawText, true);
        return new AddressBookParsedResult(toPrimaryValues(names), null, toPrimaryValues(phoneNumbers), toTypes(phoneNumbers), toPrimaryValues(emails), toTypes(emails), toPrimaryValue(instantMessenger), toPrimaryValue(note), toPrimaryValues(addresses), toTypes(addresses), toPrimaryValue(org2), toPrimaryValue(birthday), toPrimaryValue(title), toPrimaryValue(url));
    }

    private static List<List<String>> matchVCardPrefixedField(CharSequence prefix, String rawText, boolean trim) {
        int i;
        String element;
        List<List<String>> matches = null;
        int i2 = 0;
        int max = rawText.length();
        while (i2 < max) {
            Matcher matcher = Pattern.compile("(?:^|\n)" + ((Object) prefix) + "(?:;([^:]*))?:", 2).matcher(rawText);
            if (i2 > 0) {
                i2--;
            }
            if (!matcher.find(i2)) {
                break;
            }
            int i3 = matcher.end(0);
            String metadataString = matcher.group(1);
            List<String> metadata = null;
            boolean quotedPrintable = false;
            String quotedPrintableCharset = null;
            if (metadataString != null) {
                String[] arr$ = SEMICOLON.split(metadataString);
                for (String metadatum : arr$) {
                    if (metadata == null) {
                        metadata = new ArrayList<>(1);
                    }
                    metadata.add(metadatum);
                    String[] metadatumTokens = EQUALS.split(metadatum, 2);
                    if (metadatumTokens.length > 1) {
                        String key = metadatumTokens[0];
                        String value = metadatumTokens[1];
                        if ("ENCODING".equalsIgnoreCase(key) && "QUOTED-PRINTABLE".equalsIgnoreCase(value)) {
                            quotedPrintable = true;
                        } else if ("CHARSET".equalsIgnoreCase(key)) {
                            quotedPrintableCharset = value;
                        }
                    }
                }
            }
            while (true) {
                i = rawText.indexOf(10, i3);
                if (i < 0) {
                    break;
                } else if (i < rawText.length() - 1 && (rawText.charAt(i + 1) == ' ' || rawText.charAt(i + 1) == '\t')) {
                    i3 = i + 2;
                } else if (!quotedPrintable || (rawText.charAt(i - 1) != '=' && rawText.charAt(i - 2) != '=')) {
                    break;
                } else {
                    i3 = i + 1;
                }
            }
            if (i < 0) {
                i2 = max;
            } else if (i > i3) {
                if (matches == null) {
                    matches = new ArrayList<>(1);
                }
                if (rawText.charAt(i - 1) == '\r') {
                    i--;
                }
                String element2 = rawText.substring(i3, i);
                if (trim) {
                    element2 = element2.trim();
                }
                if (quotedPrintable) {
                    element = decodeQuotedPrintable(element2, quotedPrintableCharset);
                } else {
                    element = VCARD_ESCAPES.matcher(NEWLINE_ESCAPE.matcher(CR_LF_SPACE_TAB.matcher(element2).replaceAll("")).replaceAll("\n")).replaceAll("$1");
                }
                if (metadata == null) {
                    List<String> match = new ArrayList<>(1);
                    match.add(element);
                    matches.add(match);
                } else {
                    metadata.add(0, element);
                    matches.add(metadata);
                }
                i2 = i + 1;
            } else {
                i2 = i + 1;
            }
        }
        return matches;
    }

    private static String decodeQuotedPrintable(CharSequence value, String charset) {
        char nextChar;
        int length = value.length();
        StringBuilder result = new StringBuilder(length);
        ByteArrayOutputStream fragmentBuffer = new ByteArrayOutputStream();
        int i = 0;
        while (i < length) {
            char c = value.charAt(i);
            switch (c) {
                case '\n':
                case '\r':
                    break;
                case '=':
                    if (i < length - 2 && (nextChar = value.charAt(i + 1)) != '\r' && nextChar != '\n') {
                        char nextNextChar = value.charAt(i + 2);
                        int firstDigit = parseHexDigit(nextChar);
                        int secondDigit = parseHexDigit(nextNextChar);
                        if (firstDigit >= 0 && secondDigit >= 0) {
                            fragmentBuffer.write((firstDigit << 4) + secondDigit);
                        }
                        i += 2;
                        break;
                    }
                    break;
                default:
                    maybeAppendFragment(fragmentBuffer, charset, result);
                    result.append(c);
                    break;
            }
            i++;
        }
        maybeAppendFragment(fragmentBuffer, charset, result);
        return result.toString();
    }

    private static void maybeAppendFragment(ByteArrayOutputStream fragmentBuffer, String charset, StringBuilder result) {
        String fragment;
        if (fragmentBuffer.size() > 0) {
            byte[] fragmentBytes = fragmentBuffer.toByteArray();
            if (charset == null) {
                fragment = new String(fragmentBytes);
            } else {
                try {
                    fragment = new String(fragmentBytes, charset);
                } catch (UnsupportedEncodingException e) {
                    fragment = new String(fragmentBytes);
                }
            }
            fragmentBuffer.reset();
            result.append(fragment);
        }
    }

    static List<String> matchSingleVCardPrefixedField(CharSequence prefix, String rawText, boolean trim) {
        List<List<String>> values = matchVCardPrefixedField(prefix, rawText, trim);
        if (values == null || values.isEmpty()) {
            return null;
        }
        return values.get(0);
    }

    private static String toPrimaryValue(List<String> list) {
        if (list == null || list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    private static String[] toPrimaryValues(Collection<List<String>> lists) {
        if (lists == null || lists.isEmpty()) {
            return null;
        }
        List<String> result = new ArrayList<>(lists.size());
        for (List<String> list : lists) {
            result.add(list.get(0));
        }
        return (String[]) result.toArray(new String[lists.size()]);
    }

    private static String[] toTypes(Collection<List<String>> lists) {
        if (lists == null || lists.isEmpty()) {
            return null;
        }
        List<String> result = new ArrayList<>(lists.size());
        for (List<String> list : lists) {
            String type = null;
            int i = 1;
            while (true) {
                if (i >= list.size()) {
                    break;
                }
                String metadatum = list.get(i);
                int equals = metadatum.indexOf(61);
                if (equals < 0) {
                    type = metadatum;
                    break;
                } else if (!Intents.WifiConnect.TYPE.equalsIgnoreCase(metadatum.substring(0, equals))) {
                    i++;
                } else {
                    type = metadatum.substring(equals + 1);
                    break;
                }
            }
            result.add(type);
        }
        return (String[]) result.toArray(new String[lists.size()]);
    }

    private static boolean isLikeVCardDate(CharSequence value) {
        return value == null || VCARD_LIKE_DATE.matcher(value).matches();
    }

    private static void formatNames(Iterable<List<String>> names) {
        if (names != null) {
            for (List<String> list : names) {
                String name = list.get(0);
                String[] components = new String[5];
                int start = 0;
                int componentIndex = 0;
                while (true) {
                    int end = name.indexOf(59, start);
                    if (end > 0) {
                        components[componentIndex] = name.substring(start, end);
                        componentIndex++;
                        start = end + 1;
                    }
                }
                components[componentIndex] = name.substring(start);
                StringBuilder newName = new StringBuilder(100);
                maybeAppendComponent(components, 3, newName);
                maybeAppendComponent(components, 1, newName);
                maybeAppendComponent(components, 2, newName);
                maybeAppendComponent(components, 0, newName);
                maybeAppendComponent(components, 4, newName);
                list.set(0, newName.toString().trim());
            }
        }
    }

    private static void maybeAppendComponent(String[] components, int i, StringBuilder newName) {
        if (components[i] != null) {
            newName.append(' ');
            newName.append(components[i]);
        }
    }
}
