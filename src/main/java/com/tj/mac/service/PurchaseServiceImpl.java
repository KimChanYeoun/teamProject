package com.tj.mac.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.mac.dao.PurchaseDao;
import com.tj.mac.model.Purchase;
@Service
public class PurchaseServiceImpl implements PurchaseService {
	@Autowired
	private PurchaseDao purchaseDao;
	@Override
	public List<Purchase> listPurchase() {
		return purchaseDao.listPurchase();
	}

	@Override
	public int addPurchase(Purchase purchase) {
		return purchaseDao.addPurchase(purchase);
	}

	@Override
	public int getLastPurchaseNo() {
		return purchaseDao.getLastPurchaseNo();
	}

}
