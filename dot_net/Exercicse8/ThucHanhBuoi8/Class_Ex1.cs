using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ThucHanhBuoi8
{
    public partial class Class_Ex1 : Form
    {
        private string connectionString = "Data Source=ZOHANUBIS;Initial Catalog=QLSinhVien;Integrated Security=True";

        public Class_Ex1()
        {
            InitializeComponent();
        }

        private void LoadLop_ComboBox()
        {
            using (SqlConnection conStr = new SqlConnection(connectionString))
            {
                conStr.Open();
                string slcString = "Select * from Lop";
                SqlCommand cmd = new SqlCommand(slcString, conStr);
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    comboBoxLop.Items.Add(rd["MaLop"].ToString());
                }
                rd.Close();
            }
        }

        public bool KT_KhoaChinh(string pMa)
        {
            using (SqlConnection conStr = new SqlConnection(connectionString))
            {
                conStr.Open();
                string slcString = "Select * from SinhVien where MaSinhVien ='" + pMa + "'";
                SqlCommand cmd = new SqlCommand(slcString, conStr);
                SqlDataReader rd = cmd.ExecuteReader();
                bool result = rd.HasRows;
                rd.Close();
                return !result;
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            // Kiểm tra mọi thông tin đã được nhập đầy đủ
            if (string.IsNullOrEmpty(txtMaSV.Text) || string.IsNullOrEmpty(txtHoTen.Text) || string.IsNullOrEmpty(mkTxtNgaySinh.Text) || comboBoxLop.SelectedItem == null)
            {
                MessageBox.Show("Vui lòng nhập đầy đủ thông tin.");
                return;
            }

            // Kiểm tra mã sinh viên không được trùng
            string maSV = txtMaSV.Text;
            if (!KT_KhoaChinh(maSV))
            {
                MessageBox.Show("Mã sinh viên đã tồn tại. Vui lòng chọn mã sinh viên khác.");
                return;
            }

            // Kiểm tra tuổi từ 17 trở lên
            DateTime ngaySinh;
            if (DateTime.TryParseExact(mkTxtNgaySinh.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out ngaySinh))
            {
                int age = DateTime.Now.Year - ngaySinh.Year;
                if (age < 17)
                {
                    MessageBox.Show("Tuổi của sinh viên phải từ 17 trở lên.");
                    return;
                }
            }
            else
            {
                MessageBox.Show("Ngày sinh không hợp lệ. Vui lòng nhập theo định dạng dd/MM/yyyy.");
                return;
            }

            // Thêm sinh viên vào bảng SinhVien
            using (SqlConnection conStr = new SqlConnection(connectionString))
            {
                conStr.Open();

                string insertString = "INSERT INTO SinhVien VALUES (@MaSinhVien, @HoTen, @NgaySinh, @MaLop)";
                SqlCommand cmd = new SqlCommand(insertString, conStr);
                cmd.Parameters.AddWithValue("@MaSinhVien", txtMaSV.Text);
                cmd.Parameters.AddWithValue("@HoTen", txtHoTen.Text);
                cmd.Parameters.AddWithValue("@NgaySinh", DateTime.ParseExact(mkTxtNgaySinh.Text, "dd/MM/yyyy", null));
                cmd.Parameters.AddWithValue("@MaLop", comboBoxLop.SelectedItem.ToString());
                cmd.ExecuteNonQuery();
            }

            MessageBox.Show("Thêm thành công");
        }


        private void btnDelete_Click(object sender, EventArgs e)
        {
            string maSV = txtMaSV.Text;

            if (!string.IsNullOrEmpty(maSV) && !KT_KhoaChinh(maSV))
            {
                using (SqlConnection conStr = new SqlConnection(connectionString))
                {
                    conStr.Open();

                    string deleteString = "DELETE FROM SinhVien WHERE MaSinhVien = @MaSinhVien";
                    SqlCommand cmd = new SqlCommand(deleteString, conStr);
                    cmd.Parameters.AddWithValue("@MaSinhVien", txtMaSV.Text);
                    cmd.ExecuteNonQuery();
                }

                MessageBox.Show("Xóa thành công");
            }
            else
            {
                MessageBox.Show("Mã sinh viên không tồn tại hoặc không hợp lệ.");
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            string maSV = txtMaSV.Text;

            if (!string.IsNullOrEmpty(maSV) && !KT_KhoaChinh(maSV))
            {
                using (SqlConnection conStr = new SqlConnection(connectionString))
                {
                    conStr.Open();

                    string updateString = "UPDATE SinhVien SET HoTen = @HoTen, NgaySinh = @NgaySinh, MaLop = @MaLop WHERE MaSinhVien = @MaSinhVien";
                    SqlCommand cmd = new SqlCommand(updateString, conStr);
                    cmd.Parameters.AddWithValue("@MaSinhVien", txtMaSV.Text);
                    cmd.Parameters.AddWithValue("@HoTen", txtHoTen.Text);
                    cmd.Parameters.AddWithValue("@NgaySinh", DateTime.ParseExact(mkTxtNgaySinh.Text, "dd/MM/yyyy", null));
                    cmd.Parameters.AddWithValue("@MaLop", comboBoxLop.SelectedItem.ToString());
                    cmd.ExecuteNonQuery();
                }

                MessageBox.Show("Sửa thành công");
            }
            else
            {
                MessageBox.Show("Mã sinh viên không tồn tại hoặc không hợp lệ.");
            }
        }

        private void Class_Ex1_Load(object sender, EventArgs e)
        {
            LoadLop_ComboBox();
        }
    }
}
