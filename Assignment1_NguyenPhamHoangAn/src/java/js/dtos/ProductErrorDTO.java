/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package js.dtos;

/**
 *
 * @author Admin
 */
public class ProductErrorDTO {
    private String productIDError;
    private String priceError;
    private String quantityError;
    private String descriptionError;
    private String imageError;

    public ProductErrorDTO() {
    }

    public ProductErrorDTO(String productIDError, String priceError, String quantityError, String descriptionError, String imageError) {
        this.productIDError = productIDError;
        this.priceError = priceError;
        this.quantityError = quantityError;
        this.descriptionError = descriptionError;
        this.imageError = imageError;
    }

    public String getProductIDError() {
        return productIDError;
    }

    public void setProductIDError(String productIDError) {
        this.productIDError = productIDError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(String quantityError) {
        this.quantityError = quantityError;
    }

    public String getDescriptionError() {
        return descriptionError;
    }

    public void setDescriptionError(String descriptionError) {
        this.descriptionError = descriptionError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }
    
    
    
}
