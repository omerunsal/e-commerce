using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebLibrary.Compare
{
    public class Tools
    {
        public static List<Product> GetComparables(object value)
        {
            if (value == null) //sepette seçili ürün yoksa 
            {
                return new List<Product>();
            }
            else //sepette ürün varsa
            {
                return (List<Product>)value;
            }
        }

        public static List<Product> AddToCompare(object destinationArea, Product addItem)
        {
            List<Product> currentItems = null;

            if (destinationArea == null) //karşılaştırılacak alanım boşsa
            {
                currentItems = new List<Product>();
            }
            else //karşılaştırılacak alanımda ürünler boşsa
            {
                currentItems = (List<Product>)destinationArea;
            }

            currentItems.Add(addItem);

            return currentItems;
        }
        public static List<Product> RemoveFromCompare(Product removeItem, object destinationArea)
        {
            List<Product> currentItems = null;

            if (destinationArea == null) //karşılaştırılacak alanım boşsa
            {
                currentItems = new List<Product>();
            }
            else //karşılaştırılacak alanımda ürünler boşsa
            {
                currentItems = (List<Product>)destinationArea;
            }

            currentItems.Remove(removeItem);

            return currentItems;
        }
    }
}