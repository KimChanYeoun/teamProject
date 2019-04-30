package com.tj.mac.service;

import java.util.List;

import com.tj.mac.model.Purchase;

public interface PurchaseService {
	public List<Purchase> listPurchase();
	public int addPurchase(Purchase purchase);
	public int getLastPurchaseNo();
}
