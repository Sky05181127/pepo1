package com.bjsxt.pojo;

import java.util.List;

public class PageResult<T> {
    private Integer total;//总的数据量
    private List<T> rows;//当前请求页的数据

    @Override
    public String toString() {
        return "PageResult{" +
                "total=" + total +
                ", rows=" + rows +
                '}';
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    public PageResult(Integer total, List<T> rows) {

        this.total = total;
        this.rows = rows;
    }
}
