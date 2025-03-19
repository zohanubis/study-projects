using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;

namespace Exercicse9
{
    public partial class Sample_Ex2 : Form
    {
        SqlConnection cn = new SqlConnection("Data Source=ZOHANUBIS;Initial Catalog=QLSinhVien;Integrated Security=True");
        SqlDataAdapter da_Khoa;
        DataSet ds_Khoa = new DataSet();
        DataColumn[] key = new DataColumn[1];
        public Sample_Ex2()
        {
            InitializeComponent();
            load_grid();
        }
        void load_grid()
        {
            string strSelect = "Select * from Khoa";
            da_Khoa = new SqlDataAdapter(strSelect, cn);
            da_Khoa.Fill(ds_Khoa, "Khoa");
            key[0] = ds_Khoa.Tables["Khoa"].Columns[0];
            ds_Khoa.Tables["Khoa"].PrimaryKey = key;
            dataGridView1.DataSource = ds_Khoa.Tables["Khoa"];
        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            DataRow newrow = ds_Khoa.Tables["Khoa"].NewRow();
            newrow["MaKhoa"]= txtMaKhoa.Text;
            newrow["TenKhoa"] = txtTenKhoa.Text;
            try
            {
                ds_Khoa.Tables["Khoa"].Rows.Add(newrow);
            }
            catch
            {
                MessageBox.Show("Mã Khoa không được trùng");
            }
            SqlCommandBuilder cb = new SqlCommandBuilder(da_Khoa);
            da_Khoa.Update(ds_Khoa, "Khoa");
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            DataRow dr = ds_Khoa.Tables["Khoa"].Rows.Find(txtMaKhoa.Text);
            if(dr != null) { dr.Delete(); }
            SqlCommandBuilder cb = new SqlCommandBuilder(da_Khoa);
            da_Khoa.Update(ds_Khoa, "Khoa");
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            DataRow dr = ds_Khoa.Tables["Khoa"].Rows.Find(txtMaKhoa.Text);
            if(dr != null)
            {
                dr["TenKhoa"] = txtTenKhoa.Text;
                SqlCommandBuilder cb = new SqlCommandBuilder(da_Khoa);
                da_Khoa.Update(ds_Khoa, "Khoa");
            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = new DataGridViewRow();
            try
            {
                row = dataGridView1.Rows[e.RowIndex];
                txtMaKhoa.Text = Convert.ToString(row.Cells["MaKhoa"].Value);
               txtTenKhoa.Text = Convert.ToString(row.Cells["TenKhoa"].Value);
                
            }
            catch
            {
                txtTenKhoa.Clear();
                txtMaKhoa.Clear();
            }
        }
    }
}
