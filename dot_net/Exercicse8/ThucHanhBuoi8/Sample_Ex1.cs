using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ThucHanhBuoi8
{
    public partial class Sample_Ex1 : Form
    {
        private string connectionString = "Data Source=ZOHANUBIS;Initial Catalog=QLSinhVien;Integrated Security=True";

        public Sample_Ex1()
        {
            InitializeComponent();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conStr = new SqlConnection(connectionString))
                {
                    conStr.Open();

                    if (!IsKeyExists(txtMaKhoa.Text, "Khoa", "MaKhoa", conStr))
                    {
                        InsertData(txtMaKhoa.Text, txtTenKhoa.Text, conStr);
                        MessageBox.Show("Thành Công");
                    }
                    else
                    {
                        MessageBox.Show("Mã Khoa đã tồn tại. Vui lòng chọn một Mã Khoa khác.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Thất Bại: " + ex.Message);
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conStr = new SqlConnection(connectionString))
                {
                    conStr.Open();

                    if (IsKeyExists(txtMaKhoa.Text, "Khoa", "MaKhoa", conStr))
                    {
                        DeleteData(txtMaKhoa.Text, conStr);
                        MessageBox.Show("Thành Công");
                    }
                    else
                    {
                        MessageBox.Show("Mã Khoa không tồn tại. Không thể xóa.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Thất Bại: " + ex.Message);
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conStr = new SqlConnection(connectionString))
                {
                    conStr.Open();

                    if (IsKeyExists(txtMaKhoa.Text, "Khoa", "MaKhoa", conStr))
                    {
                        UpdateData(txtMaKhoa.Text, txtTenKhoa.Text, conStr);
                        MessageBox.Show("Cập nhật thành công");
                    }
                    else
                    {
                        MessageBox.Show("Mã Khoa không tồn tại. Không thể cập nhật.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Cập nhật thất bại: " + ex.Message);
            }
        }

        private bool IsKeyExists(string key, string tableName, string keyColumnName, SqlConnection connection)
        {
            string query = $"SELECT COUNT(*) FROM {tableName} WHERE {keyColumnName} = @Key";
            using (SqlCommand cmd = new SqlCommand(query, connection))
            {
                cmd.Parameters.AddWithValue("@Key", key);
                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
        }

        private void InsertData(string maKhoa, string tenKhoa, SqlConnection connection)
        {
            // Thực hiện thêm dữ liệu
            string insertString = "INSERT INTO Khoa VALUES (@MaKhoa, @TenKhoa)";
            using (SqlCommand cmd = new SqlCommand(insertString, connection))
            {
                cmd.Parameters.AddWithValue("@MaKhoa", maKhoa);
                cmd.Parameters.AddWithValue("@TenKhoa", tenKhoa);
                cmd.ExecuteNonQuery();
            }
        }

        private void DeleteData(string maKhoa, SqlConnection connection)
        {
            // Thực hiện xóa dữ liệu
            string deleteString = "DELETE FROM Khoa WHERE MaKhoa = @MaKhoa";
            using (SqlCommand cmd = new SqlCommand(deleteString, connection))
            {
                cmd.Parameters.AddWithValue("@MaKhoa", maKhoa);
                cmd.ExecuteNonQuery();
            }
        }

        private void UpdateData(string maKhoa, string tenKhoa, SqlConnection connection)
        {
            // Thực hiện cập nhật dữ liệu
            string updateString = "UPDATE Khoa SET TenKhoa = @TenKhoa WHERE MaKhoa = @MaKhoa";
            using (SqlCommand cmd = new SqlCommand(updateString, connection))
            {
                cmd.Parameters.AddWithValue("@MaKhoa", maKhoa);
                cmd.Parameters.AddWithValue("@TenKhoa", tenKhoa);
                cmd.ExecuteNonQuery();
            }
        }
    }
}
