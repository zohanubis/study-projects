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
    public partial class Advanced_Ex2 : Form
    {
        private string connectionString = "Data Source=ZOHANUBIS;Initial Catalog=QLSinhVien;Integrated Security=True";

        public Advanced_Ex2()
        {
            InitializeComponent();
        }

        private void LoadMonHoc_ComboBox()
        {
            using (SqlConnection conStr = new SqlConnection(connectionString))
            {
                conStr.Open();
                string slcString = "SELECT MaMonHoc FROM MonHoc";
                SqlCommand cmd = new SqlCommand(slcString, conStr);
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    comboBoxMonHoc.Items.Add(rd["MaMonHoc"].ToString());
                }
                rd.Close();
                comboBoxMonHoc.Items.Add("");
            }
        }

        private void btnLocDuLieu_Click(object sender, EventArgs e)
        {
            listViewData.Items.Clear();

            string maMonHoc = comboBoxMonHoc.SelectedItem.ToString();

            using (SqlConnection conStr = new SqlConnection(connectionString))
            {
                conStr.Open();

                string slcString = "SELECT SinhVien.HoTen, SinhVien.NgaySinh, MonHoc.TenMonHoc, Diem.Diem " +
                                    "FROM Diem " +
                                    "JOIN SinhVien ON Diem.MaSinhVien = SinhVien.MaSinhVien " +
                                    "JOIN MonHoc ON Diem.MaMonHoc = MonHoc.MaMonHoc " +
                                    "WHERE (@MaMonHoc = '' OR MonHoc.MaMonHoc = @MaMonHoc)";

                SqlCommand cmd = new SqlCommand(slcString, conStr);
                cmd.Parameters.AddWithValue("@MaMonHoc", maMonHoc);

                try
                {
                    SqlDataReader rd = cmd.ExecuteReader();

                    int stt = 1;
                    while (rd.Read())
                    {
                        ListViewItem item = new ListViewItem(stt.ToString());
                        item.SubItems.Add(rd["HoTen"].ToString());
                        item.SubItems.Add(((DateTime)rd["NgaySinh"]).ToShortDateString());
                        item.SubItems.Add(rd["TenMonHoc"].ToString());
                        item.SubItems.Add(rd["Diem"].ToString());

                        listViewData.Items.Add(item);

                        stt++;
                    }

                    double tongDiem = 0;
                    foreach (ListViewItem item in listViewData.Items)
                    {
                        tongDiem += double.Parse(item.SubItems[4].Text);
                    }

                    txtTongDiem.Text = tongDiem.ToString();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi khi thực hiện truy vấn SQL: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void Advanced_Ex2_Load(object sender, EventArgs e)
        {
            LoadMonHoc_ComboBox();
        }
    }
}
