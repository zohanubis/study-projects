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


namespace Exercise11
{
    public partial class SampleForm : Form
    {
        SqlConnection cn = new SqlConnection(Properties.Settings.Default.conStr);
        SqlDataAdapter da_Lop;
        DataSet ds_Lop = new DataSet();
        DataColumn[] key = new DataColumn[1];
        public SampleForm()
        {
            InitializeComponent();
            
        }
        void Load_cboLop()
        {
            string strSelect = "Select * from Lop";
            da_Lop = new SqlDataAdapter(strSelect, cn);
            da_Lop.Fill(ds_Lop, "Lop");

            cbo_Lop.DataSource = ds_Lop.Tables["Lop"];
            cbo_Lop.DisplayMember = "TenLop";
            cbo_Lop.ValueMember = "MaLop";
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
        void DataBingding (DataTable pDT)
        {
            cbo_Lop.DataBindings.Clear();
            txtMaSV.DataBindings.Clear();
            txtTenSV.DataBindings.Clear();
            mtxtNgaySinh.DataBindings.Clear();

            cbo_Lop.DataBindings.Add("Text", pDT, "MaLop");
            txtTenSV.DataBindings.Add("Text", pDT, "HoTen");
            txtMaSV.DataBindings.Add("Text", pDT, "MaSinhVien");
            mtxtNgaySinh.DataBindings.Add("Text", pDT, "NgaySinh");
        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            txtMaSV.Enabled = txtTenSV.Enabled = mtxtNgaySinh.Enabled = cbo_Lop.Enabled = btnSave.Enabled = true;
            txtMaSV.Focus();
            txtMaSV.Clear();
            txtTenSV.Clear();
            mtxtNgaySinh.Clear();
            dataGridView.AllowUserToAddRows = true;
            dataGridView.ReadOnly = false;
            // Không được sửa các dòng có dữ liệu
            for(int i = 0; i< dataGridView.Rows.Count -1; i++)
            {
                dataGridView.Rows[i].ReadOnly = true;
            }
            dataGridView.FirstDisplayedScrollingRowIndex = dataGridView.Rows.Count - 1;
            
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn muốn xóa?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button2) == System.Windows.Forms.DialogResult.Yes)
            {
                //// Kiểm tra khóa ngoại trong bảng Lớp
                //DataTable dt_Lop = new DataTable();
                //SqlDataAdapter da_Lop = new SqlDataAdapter("Select * from Lop where MaSinhVien = '" + txtMaSV.Text + "'", cn);
                //da_Lop.Fill(dt_Lop);
                //if (dt_Lop.Rows.Count > 0)
                //{
                //    MessageBox.Show("Dữ liệu đang sử dụng không thể xóa");
                //    return;
                //}
                // Nếu cập nhật dữ liệu
                DataRow upd_New = ds_Lop.Tables["SinhVien"].Rows.Find(txtMaSV.Text);
                if (upd_New != null)
                {
                    upd_New.Delete();
                }
                SqlCommandBuilder cmb = new SqlCommandBuilder(da_Lop);
                da_Lop.Update(ds_Lop, "SinhVien");
                MessageBox.Show("Thành công");
            }
        }
        private void btnEdit_Click(object sender, EventArgs e)
        {
            txtMaSV.Enabled = false;
            txtTenSV.Enabled = mtxtNgaySinh.Enabled = cbo_Lop.Enabled = btnSave.Enabled = true;
            for(int i = 0; i < dataGridView.Rows.Count - 1; i++)
            {
                dataGridView.Rows[i].ReadOnly = false;
                dataGridView.Columns[0].ReadOnly = true;
                dataGridView.AllowUserToAddRows = false;
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (txtMaSV.Text == string.Empty)
            {
                MessageBox.Show("Chưa nhập Mã Sinh Viên");
                txtMaSV.Focus();
                return;
            }
            if (txtTenSV.Text == string.Empty)
            {
                MessageBox.Show("Chưa nhập Tên SinhVien");
                txtTenSV.Focus();
                return;
            }
            if(mtxtNgaySinh.Text == string.Empty)
            {
                MessageBox.Show("Chưa nhập ngày sinh");
                mtxtNgaySinh.Focus();
                return;
            }
            if(cbo_Lop.SelectedValue.ToString() == string.Empty)
            {
                MessageBox.Show("Chưa chọn Lớp");
                cbo_Lop.Focus();
                return;
            }
            if (txtMaSV.Enabled == true) // Thêm
            {
                DataRow newrow = ds_Lop.Tables["SinhVien"].NewRow();
                newrow["MaSinhVien"] = txtMaSV.Text;
                newrow["HoTen"] = txtTenSV.Text;
                newrow["NgaySinh"] = mtxtNgaySinh.Text;
                newrow["MaLop"] = cbo_Lop.SelectedValue.ToString();
                try
                {
                    ds_Lop.Tables["SinhVien"].Rows.Add(newrow);
                }
                catch
                {
                    MessageBox.Show("Mã sinh viên không được trùng");
                }
            }
            else
            {
                DataRow dr = ds_Lop.Tables["SinhVien"].Rows.Find(txtMaSV.Text);
                if (dr != null)
                {
                    dr["HoTen"] = txtTenSV.Text;
                    dr["NgaySinh"] = mtxtNgaySinh.Text;
                    dr["MaLop"] = cbo_Lop.SelectedValue.ToString();
                }
            }
            SqlCommandBuilder cb = new SqlCommandBuilder(da_Lop);
            da_Lop.Update(ds_Lop, "SinhVien");
            MessageBox.Show("Thành công");
            btnSave.Enabled = false;
        }

        private void btnExit_Click(object sender, EventArgs e)
        {

        }

        private void SampleForm_Load(object sender, EventArgs e)
        {
            Load_cboLop();
            Load_Grid();
            dataGridView.ReadOnly = true;
            dataGridView.AllowUserToAddRows = false;
            txtMaSV.Enabled = txtTenSV.Enabled = mtxtNgaySinh.Enabled = cbo_Lop.Enabled = false;
            btnDelete.Enabled = btnEdit.Enabled = btnSave.Enabled = false;
            DataBingding(ds_Lop.Tables["SinhVien"]);
        }

        private void dataGridView_SelectionChanged(object sender, EventArgs e)
        {
            btnEdit.Enabled = btnDelete.Enabled = false;
        }

        private void dataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            btnEdit.Enabled = btnDelete.Enabled = true;

        }
    }
}
