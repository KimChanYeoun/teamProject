package com.tj.mac.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mac.model.PurchaseItem;
@Repository
public class PurchaseItemDaoImpl implements PurchaseItemDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public List<PurchaseItem> listPurchaseItem() {
		return sessionTemplate.selectList("listPurchaseItem");
	}
	@Override
	public int addPurchaseItem(PurchaseItem purchaseItem) {
		return sessionTemplate.insert("addPurchaseItem", purchaseItem);
	}

}
