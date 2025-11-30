/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aayushdb.web.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aayushdb.web.entity.Item;
import com.aayushdb.web.service.ItemService;

/**
 *
 * @author dell
 */
@Controller
@RequestMapping(value="/admin/items")
public class ItemController {
    private final ItemService itemService;

    @Autowired
    public ItemController(ItemService itemService) {
        this.itemService = itemService;
    }
    
    @RequestMapping(method=RequestMethod.GET)
    public String index(Model model){
        model.addAttribute("items", itemService.getAll());
        return "admin/items/index";
        
    }
    
    @RequestMapping(value="/add", method=RequestMethod.GET)
    public String add(){
        return "admin/items/add";
        
    }
    
    @RequestMapping(value="/save", method=RequestMethod.POST)
    public String save(@ModelAttribute("Item") Item item, @RequestParam(name="refresh", required = false) String refresh){
        itemService.save(item);
        String redirect="/admin/items";
        if(refresh!=null &&refresh.equals("1")){
            redirect="/admin/items/add";
        }
        return "redirect:" + redirect;        
    }
    
    @RequestMapping(value="/edit/{id}", method=RequestMethod.GET)
    public String edit(@PathVariable("id") int id,Model model){
        model.addAttribute("item", itemService.getById(id));
        return "admin/items/edit";
        
    }

    
    @RequestMapping(value = "/{id}/json", method = RequestMethod.GET)
    @ResponseBody
    public Item getMailTemplateJson(@PathVariable("id") int id) {
        return itemService.getById(id);
    }
}
