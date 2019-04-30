package com.tj.mac.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.mac.dao.PurchaseItemDao;
import com.tj.mac.model.PurchaseItem;
@Service
public class PurchaseItemServiceImpl implements PurchaseItemService {
	@Autowired
	private PurchaseItemDao purchaseItemDao;
	@Override
	public List<PurchaseItem> listPurchaseItem() {
		return purchaseItemDao.listPurchaseItem();
	}

	@Override
	public int addPurchaseItem(PurchaseItem purchaseItem) {
		return purchaseItemDao.addPurchaseItem(purchaseItem);
	}
}
