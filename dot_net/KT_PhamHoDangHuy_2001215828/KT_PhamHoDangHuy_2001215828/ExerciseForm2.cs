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

namespace KT_PhamHoDangHuy_2001215828
{
    public partial class ExerciseForm2 : Form
    {
        SqlConnection cn = new SqlConnection(Properties.Settings.Default.conStr);
        SqlDataAdapter da_Khoa;
        DataSet ds_Khoa = new DataSet();
        DataColumn[] key = new DataColumn[1];
        public ExerciseForm2()
        {
            InitializeComponent();
        }
        void Load_cboKhoa()
        {
            string strSelect = "Select * from Khoa";
            da_Khoa = new SqlDataAdapter(strSelect, cn);
            da_Khoa.Fill(ds_Khoa, "Khoa");
            DataRow newrow = ds_Khoa.Tables["Khoa"].NewRow();
            newrow["MaKhoa"] = "Khoa000";
            newrow["TenKhoa"] = "Tất cả khoa";
            ds_Khoa.Tables["Khoa"].Rows.InsertAt(newrow, 0);
            cbo_Khoa.DataSource = ds_Khoa.Tables["Khoa"];
            cbo_Khoa.DisplayMember = "TenKhoa";
            cbo_Khoa.ValueMember = "MaKhoa";
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
        void DataBingding(DataTable pDT)
        {
            cbo_Khoa.DataBindings.Clear();
            txtMaLop.DataBindings.Clear();
            txtTenLop.DataBindings.Clear();

            cbo_Khoa.DataBindings.Add("Text", pDT, "MaKhoa");
            txtTenLop.DataBindings.Add("Text", pDT, "TenLop");
            txtMaLop.DataBindings.Add("Text", pDT, "MaLop");
        }
        void Load_GridType(string MaKhoa)
        {
            if(MaKhoa == "Khoa000") { Load_Grid(); }
            else
            {
                ds_Khoa.Tables["LoaiLop"].Clear();
                string strSelect = "Select * from Lop where MaKhoa = '" + MaKhoa + "'";
                da_Khoa = new SqlDataAdapter(strSelect, cn);
                da_Khoa.Fill(ds_Khoa, "LoaiLop");
                key[0] = ds_Khoa.Tables["LoaiLop"].Columns[0];
                ds_Khoa.Tables["LoaiLop"].PrimaryKey = key;
                dataGridView.DataSource = ds_Khoa.Tables["LoaiLop"];
            }

        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            txtMaLop.Enabled = txtTenLop.Enabled = cbo_Khoa.Enabled = btnSave.Enabled = true;
            txtMaLop.Focus();
            txtTenLop.Clear();
            dataGridView.AllowUserToAddRows = true;
            dataGridView.ReadOnly = false;
            // Không được sửa các dòng có dữ liệu
            for (int i = 0; i < dataGridView.Rows.Count - 1; i++)
            {
                dataGridView.Rows[i].ReadOnly = true;
            }
            dataGridView.FirstDisplayedScrollingRowIndex = dataGridView.Rows.Count - 1;
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn muốn xóa?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button2) == System.Windows.Forms.DialogResult.Yes)
            {
                
               DataRow upd_New = ds_Khoa.Tables["Lop"].Rows.Find(txtMaLop.Text);
                if (upd_New != null)
                {
                    upd_New.Delete();
                }
                SqlCommandBuilder cmb = new SqlCommandBuilder(da_Khoa);
                da_Khoa.Update(ds_Khoa, "Lop");
                MessageBox.Show("Thành công");
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            txtMaLop.Enabled = false;
            txtTenLop.Enabled = cbo_Khoa.Enabled = btnSave.Enabled = true;
            for (int i = 0; i < dataGridView.Rows.Count - 1; i++)
            {
                dataGridView.Rows[i].ReadOnly = false;
                dataGridView.Columns[0].ReadOnly = true;
                dataGridView.AllowUserToAddRows = false;
            }
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void ExerciseForm2_Load(object sender, EventArgs e)
        {
            Load_cboKhoa();

            Load_Grid();
            dataGridView.ReadOnly = true;
            dataGridView.AllowUserToAddRows = false;
            txtMaLop.Enabled = txtTenLop.Enabled = cbo_Khoa.Enabled = false;
            btnDelete.Enabled = btnEdit.Enabled = btnSave.Enabled = false;
            DataBingding(ds_Khoa.Tables["Lop"]);
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (txtMaLop.Text == string.Empty)
            {
                MessageBox.Show("Chưa nhập Mã Lớp");
                txtMaLop.Focus();
                return;
            }
            if (txtTenLop.Text == string.Empty)
            {
                MessageBox.Show("Chưa nhập Tên Lớp");
                txtTenLop.Focus();
                return;
            }
            if (cbo_Khoa.SelectedValue.ToString() == string.Empty)
            {
                MessageBox.Show("Chưa chọn Khoa");
                cbo_Khoa.Focus();
                return;
            }
            if (txtMaLop.Enabled == true) // Thêm
            {
                DataRow newrow = ds_Khoa.Tables["Lop"].NewRow();
                newrow["MaLop"] = txtMaLop.Text;
                newrow["TenLop"] = txtTenLop.Text;
                newrow["MaKhoa"] = cbo_Khoa.SelectedValue.ToString();
                try
                {
                    ds_Khoa.Tables["Lop"].Rows.Add(newrow);
                }
                catch
                {
                    MessageBox.Show("Mã sinh viên không được trùng");
                }
            }
            else
            {
                DataRow dr = ds_Khoa.Tables["Lop"].Rows.Find(txtMaLop.Text);
                if (dr != null)
                {
                    dr["MaLop"] = txtMaLop.Text;
                    dr["TenLop"] = txtTenLop.Text;
                    dr["MaKhoa"] = cbo_Khoa.SelectedValue.ToString();
                }
            }
            SqlCommandBuilder cb = new SqlCommandBuilder(da_Khoa);
            da_Khoa.Update(ds_Khoa, "Lop");
            MessageBox.Show("Thành công");
            btnSave.Enabled = false;
        }

        private void dataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            btnEdit.Enabled = btnDelete.Enabled = true;

        }

        private void cbo_Khoa_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        private void btnShowPrint_Click(object sender, EventArgs e)
        {
            DSLop a = new DSLop();
            a.Show();
        }

        private void btnFind_Click(object sender, EventArgs e)
        {
            ds_Khoa.Tables["Lop"].Clear();
            string strSelect ="Select * from Lop where MaKhoa like '%" + txtFind.Text + "%'";
            da_Khoa = new SqlDataAdapter(strSelect, cn);
            da_Khoa.Fill(ds_Khoa, "Lop");
            key[0] = ds_Khoa.Tables["Lop"].Columns[0];
            ds_Khoa.Tables["Lop"].PrimaryKey = key;
            dataGridView.DataSource = ds_Khoa.Tables["Lop"];
        }
    }
}
