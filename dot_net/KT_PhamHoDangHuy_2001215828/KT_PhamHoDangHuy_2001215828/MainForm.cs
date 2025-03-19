using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace KT_PhamHoDangHuy_2001215828
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }
        private Form currentFormChild;
        private void OpenChildForm(Form childForm)
        {
            if (currentFormChild != null) { currentFormChild.Close(); }
            currentFormChild = childForm;
            childForm.TopLevel = false;
            childForm.FormBorderStyle = FormBorderStyle.None;
            childForm.Dock = DockStyle.Fill;
            panel_Container.Controls.Add(childForm);
            panel_Container.Tag = childForm;
            childForm.BringToFront();
            childForm.Show();
        }
        private void btnMau1_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            if (currentFormChild != null) { currentFormChild.Close(); }
            label_Val.Text = "Bài Kiểm Tra Lần 2 .NET";
            pictureBox_Val.Image = Properties.Resources.dashboard_icon;
        }

        private void btnEx1_Click(object sender, EventArgs e)
        {
            OpenChildForm(new ExerciseForm1());
            label_Val.Text = "Bài Kiểm Tra 1";
        }

        private void btnEx2_Click(object sender, EventArgs e)
        {
            OpenChildForm(new ExerciseForm2());
            label_Val.Text = "Bài Kiểm Tra 2";
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
