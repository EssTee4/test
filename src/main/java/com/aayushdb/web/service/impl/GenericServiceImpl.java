package com.aayushdb.web.service.impl;

import com.aayushdb.web.service.GenericService;
import com.aayushdb.web.repository.GenericRepository;

public abstract class GenericServiceImpl<T> implements GenericService<T> {

    private final GenericRepository<T> repository;

    public GenericServiceImpl(GenericRepository<T> repository) {
        this.repository = repository;
    }

}
