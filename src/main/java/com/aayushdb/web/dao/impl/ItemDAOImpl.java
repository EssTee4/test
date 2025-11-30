/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aayushdb.web.dao.impl;

import org.springframework.stereotype.Repository;

import com.aayushdb.web.dao.ItemDAO;
import com.aayushdb.web.entity.Item;

/**
 *
 * @author dell
 */
@Repository(value="itemDAO")
public class ItemDAOImpl extends GenericDAOImpl<Item> implements ItemDAO{
    
    
}
