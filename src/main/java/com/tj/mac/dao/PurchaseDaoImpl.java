package com.tj.mac.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mac.model.Purchase;
@Repository
public class PurchaseDaoImpl implements PurchaseDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public List<Purchase> listPurchase() {
		return sessionTemplate.selectList("listPurchase");
	}

	@Override
	public int addPurchase(Purchase purchase) {
		return sessionTemplate.insert("addPurchase", purchase);
	}

	@Override
	public int getLastPurchaseNo() {
		return sessionTemplate.selectOne("getLastPurchaseNo");
	}

}
