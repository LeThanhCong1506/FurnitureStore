/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.product;

/**
 *
 * @author ASUS
 */
public class ProductDTO {

    private String id;
    private String name;
    private String type;
    private String image;
    private String description;
    private float price;
    private int sale;
    private int quantity;

    public ProductDTO() {
    }

    public ProductDTO(String id) {
        this.id = id;
    }
    

    public ProductDTO(String id, String name, String type, String image, String description, float price, int sale, int quantity) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.image = image;
        this.description = description;
        this.price = price;
        this.sale = sale;
        this.quantity = quantity;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "id=" + id + ", name=" + name + ", type=" + type + ", image=" + image + ", description=" + description + ", price=" + price + ", sale=" + sale + ", quantity=" + quantity + '}';
    }
    

    

}
