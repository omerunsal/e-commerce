using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebLibrary.Cart
{
    public class CartProduct
    {
        public Product SelectedProduct { get; set; }

        public int ProductID
        {
            get
            {
                return SelectedProduct.ProductID;
            }
        }

        public string ProductName
        {
            get
            {
                return SelectedProduct.ProductName;
            }
        }
        public decimal? UnitPrice
        {
            get
            {
                return SelectedProduct.UnitPrice;
            }
        }
        public string SmallPhotoPath
        {
            get
            {
                return SelectedProduct.SmallPhotoPath;
            }
        }
        public string Description
        {
            get
            {
                return SelectedProduct.Description;
            }
        }
        public int Quantity { get; set; }
    }
}