package com.tj.mac.controller;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.mac.model.Item;
import com.tj.mac.model.Purchase;
import com.tj.mac.model.PurchaseItem;
import com.tj.mac.service.ItemService;
import com.tj.mac.service.Paging;
import com.tj.mac.service.PurchaseItemService;
import com.tj.mac.service.PurchaseService;
@Controller
@RequestMapping("item")
public class ItemController {
	@Autowired
	private ItemService itemService;
	@Autowired
	private PurchaseService purchaseService;
	@Autowired
	private PurchaseItemService purchaseItemService;
	
	@RequestMapping(params="method=writeForm")
	public String writeForm() {
		return "item/writeForm";
	}
	@RequestMapping(params="method=write")
	public String write(Item item, MultipartHttpServletRequest mRequest) {
		itemService.writeItem(mRequest, item);
		return "redirect:item.do?method=writeForm";
	}
	@RequestMapping(params="method=list")
	public String list(Item item, String pageNum, Model model) {
		Paging paging = new Paging(itemService.countItem(), pageNum, 8, 5 );
		item.setStartRow(paging.getStartRow());
		item.setEndRow(paging.getEndRow());
		model.addAttribute("list", itemService.listItemPaging(item));
		model.addAttribute("paging", paging);
		return "item/list";
	}
	@RequestMapping(params="method=detail")
	public String detail(int itemNo, Model model) {
		model.addAttribute("detail", itemService.detailItem(itemNo));
		return "item/detail";
	}
	
	@RequestMapping(params="method=modifyForm")
	public String modifyForm(int itemNo, String pageNum, Model model) {
		model.addAttribute("detail", itemService.detailItem(itemNo));
		return "item/modifyForm";
	}
	@RequestMapping(params="method=modify")
	public String modify(MultipartHttpServletRequest mRequest, String pageNum) {
		itemService.modifyItem(mRequest);
		return "redirect:item.do?method=list&pageNum="+pageNum;
	}
	@RequestMapping(params="method=delete")
	public String delete(int itemNo, String pageNum) {
		itemService.deleteItem(itemNo);
		return "redirect:item.do?method=list&pageNum="+pageNum;
	}
	@RequestMapping(params="method=purchaselist") // itemNo=1&itemNo=3&itemNo=5
	public String purchaselist(Purchase purchase, PurchaseItem purchaseItem, int[] itemNo, Model model) {
		List<Item> items = new ArrayList<Item>();
		int totalPrice = 0;
		for(int item : itemNo) {
			items.add(itemService.getItem(item));
		}
		for(Item item : items) {
			totalPrice += item.getItemPrice();
		}
		purchase.setPurchasePrice(totalPrice);
		purchaseService.addPurchase(purchase);
		purchaseItem.setPurchaseNo(purchaseService.getLastPurchaseNo());
		for(int item : itemNo) {
			purchaseItem.setItemNo(item);
			purchaseItemService.addPurchaseItem(purchaseItem);
		}
		model.addAttribute("purchaselist", items);
		model.addAttribute("totalPrice", totalPrice);
		
		
		return "item/purchaselist";
	}
	
}