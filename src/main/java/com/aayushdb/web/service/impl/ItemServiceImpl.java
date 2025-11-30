package com.aayushdb.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aayushdb.web.dao.ItemDAO;
import com.aayushdb.web.entity.Item;
import com.aayushdb.web.service.ItemService;

@Service
public class ItemServiceImpl extends GenericServiceImpl<Item> implements ItemService {
    @Autowired private ItemDAO itemDAO;

    public ItemServiceImpl() {
        super(null);
    }

    public List<Item> getAllItems() {
        return itemDAO.getAll();
    }

    @Override
    public List<Item> getAll() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void save(Item item) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Item getById(int id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
