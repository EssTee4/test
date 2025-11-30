package com.aayushdb.web.service;

import java.util.List;

public interface GenericService<T> {
    List<T> getAll();
    T getById(int id);
    void save(T model);
    
}