using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Exercise10
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
            panel_Body.Controls.Add(childForm);
            panel_Body.Tag = childForm;
            childForm.BringToFront();
            childForm.Show();
        }
        private void pictureBox1_Click(object sender, EventArgs e)
        {
            if (currentFormChild != null) { currentFormChild.Close(); }
        }

        private void btnMau1_Click(object sender, EventArgs e)
        {
            OpenChildForm(new SampleForm());
            label1.Text = btnMau1.Text;
        }

        private void btnEx1_Click(object sender, EventArgs e)
        {
            OpenChildForm(new ClassForm1());
            label1.Text = btnEx1.Text;
        }
    }
}
