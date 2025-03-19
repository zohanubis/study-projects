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
    public partial class Advanced_Ex1 : Form
    {
        private string connectionString = "Data Source=ZOHANUBIS;Initial Catalog=QLSinhVien;Integrated Security=True";
        public Advanced_Ex1()
        {
            InitializeComponent();
        }

        private void Advanced_Ex1_Load(object sender, EventArgs e)
        {
            // Khởi tạo cột cho ListView
            listViewLop.Columns.Add("STT", 50, HorizontalAlignment.Left);
            listViewLop.Columns.Add("Mã Lớp", 100, HorizontalAlignment.Left);
            listViewLop.Columns.Add("Tên Lớp", 100, HorizontalAlignment.Left);
            listViewLop.Columns.Add("Mã Khoa", 100, HorizontalAlignment.Left);

            // Ẩn cột STT nếu không muốn hiển thị
            //listViewLop.Columns[0].Width = 0;
        }

        private void btnShow_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conStr = new SqlConnection(connectionString))
                {
                    conStr.Open();

                    string selectQuery = "SELECT * FROM Lop";
                    SqlCommand cmd = new SqlCommand(selectQuery, conStr);
                    SqlDataReader reader = cmd.ExecuteReader();

                    listViewLop.Items.Clear();

                    int stt = 1;
                    while (reader.Read())
                    {
                        ListViewItem item = new ListViewItem(stt.ToString());
                        item.SubItems.Add(reader["MaLop"].ToString());
                        item.SubItems.Add(reader["TenLop"].ToString());
                        item.SubItems.Add(reader["MaKhoa"].ToString());

                        listViewLop.Items.Add(item);

                        stt++;
                    }

                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
