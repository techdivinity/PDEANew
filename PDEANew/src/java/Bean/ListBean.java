/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.util.ArrayList;

/**
 *
 * @author divinity
 */
public class ListBean {
    String file;
    String listType;
    String[] headers;
    String[] allowedCIDUniq;
    ArrayList<String[]> elements;

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public String getListType() {
        return listType;
    }

    public void setListType(String listType) {
        this.listType = listType;
    }

    public String[] getHeaders() {
        return headers;
    }

    public void setHeaders(String[] headers) {
        this.headers = headers;
    }

    public String[] getAllowedCIDUniq() {
        return allowedCIDUniq;
    }

    public void setAllowedCIDUniq(String[] allowedCIDUniq) {
        this.allowedCIDUniq = allowedCIDUniq;
    }

      

    public ArrayList<String[]> getElements() {
        return elements;
    }

    public void setElements(ArrayList<String[]> elements) {
        this.elements = elements;
    }
    
    
}
