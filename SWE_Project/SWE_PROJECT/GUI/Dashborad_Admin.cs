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
    public partial class Dashborad_Admin : Form
    {
        private Form currentFormChild;
        private void OpenChildForm(Form childForm)
        {
            if (currentFormChild != null) { currentFormChild.Close(); }
            currentFormChild = childForm;
            childForm.TopLevel = false;
            childForm.FormBorderStyle = FormBorderStyle.None;
            childForm.Dock = DockStyle.Fill;
            guna2Panel_Container.Controls.Add(childForm);
            guna2Panel_Container.Tag = childForm;
            childForm.BringToFront();
            childForm.Show();
        }
        public Dashborad_Admin()
        {
            InitializeComponent();
        }

        private void guna2Button3_Click(object sender, EventArgs e)
        {
            this.Close();
            Login lg = new Login();
            lg.Show();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            if (currentFormChild != null) { currentFormChild.Close(); }

        }

        private void guna2ButtonNV_Click(object sender, EventArgs e)
        {
            OpenChildForm(new NhanVien());
            label_val.Text = "THÊM NGƯỜI DÙNG";
        }

        private void guna2ButtonCheck_Click(object sender, EventArgs e)
        {
            OpenChildForm(new KiemTra());
            label_val.Text = "KIỂM TRA ĐƠN HÀNG";
        }

        private void guna2ButtonTim_Click(object sender, EventArgs e)
        {
            OpenChildForm(new TimKiem());
            label_val.Text = "TÌM KIẾM ĐƠN HÀNG";

        }

        private void guna2Button2_Click(object sender, EventArgs e)
        {
            OpenChildForm(new TraHang());
            label_val.Text = "QUY TRÌNH TRẢ HÀNG";
        }

        private void guna2ButtonQD_Click(object sender, EventArgs e)
        {
            OpenChildForm(new QuyDinh());
            label_val.Text = "QUY ĐỊNH TRẢ HÀNG";
        }

        private void guna2Button1_Click(object sender, EventArgs e)
        {
            if (currentFormChild != null) { currentFormChild.Close(); }

        }
    }
}
