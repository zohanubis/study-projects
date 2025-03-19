using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ThucHanhBuoi8
{
    public partial class Sample_Ex2 : Form
    {
        private string connectionString = "Data Source=ZOHANUBIS;Initial Catalog=QLSinhVien;Integrated Security=True";

        public Sample_Ex2()
        {
            InitializeComponent();
        }
        private void LoadKhoa_ComboBox()
        {
            using (SqlConnection conStr = new SqlConnection(connectionString))
            {
                conStr.Open();
                string slcString = "Select * from Khoa";
                SqlCommand cmd = new SqlCommand(slcString, conStr);
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    comboBoxKhoa.Items.Add(rd["MaKhoa"].ToString());
                }
                rd.Close();
                conStr.Close();
            }
        }
        public bool KT_KhoaChinh (string pMa)
        {
            using (SqlConnection conStr = new SqlConnection(connectionString))
            {
                conStr.Open();
                string slcString = "Select * from Lop where MaLop ='" + pMa +"'";
                SqlCommand cmd = new SqlCommand(slcString, conStr);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.HasRows)
                {
                    rd.Close() ;
                    conStr.Close();
                    return false;
                }
                else
                {
                    rd.Close();
                    conStr.Close();
                    return true;
                }
            }
        }
        // Cải thiện code 
        //public bool KT_KhoaChinh(string pMa)
        //{
        //    using (SqlConnection conStr = new SqlConnection(connectionString))
        //    {
        //        conStr.Open();
        //        string slcString = "SELECT COUNT(*) FROM Lop WHERE MaLop = @MaLop";
        //        using (SqlCommand cmd = new SqlCommand(slcString, conStr))
        //        {
        //            cmd.Parameters.AddWithValue("@MaLop", pMa);
        //            int count = (int)cmd.ExecuteScalar();
        //            conStr.Close();
        //            return count == 0;
        //        }
        //    }
        //}

        private void btnAdd_Click(object sender, EventArgs e)
        {
            string maLop = txtMaLop.Text;

            if (!string.IsNullOrEmpty(maLop) && KT_KhoaChinh(maLop))
            {
                using (SqlConnection conStr = new SqlConnection(connectionString))
                {
                    conStr.Open();

                    string insertString = "INSERT INTO Lop VALUES (@MaLop, @TenLop, @MaKhoa)";
                    SqlCommand cmd = new SqlCommand(insertString, conStr);
                    cmd.Parameters.AddWithValue("@MaLop", txtMaLop.Text);
                    cmd.Parameters.AddWithValue("@TenLop", txtTenLop.Text);
                    cmd.Parameters.AddWithValue("@MaKhoa", comboBoxKhoa.SelectedItem.ToString());
                    cmd.ExecuteNonQuery();
                }

                MessageBox.Show("Thêm thành công");
            }
            else
            {
                MessageBox.Show("Mã lớp đã tồn tại hoặc không hợp lệ.");
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            string maLop = txtMaLop.Text;

            if (!string.IsNullOrEmpty(maLop) && !KT_KhoaChinh(maLop))
            {
                using (SqlConnection conStr = new SqlConnection(connectionString))
                {
                    conStr.Open();

                    string deleteString = "DELETE FROM Lop WHERE MaLop = @MaLop";
                    SqlCommand cmd = new SqlCommand(deleteString, conStr);
                    cmd.Parameters.AddWithValue("@MaLop", txtMaLop.Text);
                    cmd.ExecuteNonQuery();
                }

                MessageBox.Show("Xóa thành công");
            }
            else
            {
                MessageBox.Show("Mã lớp không tồn tại hoặc không hợp lệ.");
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            string maLop = txtMaLop.Text;

            if (!string.IsNullOrEmpty(maLop) && !KT_KhoaChinh(maLop))
            {
                using (SqlConnection conStr = new SqlConnection(connectionString))
                {
                    conStr.Open();

                    string updateString = "UPDATE Lop SET TenLop = @TenLop, MaKhoa = @MaKhoa WHERE MaLop = @MaLop";
                    SqlCommand cmd = new SqlCommand(updateString, conStr);
                    cmd.Parameters.AddWithValue("@MaLop", txtMaLop.Text);
                    cmd.Parameters.AddWithValue("@TenLop", txtTenLop.Text);
                    cmd.Parameters.AddWithValue("@MaKhoa", comboBoxKhoa.SelectedItem.ToString());
                    cmd.ExecuteNonQuery();
                }

                MessageBox.Show("Sửa thành công");
            }
            else
            {
                MessageBox.Show("Mã lớp không tồn tại hoặc không hợp lệ.");
            }
        }

        private void Sample_Ex2_Load(object sender, EventArgs e)
        {
            LoadKhoa_ComboBox();
        }
    }
}
