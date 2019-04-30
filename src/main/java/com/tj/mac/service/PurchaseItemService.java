package com.tj.mac.service;

import java.util.List;

import com.tj.mac.model.PurchaseItem;

public interface PurchaseItemService {
	public List<PurchaseItem> listPurchaseItem();
	public int addPurchaseItem(PurchaseItem purchaseItem);
}
