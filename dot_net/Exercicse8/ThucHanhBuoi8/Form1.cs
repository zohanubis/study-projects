using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ThucHanhBuoi8
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        private Form currentFormChild;
        private void OpenChildForm(Form childForm)
        {
            if (currentFormChild != null)
            {
                currentFormChild.Close();
            }
            currentFormChild = childForm;
            childForm.TopLevel = false;
            childForm.FormBorderStyle = FormBorderStyle.None;
            childForm.Dock = DockStyle.Fill;
            panel_Body.Controls.Add(childForm);
            panel_Body.Tag = childForm;
            childForm.BringToFront();
            childForm.Show();
        }
        private void pictureBox1_Click(object sender, EventArgs e)
        {
            if (currentFormChild != null)
            {
                currentFormChild.Close();
            }
        }

        private void btnMau_Click(object sender, EventArgs e)
        {
            OpenChildForm(new Sample_Ex1());
            label1.Text = btnMau1.Text;
        }

        private void btnMau2_Click(object sender, EventArgs e)
        {
            OpenChildForm(new Sample_Ex2());
            label1.Text = btnMau2.Text;
        }

        private void btnEx1_Click(object sender, EventArgs e)
        {
            OpenChildForm(new Class_Ex1());
            label1.Text = btnEx1.Text;
        }

        private void btnEx2_Click(object sender, EventArgs e)
        {
            OpenChildForm(new Class_Ex2());
            label1.Text = btnEx2.Text;
        }

        private void btnAd_Ex1_Click(object sender, EventArgs e)
        {
            OpenChildForm(new Advanced_Ex1());
            label1.Text = btnAd_Ex1.Text;
        }

        private void btnAd_Ex2_Click(object sender, EventArgs e)
        {
            OpenChildForm(new Advanced_Ex2());
            label1.Text = btnAd_Ex2.Text;
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
