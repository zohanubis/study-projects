using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ThucHanhBuoi8
{
    public partial class Class_Ex2 : Form
    {
        private string connectionString = "Data Source=ZOHANUBIS;Initial Catalog=QLSinhVien;Integrated Security=True";

        public Class_Ex2()
        {
            InitializeComponent();
        }

        private void LoadMonHoc_ComboBox()
        {
            using (SqlConnection conStr = new SqlConnection(connectionString))
            {
                conStr.Open();
                string slcString = "Select * from MonHoc";
                SqlCommand cmd = new SqlCommand(slcString, conStr);
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    comboBoxMonHoc.Items.Add(rd["MaMonHoc"].ToString());
                }
                rd.Close();
            }
        }

        private void LoadSinhVien_ComboBox()
        {
            using (SqlConnection conStr = new SqlConnection(connectionString))
            {
                conStr.Open();
                string slcString = "Select * from SinhVien";
                SqlCommand cmd = new SqlCommand(slcString, conStr);
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    comboBoxSinhVien.Items.Add(rd["MaSinhVien"].ToString());
                }
                rd.Close();
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (comboBoxSinhVien.SelectedIndex == -1 || comboBoxMonHoc.SelectedIndex == -1 || string.IsNullOrEmpty(txtDiem.Text))
            {
                MessageBox.Show("Vui lòng nhập đầy đủ thông tin.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // Kiểm tra điểm có phải là số không
            if (!double.TryParse(txtDiem.Text, out double diem))
            {
                MessageBox.Show("Vui lòng nhập điểm là một số.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // Kiểm tra logic khác nếu cần thiết

            try
            {
                using (SqlConnection conStr = new SqlConnection(connectionString))
                {
                    conStr.Open();

                    // Kiểm tra xem điểm đã tồn tại hay chưa
                    string checkExistQuery = "SELECT COUNT(*) FROM Diem WHERE MaSinhVien = @MaSinhVien AND MaMonHoc = @MaMonHoc";
                    SqlCommand checkExistCmd = new SqlCommand(checkExistQuery, conStr);
                    checkExistCmd.Parameters.AddWithValue("@MaSinhVien", comboBoxSinhVien.SelectedItem.ToString());
                    checkExistCmd.Parameters.AddWithValue("@MaMonHoc", comboBoxMonHoc.SelectedItem.ToString());

                    int existingRecords = (int)checkExistCmd.ExecuteScalar();

                    if (existingRecords > 0)
                    {
                        MessageBox.Show("Điểm cho sinh viên và môn học này đã tồn tại.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }

                    // Thêm điểm mới
                    string insertQuery = "INSERT INTO Diem (MaSinhVien, MaMonHoc, Diem) VALUES (@MaSinhVien, @MaMonHoc, @Diem)";
                    SqlCommand insertCmd = new SqlCommand(insertQuery, conStr);
                    insertCmd.Parameters.AddWithValue("@MaSinhVien", comboBoxSinhVien.SelectedItem.ToString());
                    insertCmd.Parameters.AddWithValue("@MaMonHoc", comboBoxMonHoc.SelectedItem.ToString());
                    insertCmd.Parameters.AddWithValue("@Diem", diem);

                    insertCmd.ExecuteNonQuery();
                    MessageBox.Show("Thêm điểm thành công.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (comboBoxSinhVien.SelectedIndex == -1 || comboBoxMonHoc.SelectedIndex == -1)
            {
                MessageBox.Show("Vui lòng chọn sinh viên và môn học để xóa điểm.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            try
            {
                using (SqlConnection conStr = new SqlConnection(connectionString))
                {
                    conStr.Open();

                    // Xóa điểm theo sinh viên và môn học
                    string deleteQuery = "DELETE FROM Diem WHERE MaSinhVien = @MaSinhVien AND MaMonHoc = @MaMonHoc";
                    SqlCommand deleteCmd = new SqlCommand(deleteQuery, conStr);
                    deleteCmd.Parameters.AddWithValue("@MaSinhVien", comboBoxSinhVien.SelectedItem.ToString());
                    deleteCmd.Parameters.AddWithValue("@MaMonHoc", comboBoxMonHoc.SelectedItem.ToString());

                    int deletedRecords = deleteCmd.ExecuteNonQuery();

                    if (deletedRecords > 0)
                    {
                        MessageBox.Show("Xóa điểm thành công.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    else
                    {
                        MessageBox.Show("Không tìm thấy điểm để xóa.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            if (comboBoxSinhVien.SelectedIndex == -1 || comboBoxMonHoc.SelectedIndex == -1 || string.IsNullOrEmpty(txtDiem.Text))
            {
                MessageBox.Show("Vui lòng nhập đầy đủ thông tin.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // Kiểm tra điểm có phải là số không
            if (!double.TryParse(txtDiem.Text, out double diem))
            {
                MessageBox.Show("Vui lòng nhập điểm là một số.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }


            try
            {
                using (SqlConnection conStr = new SqlConnection(connectionString))
                {
                    conStr.Open();

                    // Cập nhật điểm
                    string updateQuery = "UPDATE Diem SET Diem = @Diem WHERE MaSinhVien = @MaSinhVien AND MaMonHoc = @MaMonHoc";
                    SqlCommand updateCmd = new SqlCommand(updateQuery, conStr);
                    updateCmd.Parameters.AddWithValue("@MaSinhVien", comboBoxSinhVien.SelectedItem.ToString());
                    updateCmd.Parameters.AddWithValue("@MaMonHoc", comboBoxMonHoc.SelectedItem.ToString());
                    updateCmd.Parameters.AddWithValue("@Diem", diem);

                    int updatedRecords = updateCmd.ExecuteNonQuery();

                    if (updatedRecords > 0)
                    {
                        MessageBox.Show("Cập nhật điểm thành công.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    else
                    {
                        MessageBox.Show("Không tìm thấy điểm để cập nhật.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void Class_Ex2_Load(object sender, EventArgs e)
        {
            LoadMonHoc_ComboBox();
            LoadSinhVien_ComboBox();
        }
    }
}
