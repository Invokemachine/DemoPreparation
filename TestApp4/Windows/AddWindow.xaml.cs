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
using System.Windows.Shapes;
using TestApp4.Models;

namespace TestApp4.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddWindow.xaml
    /// </summary>
    public partial class AddWindow : Window
    {
        TestDbFinalContext db = new TestDbFinalContext();
        Good _currentProduct;
        User _currentUser;

        public AddWindow(User currentUser)
        {
            InitializeComponent();
            _currentProduct = new Good();
            _currentUser = currentUser;
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            ProductsWindow products = new(_currentUser);
            products.Show();
            Close();
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (String.IsNullOrEmpty(NameTextBox.Text))
                MessageBox.Show("Введите имя", "Ошибка");
            else if (String.IsNullOrEmpty(UnitTypeTextBox.Text))
                MessageBox.Show("Введите ед. измерения", "Ошибка");
            else if (String.IsNullOrEmpty(PriceTextBox.Text))
                MessageBox.Show("Введите цену", "Ошибка");
            else if (String.IsNullOrEmpty(MaxDiscountTextBox.Text))
                MessageBox.Show("Введите макс. скидку", "Ошибка");
            else if (String.IsNullOrEmpty(ManufacturerTextBox.Text))
                MessageBox.Show("Введите производителя", "Ошибка");
            else if (String.IsNullOrEmpty(SupplierTextBox.Text))
                MessageBox.Show("Введите поставщика", "Ошибка");
            else if (String.IsNullOrEmpty(CategoryTextBox.Text))
                MessageBox.Show("Введите категорию", "Ошибка");
            else if (String.IsNullOrEmpty(CurrentDiscountTextBox.Text))
                MessageBox.Show("Введите действ. скидку", "Ошибка");
            else if (String.IsNullOrEmpty(AmountTextBox.Text))
                MessageBox.Show("Введите количество", "Ошибка");
            else if (errors.Length > 0)
                MessageBox.Show(errors.ToString());
            using (var db = new TestDbFinalContext())
            {
                try
                {
                    _currentProduct.Name = NameTextBox.Text;
                    _currentProduct.UnitType = UnitTypeTextBox.Text;
                    _currentProduct.Price = Convert.ToDouble(PriceTextBox.Text);
                    _currentProduct.MaxDiscountAmount = Convert.ToInt32(MaxDiscountTextBox.Text);
                    _currentProduct.Article = ArticleTextBox.Text;
                    _currentProduct.Manufacturer = ManufacturerTextBox.Text;
                    _currentProduct.Supplier = SupplierTextBox.Text;
                    _currentProduct.Category = CategoryTextBox.Text;
                    _currentProduct.AmountInStock = Convert.ToInt32(AmountTextBox.Text);
                    _currentProduct.CurrentDiscount = Convert.ToInt32(CurrentDiscountTextBox.Text);
                    db.Goods.Add(_currentProduct);
                    db.SaveChanges();
                    MessageBox.Show("Успех");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }
    }
}
