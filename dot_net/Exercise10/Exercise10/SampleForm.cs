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

namespace Exercise10
{
    public partial class SampleForm : Form
    {
        SqlConnection cn = new SqlConnection("Data Source=ZOHANUBIS;Initial Catalog=QLSinhVien;Integrated Security=True");
        SqlDataAdapter da_Khoa;
        DataSet ds_Khoa = new DataSet();
        DataColumn[] key = new DataColumn[1];
        public SampleForm()
        {
            InitializeComponent();

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
            txtTenKhoa.Enabled = txtMaKhoa.Enabled = btnSave.Enabled = true;
            txtMaKhoa.Focus();
            txtMaKhoa.Clear();
            txtTenKhoa.Clear();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn muốn xóa?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button2) == System.Windows.Forms.DialogResult.Yes)
            {
                // Kiểm tra khóa ngoại trong bảng Lớp
                DataTable dt_Lop = new DataTable();
                SqlDataAdapter da_Lop = new SqlDataAdapter("Select * from Lop where MaKhoa = '" + txtMaKhoa.Text + "'", cn);
                da_Lop.Fill(dt_Lop);
                if (dt_Lop.Rows.Count > 0)
                {
                    MessageBox.Show("Dữ liệu đang sử dụng không thể xóa");
                    return;
                }
                // Nếu cập nhật dữ liệu
                DataRow upd_New = ds_Khoa.Tables["Khoa"].Rows.Find(txtMaKhoa.Text);
                if (upd_New != null)
                {
                    upd_New.Delete();
                }
                SqlCommandBuilder cmb = new SqlCommandBuilder(da_Khoa);
                da_Khoa.Update(ds_Khoa, "Khoa");
                MessageBox.Show("Thành công");
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            txtTenKhoa.Enabled = btnSave.Enabled = true;
            txtMaKhoa.Enabled = false;
            txtTenKhoa.Enabled = true;

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            btnEdit.Enabled = btnDelete.Enabled = true;
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

        private void SampleForm_Load(object sender, EventArgs e)
        {
            load_grid();
            txtMaKhoa.Enabled = txtTenKhoa.Enabled = false;
            btnEdit.Enabled = btnDelete.Enabled = btnSave.Enabled = btnShowPrint.Enabled = btnExit.Enabled = false;

        }
        // Kiểm tra thông tin nhập hoặc sửa cho phù hợp
        // Lưu vào cơ sở dữ liệu( Cần xác định là đang lưu cho hành động thêm hay sửa
        // Thông báo thành công hoặc báo lỗi nếu có
        // btnSave.Enable = false;
        private void btnSave_Click(object sender, EventArgs e)
        {
            if (txtMaKhoa.Text == string.Empty)
            {
                MessageBox.Show("Chưa nhập Mã Khoa");
                txtMaKhoa.Focus();
                return;
            }
            if (txtTenKhoa.Text == string.Empty)
            {
                MessageBox.Show("Chưa nhập Tên Khoa");
                txtTenKhoa.Focus();
                return;
            }
            if (txtMaKhoa.Enabled == true) // Thêm
            {
                DataRow newrow = ds_Khoa.Tables["Khoa"].NewRow();
                newrow["MaKhoa"] = txtMaKhoa.Text;
                newrow["TenKhoa"] = txtTenKhoa.Text;
                try
                {
                    ds_Khoa.Tables["Khoa"].Rows.Add(newrow);
                }
                catch
                {
                    MessageBox.Show("Mã Khoa không được trùng");
                }
            }
            else // Sửa
            {
                DataRow dr = ds_Khoa.Tables["Khoa"].Rows.Find(txtMaKhoa.Text);
                if (dr != null)
                {
                    dr["TenKhoa"] = txtTenKhoa.Text;

                }
            }

            SqlCommandBuilder cb = new SqlCommandBuilder(da_Khoa);
            da_Khoa.Update(ds_Khoa, "Khoa");
            MessageBox.Show("Thành Công");
            btnSave.Enabled = false;
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            btnEdit.Enabled = btnDelete.Enabled = false;
        }
    }
}
