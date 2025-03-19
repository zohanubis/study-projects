using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI
{
    public partial class Login : Form
    {
        
        public Login()
        {
            InitializeComponent();
        }

        private void guna2Btn_Signin_Click(object sender, EventArgs e)
        {
            //if (db.KiemTraTaiKhoan(guna2TextBoxPass.Text,guna2TextBoxPass.Text) == "AD" || guna2TextBoxUser.Text == "AD" && guna2TextBoxPass.Text == "123")
            //{
            //    Loading _load = new Loading();
            //    _load.Show();
            //}
            //else if (db.KiemTraTaiKhoan(guna2TextBoxPass.Text, guna2TextBoxPass.Text) == "NV01" || guna2TextBoxUser.Text == "NV" && guna2TextBoxPass.Text == "567")
            //{

            //}
            if(guna2TextBoxPass.Text == "123" && guna2TextBoxUser.Text == "AD")
            {
                Loading_Admin _load = new Loading_Admin();
                _load.Show();
                this.Hide();

            }
            else if(guna2TextBoxPass.Text == "345" && guna2TextBoxUser.Text == "NV")
            {
                Loading_User _load = new Loading_User();
                _load.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Người dùng không tồn tại");
            }
            
        }

        private void Login_Load(object sender, EventArgs e)
        {
            guna2ShadowForm1.SetShadowForm(this);
        }
    }
}
