using Exercise10.Resources;
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

namespace Exercise10
{
    public partial class ClassForm1 : Form
    {
        DBConnect db = new DBConnect();
        DataTable dt;
        DataTable dtLop,dtKhoa;
        public ClassForm1()
        {
            InitializeComponent();
            
        }
        void load_Grid(string sql)
        {
            dt = db.getDataTable(sql);
            dataGridView.DataSource = dt;
        }
        private void ClassForm1_Load(object sender, EventArgs e)
        {
            txtMaSV.Enabled = txtTenSV.Enabled = mskNgaySInh.Enabled = btnAdd.Enabled = btnDelete.Enabled = btnSave.Enabled = btnEdit.Enabled = false;
            //Lớp
            string sqlLop = "Select * from Lop";
            dtLop = db.getDataTable(sqlLop);

            cbo_Lop.DataSource = dtLop;
            cbo_Lop.DisplayMember = "TenLop";
            cbo_Khoa.ValueMember = "MaLop";

            //Lớp
            string sqlKhoa = "Select * from Khoa";
            dtLop = db.getDataTable(sqlKhoa);

            cbo_Khoa.DataSource = dtKhoa;
            cbo_Khoa.DisplayMember = "TenKhoa";
            cbo_Khoa.ValueMember = "MaKhoa";
            // Sinh Viên
            string sql = "Select * from SinhVien";
            dt = db.getDataTable(sql);
            load_Grid(sql);
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(cbo_Lop.SelectedValue.ToString()))
            {
                MessageBox.Show("Vui lòng chọn lớp.");
                return;
            }

            string sql = "SELECT * FROM SinhVien WHERE MaLop = @MaLop";
            using (SqlCommand cmd = new SqlCommand(sql, db.GetConnection()))
            {
                cmd.Parameters.AddWithValue("@MaLop", cbo_Lop.SelectedValue.ToString());

                db.OpenConnection();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtMaSV.Text = reader["MaSinhVien"].ToString();
                    txtTenSV.Text = reader["HoTen"].ToString();
                    cbo_Lop.Text = reader["MaLop"].ToString();
                }
                else
                {
                    MessageBox.Show("Lớp không tồn tại");
                }

                reader.Close();
                db.CloseConnection();
            }
        }
    }
}
