/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package js.dtos;

import java.util.HashMap;
import java.util.Map;

public class CartDTO {

    private String userID;
    private Map<String, ProductDTO> cartMap;

    public CartDTO() {
    }

    public CartDTO(String userID, Map<String, ProductDTO> cartMap) {
        this.userID = userID;
        this.cartMap = cartMap;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Map<String, ProductDTO> getCartMap() {
        return cartMap;
    }

    public void setCartMap(Map<String, ProductDTO> cartMap) {
        this.cartMap = cartMap;
    }

    public void add(ProductDTO dto) {
        if (cartMap == null) {
            cartMap = new HashMap<>();
        }

        if (this.cartMap.containsKey(dto.getProductID())) {
            int quantity = this.cartMap.get(dto.getProductID()).getQuantity();
            dto.setQuantity(quantity + dto.getQuantity());
        }
        cartMap.put(dto.getProductID(), dto);

    }

    public void delete(String id) {
        if (cartMap == null) {
            return;
        }
        if (cartMap.containsKey(id)) {
            cartMap.remove(id);
        }
    }

    public void update(ProductDTO room) {
        if (cartMap == null) {
            return;
        }
        if (cartMap.containsKey(room.getProductID())) {
            cartMap.replace(room.getProductID(), room);
        }
    }
    
    public void updateQuan(ProductDTO dto) {
       if (cartMap == null) {
            return;
        }

        if (this.cartMap.containsKey(dto.getProductID())) {
           
            cartMap.replace(dto.getProductID(), dto);
        }
        
    }

}
