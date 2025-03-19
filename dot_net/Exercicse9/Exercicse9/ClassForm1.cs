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
    public partial class ClassForm1 : Form
    {
        SqlConnection cn = new SqlConnection("Data Source=ZOHANUBIS;Initial Catalog=QLSinhVien;Integrated Security=True");
        SqlDataAdapter da_Khoa; 
        DataSet ds_Khoa = new DataSet();
        DataColumn[] key = new DataColumn[1];
        public ClassForm1()
        {
            InitializeComponent();
            Load_cboKhoa();
        }
        void Load_cboKhoa()
        {
            string strSelect = "Select * from Khoa";
            da_Khoa = new SqlDataAdapter(strSelect, cn);
            da_Khoa.Fill(ds_Khoa, "Khoa");
            //Thêm tất cả khoa
            DataRow newrow = ds_Khoa.Tables["Khoa"].NewRow();
            newrow["MaKhoa"] = "Khoa000";
            newrow["TenKhoa"] = "Tất cả khoa";
            ds_Khoa.Tables["Khoa"].Rows.InsertAt(newrow, 0);
            comboBoxKhoa.DataSource = ds_Khoa.Tables["Khoa"];
            comboBoxKhoa.DisplayMember = "TenKhoa";
            comboBoxKhoa.ValueMember = "MaKhoa";
        }
        void Load_Grid()
        {
            string strSelect = "Select * from Lop";
            da_Khoa = new SqlDataAdapter(strSelect, cn);
            da_Khoa.Fill(ds_Khoa, "Lop");
            key[0] = ds_Khoa.Tables["Lop"].Columns[0];
            ds_Khoa.Tables["Lop"].PrimaryKey = key;
            dataGridView.DataSource = ds_Khoa.Tables["Lop"];
        }
        void Load_GridType(string MaKhoa)
        {
            if(MaKhoa == "Khoa000")
            {
                Load_Grid();
            }
            else
            {
                ds_Khoa.Tables["Lop"].Clear();
                string strSelect = "Select * from Lop where MaKhoa = '" + MaKhoa + "'";
                da_Khoa = new SqlDataAdapter(strSelect, cn);
                da_Khoa.Fill(ds_Khoa, "Lop");
                key[0] = ds_Khoa.Tables["Lop"].Columns[0];
                ds_Khoa.Tables["Lop"].PrimaryKey = key;
                dataGridView.DataSource = ds_Khoa.Tables["Lop"];
            }
        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            DataRow newrow = ds_Khoa.Tables["Lop"].NewRow();
            newrow["MaLop"] = txtMaLop.Text;
            newrow["TenLop"] = txtTenLop.Text;
            try
            {
                ds_Khoa.Tables["Lop"].Rows.Add(newrow);
            }
            catch
            {
                MessageBox.Show("Mã Lớp không được trùng");
            }
            SqlCommandBuilder cb = new SqlCommandBuilder(da_Khoa);
            da_Khoa.Update(ds_Khoa, "Lop");
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            DataRow dr = ds_Khoa.Tables["Lop"].Rows.Find(txtMaLop.Text);
            if(dr != null) { dr.Delete(); }
            SqlCommandBuilder cb = new SqlCommandBuilder(da_Khoa);
            da_Khoa.Update(ds_Khoa, "Lop");
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            DataRow dr = ds_Khoa.Tables["Lop"].Rows.Find(txtMaLop.Text);
            if (dr != null)
            {
                dr["TenLop"] = txtTenLop.Text;
                SqlCommandBuilder cb = new SqlCommandBuilder(da_Khoa);
                da_Khoa.Update(ds_Khoa, "Lop");
            }
        }

        private void dataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = new DataGridViewRow();
            try
            {
                row = dataGridView.Rows[e.RowIndex];
                txtMaLop.Text = Convert.ToString(row.Cells["MaLop"].Value);
                txtTenLop.Text = Convert.ToString(row.Cells["TenLop"].Value);
                //comboBoxKhoa.SelectedValue = Convert.ToString(row.Cells["MaLoai"].Value);
            }
            catch
            {
                txtTenLop.Clear();
                txtMaLop.Clear();
            }
        }

        private void comboBoxKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            comboBoxKhoa.ValueMember = "MaKhoa";
            string maKhoa = comboBoxKhoa.SelectedValue.ToString();
            Load_GridType(maKhoa);
        }
    }
}
