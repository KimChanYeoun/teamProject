package com.tj.mac.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.mac.model.Item;
import com.tj.mac.model.Purchase;
public interface ItemService {
	public List<Item> listItem();
	public List<Item> listItemPaging(Item item);
	public int writeItem(MultipartHttpServletRequest mRequest, Item item);
	public Item detailItem(int itemNo);
	public int modifyItem(MultipartHttpServletRequest mRequest);
	public int deleteItem(int itemNo);
	public int countItem();
	public List<Purchase> listPurchase();
	public Item getItem(int itemNo);
}
