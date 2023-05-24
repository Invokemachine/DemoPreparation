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
    /// Логика взаимодействия для ProductsWindow.xaml
    /// </summary>
    public partial class ProductsWindow : Window
    {
        TestDbFinalContext db = new TestDbFinalContext();
        List<Good> productList = new List<Good>();
        User _currentUser;
        Good _currentProduct;

        public ProductsWindow(User user)
        {
            InitializeComponent();
            _currentUser = user;
            _currentProduct = new Good();
            productList = db.Goods.ToList();
            ProductsList.ItemsSource = productList;

            if(_currentUser.RoleId == 1)
            {
                EditButton.IsEnabled = true;
                DeleteButton.IsEnabled = true;
            }

            foreach(Good good in productList)
            {
                if (good.Picture == null)
                    good.Picture = $"/Resources/nullimage.png";
                else
                {
                    good.Picture.Replace("/Resources", "");
                    good.Picture = $"/Resources/{good.Picture}";
                }
            }
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            AddWindow addWindow = new(_currentUser);
            addWindow.Show();
            Close();
        }

        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            if (_currentProduct != null)
            {
                EditWindow edit = new EditWindow(_currentUser, _currentProduct);
                edit.Show();
                Close();
            }
            else
                MessageBox.Show("Выберите продукт");
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            var elements = ProductsList.SelectedItems.Cast<Good>().ToList();
            if(MessageBox.Show($"Вы точно хотите удалить следующие {elements.Count} элементов?", "Внимание", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                try
                {
                    MessageBox.Show("Успех", "Внимание");
                    db.RemoveRange(elements);
                    db.SaveChanges();
                    ProductsList.ItemsSource = db.Goods.ToList();
                }
                catch(Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void ProductsList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            _currentProduct = ProductsList.SelectedItem as Good;
        }
    }
}
