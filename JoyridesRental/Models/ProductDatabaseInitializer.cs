using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace JoyridesRental.Models
{
    public class ProductDatabaseInitializer: DropCreateDatabaseAlways<ProductContext>
    {
        protected override void Seed(ProductContext context) 
        { 
            GetCategories().ForEach(c => context.Categories.Add(c));
            GetProducts().ForEach(p => context.Products.Add(p));
        }

        private static List<Category> GetCategories() 
        {
            var categories = new List<Category>
            {
                new Category {
                    CategoryID = 1,
                    CategoryName = "Sedan"
                },

                new Category {
                    CategoryID = 2,
                    CategoryName = "SUV"
                },
                new Category {
                    CategoryID = 3,
                    CategoryName = "Luxury"
                },    
            };
            return categories;
        }

        private static List<Product> GetProducts() 
        {
            var products = new List<Product>
            {
                 new Product
                 {
                    ProductID = 1,
                    ProductName = "BMW M2",
                    Description = "The bmw m2 is a wonderful 4 seater",
                    ImagePath = "img/bmw-m2.jpg",
                    UnitPrice = 15000.00,
                    CategoryID = 3
                 },
                 new Product
                 {
                    ProductID = 2,
                    ProductName = "Audi A6",
                    Description = "The Audi A6 is a good SUV also",
                    ImagePath = "img/audi-a6.jpg",
                    UnitPrice = 18000.00,
                    CategoryID = 1
                 },
                 new Product
                 {
                    ProductID = 3,
                    ProductName = "Nissan",
                    Description = "Nice family car",
                    ImagePath = "img/2020_nissan.jpg",
                    UnitPrice = 5000.00,
                    CategoryID = 1
                 },
                 new Product
                 {
                    ProductID = 4,
                    ProductName = "Volkwagen Tiguan",
                    Description = "Plenty leg space in the back",
                    ImagePath = "img/vw.jpg",
                    UnitPrice = 8000.00,
                    CategoryID = 2
                 },
                 new Product
                 {
                    ProductID = 5,
                    ProductName = "Mercedes Benz C Class",
                    Description = "Plenty leg space in the back",
                    ImagePath = "img/C-class.jpg",
                    UnitPrice = 18000.00,
                    CategoryID = 3
                 }
            };
            return products;
        }

    }
}