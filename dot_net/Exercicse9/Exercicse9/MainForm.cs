using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Exercicse9
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
            if(currentFormChild != null) { currentFormChild.Close(); }
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

        private void btnMau1_Click(object sender, EventArgs e)
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
            OpenChildForm(new ClassForm1());
            label1.Text = btnEx1.Text;
        }

        private void btnEx2_Click(object sender, EventArgs e)
        {
            OpenChildForm(new ClassForm2());
            label1.Text = btnEx2.Text;
        }

        private void btnHW_Ex1_Click(object sender, EventArgs e)
        {
            OpenChildForm(new HomeWorkForm());
            label1.Text = btnHW_Ex1.Text;
        }
    }
}
