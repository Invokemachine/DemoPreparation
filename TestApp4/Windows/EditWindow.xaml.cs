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
using System.Xml.Linq;
using TestApp4.Models;

namespace TestApp4.Windows
{
    /// <summary>
    /// Логика взаимодействия для EditWindow.xaml
    /// </summary>
    public partial class EditWindow : Window
    {
        TestDbFinalContext db = new TestDbFinalContext();
        Good _currentProduct;
        User _currentUser;

        public EditWindow(User currentUser, Good currentProduct)
        {
            InitializeComponent();
            _currentProduct = currentProduct;
            _currentUser = currentUser;
            InitTextBoxes();
        }

        private void InitTextBoxes()
        {
            NameTextBox.Text = _currentProduct.Name;
            UnitTypeTextBox.Text = _currentProduct.UnitType;
            PriceTextBox.Text = Convert.ToString(_currentProduct.Price);
            MaxDiscountTextBox.Text = Convert.ToString(_currentProduct.MaxDiscountAmount);
            ArticleTextBox.Text = _currentProduct.Article;
            ManufacturerTextBox.Text = _currentProduct.Manufacturer;
            SupplierTextBox.Text = _currentProduct.Supplier;
            CategoryTextBox.Text = _currentProduct.Category;
            AmountTextBox.Text = Convert.ToString(_currentProduct.AmountInStock);
            CurrentDiscountTextBox.Text = Convert.ToString(_currentProduct.CurrentDiscount);
            DescriptionTextBox.Text = _currentProduct.Description;
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            ProductsWindow productsWindow = new ProductsWindow(_currentUser);
            productsWindow.Show();
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
                    _currentProduct.Description = DescriptionTextBox.Text;
                    _currentProduct.AmountInStock = Convert.ToInt32(AmountTextBox.Text);
                    _currentProduct.CurrentDiscount = Convert.ToInt32(CurrentDiscountTextBox.Text);
                    db.Update(_currentProduct);
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
