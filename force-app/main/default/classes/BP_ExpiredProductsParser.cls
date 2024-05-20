public without sharing class BP_ExpiredProductsParser
{
    public Product product;
    public Decimal expirationDays;
    public Decimal amount;
    public Decimal tradeAmount;
    public String currencyCode;

    public class Product{
        public String productNumber;
        public String productDescription;
    }
}