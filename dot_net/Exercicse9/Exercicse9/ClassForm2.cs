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
    public partial class ClassForm2 : Form
    {
        SqlConnection cn = new SqlConnection("Data Source=ZOHANUBIS;Initial Catalog=QLSinhVien;Integrated Security=True");
        SqlDataAdapter da_Lop;
        DataSet ds_Lop = new DataSet();
        DataColumn[] key = new DataColumn[1];
        public ClassForm2()
        {
            InitializeComponent();
            Load_cboLop();
        }
        void Load_cboLop()
        {
            string strSelect = "Select * from Lop";
            da_Lop = new SqlDataAdapter(strSelect, cn);
            da_Lop.Fill(ds_Lop, "LoaiLop");
            //Thêm tất cả lớp
            DataRow newrow = ds_Lop.Tables["LoaiLop"].NewRow();
            newrow["MaLop"] = "Lop000";
            newrow["TenLop"] = "Tất cả Lớp";
            ds_Lop.Tables["LoaiLop"].Rows.InsertAt(newrow, 0);
            comboBoxLop.DataSource = ds_Lop.Tables["LoaiLop"];
            comboBoxLop.DisplayMember = "TenLop";
            comboBoxLop.ValueMember = "MaLop";
        }
        void Load_Grid()
        {
            string strSelect = "Select * from SinhVien";
            da_Lop = new SqlDataAdapter(strSelect, cn);
            da_Lop.Fill(ds_Lop, "SinhVien");
            key[0] = ds_Lop.Tables["SinhVien"].Columns[0];
            ds_Lop.Tables["SinhVien"].PrimaryKey = key;
            dataGridView.DataSource = ds_Lop.Tables["SinhVien"];
        }
        void Load_GridType(string MaLop)
        {
            if (MaLop == "Lop000")
            {
                Load_Grid();
            }
            else
            {
                ds_Lop.Tables["SinhVien"].Clear();
                string strSelect = "Select * from SinhVien where MaLop = '" + MaLop + "'";
                da_Lop = new SqlDataAdapter(strSelect, cn);
                da_Lop.Fill(ds_Lop, "SinhVien");
                key[0] = ds_Lop.Tables["SinhVien"].Columns[0];
                ds_Lop.Tables["SinhVien"].PrimaryKey = key;
                dataGridView.DataSource = ds_Lop.Tables["SinhVien"];
            }
        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            DataRow newrow = ds_Lop.Tables["SinhVien"].NewRow();
            newrow["MaSinhVien"] = txtMaSinhVien.Text;
            newrow["HoTen"] = txtTenSinhVien.Text;
            newrow["NgaySinh"] = maskedTextBoxNgaySinh.Text;
            newrow["MaLop"] = comboBoxLop.SelectedValue.ToString();
            try
            {
                ds_Lop.Tables["SinhVien"].Rows.Add(newrow);
            }
            catch
            {
                MessageBox.Show("Mã Lớp không được trùng");
            }
            SqlCommandBuilder cb = new SqlCommandBuilder(da_Lop);
            da_Lop.Update(ds_Lop, "SinhVien");
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            DataRow dr = ds_Lop.Tables["SinhVien"].Rows.Find(txtMaSinhVien.Text);
            if(dr != null) { dr.Delete(); }
            SqlCommandBuilder cb = new SqlCommandBuilder(da_Lop);
            da_Lop.Update(ds_Lop, "SinhVien");
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            DataRow dr = ds_Lop.Tables["SinhVien"].Rows.Find(txtMaSinhVien.Text);
            if (dr != null)
            {
                dr["HoTen"] = txtTenSinhVien.Text;
                dr["NgaySinh"] = maskedTextBoxNgaySinh.Text;
                SqlCommandBuilder cb = new SqlCommandBuilder(da_Lop);
                da_Lop.Update(ds_Lop, "SinhVien");
            }
        }

        private void dataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (e.RowIndex >= 0)
                {
                    DataGridViewRow row = dataGridView.Rows[e.RowIndex];

                    txtMaSinhVien.Text = row.Cells["MaSinhVien"].Value?.ToString() ?? "";
                    txtTenSinhVien.Text = row.Cells["HoTen"].Value?.ToString() ?? "";

                    object ngaySinhValue = row.Cells["NgaySinh"].Value;
                    maskedTextBoxNgaySinh.Text = ngaySinhValue != null ? ngaySinhValue.ToString() : "";
                }
            }
            catch
            {
                txtMaSinhVien.Clear();
                txtTenSinhVien.Clear();
                maskedTextBoxNgaySinh.Clear();
            }
        }

        private void comboBoxLop_SelectedIndexChanged(object sender, EventArgs e)
        {
            comboBoxLop.ValueMember = "MaLop";
            string maLop = comboBoxLop.SelectedValue.ToString();
            Load_GridType(maLop);
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
