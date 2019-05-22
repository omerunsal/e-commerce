using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebLibrary.Cart
{
    public class Tools
    {
        public static List<CartProduct> GetAllCartProducts(object value)
        {
            if (value == null) //sepette seçili ürün yoksa 
            {
                return new List<CartProduct>();
            }
            else //sepette ürün varsa
            {
                return (List<CartProduct>)value;
            }
        }

        public static List<CartProduct> AddItem(CartProduct newItem, object value)
        {
            List<CartProduct> currentItems = GetAllCartProducts(value);

            currentItems.Add(newItem);

            return currentItems;
        }
        public static List<CartProduct> RemoveItem(CartProduct newItem, object value)
        {
            List<CartProduct> currentItems = GetAllCartProducts(value);

            currentItems.Remove(newItem);

            return currentItems;
        }
        public static int? TotalProductCount(object value)
        {
            List<CartProduct> currentItems = GetAllCartProducts(value);

            int? result = null;

            foreach (CartProduct cur in currentItems)
            {
                result += (cur.Quantity); //adet olayımız
            }
            return result;
        }

        public static decimal? TotalProductPrice(object value)
        {
            List<CartProduct> currentItems = GetAllCartProducts(value);

            decimal? result = null;

            foreach (CartProduct cur in currentItems)
            {
                result += (cur.Quantity * cur.SelectedProduct.UnitPrice); //adet olayımız
            }
            return result;
        }
    }
}