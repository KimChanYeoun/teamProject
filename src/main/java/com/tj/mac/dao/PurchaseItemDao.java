package com.tj.mac.dao;

import java.util.List;

import com.tj.mac.model.PurchaseItem;

public interface PurchaseItemDao {
	public List<PurchaseItem> listPurchaseItem();
	public int addPurchaseItem(PurchaseItem purchaseItem);
}
