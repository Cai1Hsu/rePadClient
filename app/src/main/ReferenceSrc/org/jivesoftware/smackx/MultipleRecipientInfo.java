package org.jivesoftware.smackx;

import java.util.List;
import org.jivesoftware.smackx.packet.MultipleAddresses;

/* loaded from: classes.jar:org/jivesoftware/smackx/MultipleRecipientInfo.class */
public class MultipleRecipientInfo {
    MultipleAddresses extension;

    MultipleRecipientInfo(MultipleAddresses multipleAddresses) {
        this.extension = multipleAddresses;
    }

    public List<MultipleAddresses.Address> getCCAddresses() {
        return this.extension.getAddressesOfType(MultipleAddresses.CC);
    }

    public MultipleAddresses.Address getReplyAddress() {
        List<MultipleAddresses.Address> addressesOfType = this.extension.getAddressesOfType(MultipleAddresses.REPLY_TO);
        return addressesOfType.isEmpty() ? null : addressesOfType.get(0);
    }

    public String getReplyRoom() {
        List<MultipleAddresses.Address> addressesOfType = this.extension.getAddressesOfType(MultipleAddresses.REPLY_ROOM);
        return addressesOfType.isEmpty() ? null : addressesOfType.get(0).getJid();
    }

    public List<MultipleAddresses.Address> getTOAddresses() {
        return this.extension.getAddressesOfType("to");
    }

    public boolean shouldNotReply() {
        return !this.extension.getAddressesOfType(MultipleAddresses.NO_REPLY).isEmpty();
    }
}
