package com.tj.mac.dao;

import java.util.List;

import com.tj.mac.model.Item;
import com.tj.mac.model.Purchase;

public interface ItemDao {
	public List<Item> listItem();
	public List<Item> listItemPaging(Item item);
	public int writeItem(Item item);
	public Item detailItem(int itemNo);
	public int modifyItem(Item item);
	public int deleteItem(int itemNo);
	public int countItem();
	public List<Purchase> listPurchase();
	public Item getItem(int itemNo);
}
