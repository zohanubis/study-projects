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
    public partial class QuyDinh : Form
    {
        public QuyDinh()
        {
            InitializeComponent();
        }

        private void btnAdmin_Click(object sender, EventArgs e)
        {
            richTextBoxAdmin.Visible = true;
        }

        private void QuyDinh_Load(object sender, EventArgs e)
        {
            richTextBoxAdmin.Visible = false;
            richTextBoxNV.Visible = false;
            richTextBoxDoiTra.Visible = false;
        }

        private void btnNhanVien_Click(object sender, EventArgs e)
        {
            richTextBoxAdmin.Visible = false;
            richTextBoxNV.Visible = true;
        }

        private void btnDoiTra_Click(object sender, EventArgs e)
        {
            richTextBoxNV.Visible = false;
            richTextBoxDoiTra.Visible = true;

        }
    }
}
