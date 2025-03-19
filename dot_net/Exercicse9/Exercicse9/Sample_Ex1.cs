using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Exercicse9
{
    public partial class Sample_Ex1 : Form
    {
        SqlConnection cn = new SqlConnection("Data Source=ZOHANUBIS;Initial Catalog=QLSinhVien;Integrated Security=True");
        SqlDataAdapter da_Khoa;
        DataSet ds_Khoa = new DataSet();
        DataColumn[] key = new DataColumn[1];

        public Sample_Ex1()
        {
            InitializeComponent();
            load_cboKhoa();
        }

        void load_cboKhoa()
        {
            string strSelect = "Select * from Khoa";
            da_Khoa = new SqlDataAdapter(strSelect, cn);
            da_Khoa.Fill(ds_Khoa, "Khoa");
            comboBoxKhoa.DataSource = ds_Khoa.Tables["Khoa"];
            comboBoxKhoa.DisplayMember = "TenKhoa";
            comboBoxKhoa.ValueMember = "MaKhoa";
        }

        public bool KT_KhoaChinh(string pMa)
        {
            using (SqlConnection conStr = new SqlConnection(cn.ConnectionString))
            {
                conStr.Open();
                string slcString = "SELECT * FROM Lop WHERE MaLop = @MaLop";
                using (SqlCommand cmd = new SqlCommand(slcString, conStr))
                {
                    cmd.Parameters.AddWithValue("@MaLop", pMa);
                    SqlDataReader rd = cmd.ExecuteReader();
                    bool result = rd.HasRows;
                    rd.Close();
                    return !result;
                }
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            // Lấy thông tin từ giao diện
            string maLop = txtMaLop.Text;
            string tenLop = txtTenLop.Text;
            string maKhoa = comboBoxKhoa.SelectedValue.ToString();

            if (!KT_KhoaChinh(maLop))
            {
                MessageBox.Show("Mã lớp đã tồn tại. Vui lòng chọn mã lớp khác.", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            string insertQuery = "INSERT INTO Lop (MaLop, TenLop, MaKhoa) VALUES (@MaLop, @TenLop, @MaKhoa)";

            using (SqlConnection connection = new SqlConnection(cn.ConnectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand(insertQuery, connection))
                {
                    cmd.Parameters.AddWithValue("@MaLop", maLop);
                    cmd.Parameters.AddWithValue("@TenLop", tenLop);
                    cmd.Parameters.AddWithValue("@MaKhoa", maKhoa);

                    cmd.ExecuteNonQuery();
                }
            }

            MessageBox.Show("Thêm lớp thành công.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

            Load_ComboBox();
            ClearInputFields();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            // Lấy thông tin từ giao diện
            string maLop = txtMaLop.Text;

            // Kiểm tra xem mã lớp có tồn tại không
            if (KT_KhoaChinh(maLop))
            {
                MessageBox.Show("Mã lớp không tồn tại. Vui lòng chọn mã lớp khác.", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // Thực hiện xóa trong cơ sở dữ liệu
            string deleteQuery = "DELETE FROM Lop WHERE MaLop = @MaLop";

            using (SqlConnection connection = new SqlConnection(cn.ConnectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand(deleteQuery, connection))
                {
                    cmd.Parameters.AddWithValue("@MaLop", maLop);

                    cmd.ExecuteNonQuery();
                }
            }
            MessageBox.Show("Xóa lớp thành công.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            // Cập nhật lại ComboBox và xóa dữ liệu nhập trên giao diện
            Load_ComboBox();
            ClearInputFields();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            string maLop = txtMaLop.Text;
            string tenLop = txtTenLop.Text;
            string maKhoa = comboBoxKhoa.SelectedValue.ToString();

            // Kiểm tra xem mã lớp có tồn tại không
            if (KT_KhoaChinh(maLop))
            {
                MessageBox.Show("Mã lớp không tồn tại. Vui lòng chọn mã lớp khác.", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            string updateQuery = "UPDATE Lop SET TenLop = @TenLop, MaKhoa = @MaKhoa WHERE MaLop = @MaLop";

            using (SqlConnection connection = new SqlConnection(cn.ConnectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand(updateQuery, connection))
                {
                    cmd.Parameters.AddWithValue("@MaLop", maLop);
                    cmd.Parameters.AddWithValue("@TenLop", tenLop);
                    cmd.Parameters.AddWithValue("@MaKhoa", maKhoa);

                    cmd.ExecuteNonQuery();
                }
            }

            // Thông báo thành công
            MessageBox.Show("Sửa lớp thành công.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

            Load_ComboBox();
            ClearInputFields();
        }

        private void Load_ComboBox()
        {
            // Cập nhật dữ liệu cho ComboBox sau khi thêm, sửa, xóa
            ds_Khoa.Clear();
            load_cboKhoa();
        }

        private void ClearInputFields()
        {
            // Xóa dữ liệu nhập trên giao diện
            txtMaLop.Text = "";
            txtTenLop.Text = "";
            comboBoxKhoa.SelectedIndex = -1;
        }
    }
}
