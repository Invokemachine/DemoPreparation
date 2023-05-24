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
using TestApp4.Models;
using TestApp4.Windows;

namespace TestApp4
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        TestDbFinalContext db = new TestDbFinalContext();
        public int LoginAttempts = 0;

        public MainWindow()
        {
            InitializeComponent();
        }

        private void EnterButton_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder(); 
            if (String.IsNullOrEmpty(LoginTextBox.Text))
            {
                MessageBox.Show("Введите логин", "Ошибка");
                LoginAttempts++;
                return;
            }
            else if (String.IsNullOrEmpty(UserPasswordBox.Password))
            {
                MessageBox.Show("Введите пароль", "Ошибка");
                LoginAttempts++;
                return;
            }
            else if (errors.Length>0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            else if(!String.IsNullOrEmpty(LoginTextBox.Text) && !String.IsNullOrEmpty(UserPasswordBox.Password))
            {
                foreach(User user in db.Users)
                {
                    try
                    {
                        if (LoginTextBox.Text != user.Login)
                        {
                            MessageBox.Show("Логин неверный", "Ошибка");
                            LoginAttempts++;
                            return;
                        }
                        else if (UserPasswordBox.Password != user.Password)
                        {
                            MessageBox.Show("Пароль неверный", "Ошибка");
                            LoginAttempts++;
                            return;
                        }
                        else if (LoginTextBox.Text == user.Login && UserPasswordBox.Password == user.Password)
                        {
                            MessageBox.Show("Успешная авторизация", "Внимание");
                            LoginAttempts = 0;
                            ProductsWindow productsWindow = new ProductsWindow(user);
                            productsWindow.Show();
                            Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message.ToString(),"Ошибка");
                    }
                }
            }
        }
    }
}
