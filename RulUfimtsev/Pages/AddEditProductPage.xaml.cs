using RulUfimtsev.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace RulUfimtsev.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddEditProductPage.xaml
    /// </summary>
    public partial class AddEditProductPage : Page
    {
        Product product = new Product(); 
        public AddEditProductPage(Product currentProduct)
        {
            InitializeComponent();

            if(currentProduct != null)
            {
                product = currentProduct;

                btnDeleteProduct.Visibility = Visibility.Visible;
                txtArticle.IsEnabled = false;
            }

            DataContext = product;
            cmbCategory.ItemsSource = CategoryList;
        }

        private string[] CategoryList =
        {
            "Аксессуары",
            "Автозапчасти",
            "Автосервис",
            "Съемники подшипников",
            "Ручные инструменты",
            "Зарядные устройства",

        };

        private void btnEnterImage_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnDeleteProduct_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnSaveProduct_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
