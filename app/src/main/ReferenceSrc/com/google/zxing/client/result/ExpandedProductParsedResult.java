package com.google.zxing.client.result;

import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/client/result/ExpandedProductParsedResult.class */
public final class ExpandedProductParsedResult extends ParsedResult {
    public static final String KILOGRAM = "KG";
    public static final String POUND = "LB";
    private final String bestBeforeDate;
    private final String expirationDate;
    private final String lotNumber;
    private final String packagingDate;
    private final String price;
    private final String priceCurrency;
    private final String priceIncrement;
    private final String productID;
    private final String productionDate;
    private final String sscc;
    private final Map<String, String> uncommonAIs;
    private final String weight;
    private final String weightIncrement;
    private final String weightType;

    public ExpandedProductParsedResult(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, String str9, String str10, String str11, String str12, String str13, Map<String, String> map) {
        super(ParsedResultType.PRODUCT);
        this.productID = str;
        this.sscc = str2;
        this.lotNumber = str3;
        this.productionDate = str4;
        this.packagingDate = str5;
        this.bestBeforeDate = str6;
        this.expirationDate = str7;
        this.weight = str8;
        this.weightType = str9;
        this.weightIncrement = str10;
        this.price = str11;
        this.priceIncrement = str12;
        this.priceCurrency = str13;
        this.uncommonAIs = map;
    }

    private static boolean equalsOrNull(Object obj, Object obj2) {
        return obj == null ? obj2 == null : obj.equals(obj2);
    }

    private static int hashNotNull(Object obj) {
        return obj == null ? 0 : obj.hashCode();
    }

    public boolean equals(Object obj) {
        boolean z;
        if (!(obj instanceof ExpandedProductParsedResult)) {
            z = false;
        } else {
            ExpandedProductParsedResult expandedProductParsedResult = (ExpandedProductParsedResult) obj;
            z = false;
            if (equalsOrNull(this.productID, expandedProductParsedResult.productID)) {
                z = false;
                if (equalsOrNull(this.sscc, expandedProductParsedResult.sscc)) {
                    z = false;
                    if (equalsOrNull(this.lotNumber, expandedProductParsedResult.lotNumber)) {
                        z = false;
                        if (equalsOrNull(this.productionDate, expandedProductParsedResult.productionDate)) {
                            z = false;
                            if (equalsOrNull(this.bestBeforeDate, expandedProductParsedResult.bestBeforeDate)) {
                                z = false;
                                if (equalsOrNull(this.expirationDate, expandedProductParsedResult.expirationDate)) {
                                    z = false;
                                    if (equalsOrNull(this.weight, expandedProductParsedResult.weight)) {
                                        z = false;
                                        if (equalsOrNull(this.weightType, expandedProductParsedResult.weightType)) {
                                            z = false;
                                            if (equalsOrNull(this.weightIncrement, expandedProductParsedResult.weightIncrement)) {
                                                z = false;
                                                if (equalsOrNull(this.price, expandedProductParsedResult.price)) {
                                                    z = false;
                                                    if (equalsOrNull(this.priceIncrement, expandedProductParsedResult.priceIncrement)) {
                                                        z = false;
                                                        if (equalsOrNull(this.priceCurrency, expandedProductParsedResult.priceCurrency)) {
                                                            z = false;
                                                            if (equalsOrNull(this.uncommonAIs, expandedProductParsedResult.uncommonAIs)) {
                                                                z = true;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return z;
    }

    public String getBestBeforeDate() {
        return this.bestBeforeDate;
    }

    @Override // com.google.zxing.client.result.ParsedResult
    public String getDisplayResult() {
        return String.valueOf(this.productID);
    }

    public String getExpirationDate() {
        return this.expirationDate;
    }

    public String getLotNumber() {
        return this.lotNumber;
    }

    public String getPackagingDate() {
        return this.packagingDate;
    }

    public String getPrice() {
        return this.price;
    }

    public String getPriceCurrency() {
        return this.priceCurrency;
    }

    public String getPriceIncrement() {
        return this.priceIncrement;
    }

    public String getProductID() {
        return this.productID;
    }

    public String getProductionDate() {
        return this.productionDate;
    }

    public String getSscc() {
        return this.sscc;
    }

    public Map<String, String> getUncommonAIs() {
        return this.uncommonAIs;
    }

    public String getWeight() {
        return this.weight;
    }

    public String getWeightIncrement() {
        return this.weightIncrement;
    }

    public String getWeightType() {
        return this.weightType;
    }

    public int hashCode() {
        return ((((((((((((0 ^ hashNotNull(this.productID)) ^ hashNotNull(this.sscc)) ^ hashNotNull(this.lotNumber)) ^ hashNotNull(this.productionDate)) ^ hashNotNull(this.bestBeforeDate)) ^ hashNotNull(this.expirationDate)) ^ hashNotNull(this.weight)) ^ hashNotNull(this.weightType)) ^ hashNotNull(this.weightIncrement)) ^ hashNotNull(this.price)) ^ hashNotNull(this.priceIncrement)) ^ hashNotNull(this.priceCurrency)) ^ hashNotNull(this.uncommonAIs);
    }
}
