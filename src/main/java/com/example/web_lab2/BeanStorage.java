package com.example.web_lab2;

import java.util.ArrayList;
import java.util.List;

public class BeanStorage {
    private List<RowCheckout> table;

    public BeanStorage() {
        this.table = new ArrayList<RowCheckout>();
    }

    public BeanStorage(List<RowCheckout> table) {
        this.table = new ArrayList<>(table);
    }
    void addRow(RowCheckout row){
        table.add(row);
    }

    public List<RowCheckout> getTable() {
        return new ArrayList<>(table);
    }
}
