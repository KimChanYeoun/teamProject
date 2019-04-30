package com.tj.mac.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mac.model.Item;
import com.tj.mac.model.Purchase;
@Repository
public class ItemDaoImpl implements ItemDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public List<Item> listItem() {
		return sessionTemplate.selectList("listItem");
	}
	@Override
	public List<Item> listItemPaging(Item item) {
		return sessionTemplate.selectList("listItemPaging", item);
	}

	@Override
	public int writeItem(Item item) {
		return sessionTemplate.insert("writeItem", item);
	}
	
	@Override
	public Item detailItem(int itemNo) {
		return sessionTemplate.selectOne("detailItem", itemNo);
	}

	@Override
	public int modifyItem(Item item) {
		return sessionTemplate.update("modifyItem", item);
	}

	@Override
	public int deleteItem(int itemNo) {
		return sessionTemplate.delete("deleteItem", itemNo);
	}

	@Override
	public int countItem() {
		return sessionTemplate.selectOne("countItem");
	}
	
	@Override
	public List<Purchase> listPurchase() {
		return sessionTemplate.selectList("listPurchase");
	}
	@Override
	public Item getItem(int itemNo) {
		return sessionTemplate.selectOne("getItem", itemNo);
	}
}
