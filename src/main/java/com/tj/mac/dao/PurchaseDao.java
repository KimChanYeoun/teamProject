package com.tj.mac.dao;

import java.util.List;

import com.tj.mac.model.Purchase;

public interface PurchaseDao {
	public List<Purchase> listPurchase();
	public int addPurchase(Purchase purchase);
	public int getLastPurchaseNo();
}
