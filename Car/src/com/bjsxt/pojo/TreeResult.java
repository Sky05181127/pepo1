package com.bjsxt.pojo;

import java.util.List;
import java.util.Map;
import java.util.Objects;

//存储菜单信息的实体类
public class TreeResult {
    private Integer id;
    private String text;
    private List<TreeResult> children;
    //声明attributes属性，存储自定义数据
    private Map<String,String> attributes;
    private String state;//设置菜单的打开状态

    @Override
    public String toString() {
        return "TreeResult{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", children=" + children +
                ", attributes=" + attributes +
                ", state='" + state + '\'' +
                '}';
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Map<String, String> getAttributes() {
        return attributes;
    }

    public void setAttributes(Map<String, String> attributes) {
        this.attributes = attributes;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TreeResult that = (TreeResult) o;
        return Objects.equals(id, that.id) &&
                Objects.equals(text, that.text) &&
                Objects.equals(children, that.children);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, text, children);
    }

    public Integer getId() {

        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<TreeResult> getChildren() {
        return children;
    }

    public void setChildren(List<TreeResult> children) {
        this.children = children;
    }

    public TreeResult() {

    }

    public TreeResult(Integer id, String text, List<TreeResult> children) {

        this.id = id;
        this.text = text;
        this.children = children;
    }
}
