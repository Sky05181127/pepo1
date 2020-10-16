package com.bjsxt.pojo;

public class Menu {
    private Integer id;
    private Integer pid;
    private String name;
    private String url;
    private Integer open;
    private Integer isParent;
    private String target;
    private String icon;

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", pid=" + pid +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", open=" + open +
                ", isParent=" + isParent +
                ", target='" + target + '\'' +
                ", icon='" + icon + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getOpen() {
        return open;
    }

    public void setOpen(Integer open) {
        this.open = open;
    }

    public Integer getIsParent() {
        return isParent;
    }

    public void setIsParent(Integer isParent) {
        this.isParent = isParent;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Menu() {
    }

    public Menu(Integer id, Integer pid, String name, String url, Integer open, Integer isParent, String target, String icon) {

        this.id = id;
        this.pid = pid;
        this.name = name;
        this.url = url;
        this.open = open;
        this.isParent = isParent;
        this.target = target;
        this.icon = icon;
    }
}
