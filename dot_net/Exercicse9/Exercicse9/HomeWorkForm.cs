using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Exercicse9
{
    public partial class HomeWorkForm : Form
    {
        SqlConnection cn = new SqlConnection("Data Source=ZOHANUBIS;Initial Catalog=QLSinhVien;Integrated Security=True");
        SqlDataAdapter da_SV;
        SqlDataAdapter da_MH;
        SqlDataAdapter da_Diem;
        DataSet ds_Diem = new DataSet();
        DataColumn[] key = new DataColumn[2];

        public HomeWorkForm()
        {
            InitializeComponent();
            Load_cboSV();
            Load_cboMH();
            Load_Grid();
        }

        void Load_cboSV()
        {
            string strSelect = "Select * from SinhVien";
            da_SV = new SqlDataAdapter(strSelect, cn);
            da_SV.Fill(ds_Diem, "LoaiSV");

            DataRow newrow = ds_Diem.Tables["LoaiSV"].NewRow();
            newrow["MaSinhVien"] = "Lop000";
            newrow["HoTen"] = "Tất cả Sinh Viên";
            ds_Diem.Tables["LoaiSV"].Rows.InsertAt(newrow, 0);

            comboBoxSV.DataSource = ds_Diem.Tables["LoaiSV"];
            comboBoxSV.DisplayMember = "HoTen";
            comboBoxSV.ValueMember = "MaSinhVien";
        }

        void Load_cboMH()
        {
            string strSelect = "Select * from MonHoc";
            da_MH = new SqlDataAdapter(strSelect, cn);
            da_MH.Fill(ds_Diem, "LoaiMH");

            DataRow newrow = ds_Diem.Tables["LoaiMH"].NewRow();
            newrow["MaMonHoc"] = "Mon000";
            newrow["TenMonHoc"] = "Tất cả Môn";
            ds_Diem.Tables["LoaiMH"].Rows.InsertAt(newrow, 0);

            comboBoxMH.DataSource = ds_Diem.Tables["LoaiMH"];
            comboBoxMH.DisplayMember = "TenMonHoc";
            comboBoxMH.ValueMember = "MaMonHoc";
        }

        void Load_Grid()
        {
            string strSelect = "SELECT DISTINCT SV.MaSinhVien, SV.HoTen, L.TenLop, DH.MaMonHoc, MH.TenMonHoc, DH.Diem " +
                               "FROM SinhVien SV " +
                               "INNER JOIN Lop L ON SV.MaLop = L.MaLop " +
                               "INNER JOIN Diem DH ON SV.MaSinhVien = DH.MaSinhVien " +
                               "INNER JOIN MonHoc MH ON DH.MaMonHoc = MH.MaMonHoc";

            da_Diem = new SqlDataAdapter(strSelect, cn);
            da_Diem.Fill(ds_Diem, "MHSV");

            dataGridView.DataSource = ds_Diem.Tables["MHSV"];
        }

        void Load_GridTypeMH(string MaMH)
        {
            if (MaMH == "Mon000")
            {
                Load_Grid();
            }
            else
            {
                ds_Diem.Tables["MHSV"].Clear();
                string strSelect = "SELECT DISTINCT SV.MaSinhVien, SV.HoTen, L.TenLop, DH.MaMonHoc, MH.TenMonHoc, DH.Diem " +
                                   "FROM SinhVien SV " +
                                   "INNER JOIN Lop L ON SV.MaLop = L.MaLop " +
                                   "INNER JOIN Diem DH ON SV.MaSinhVien = DH.MaSinhVien " +
                                   "INNER JOIN MonHoc MH ON DH.MaMonHoc = MH.MaMonHoc " +
                                   "WHERE DH.MaMonHoc = '" + MaMH + "'";

                SqlDataAdapter newDa = new SqlDataAdapter(strSelect, cn);
                newDa.Fill(ds_Diem, "MHSV");

                key[0] = ds_Diem.Tables["MHSV"].Columns[0];
                key[1] = ds_Diem.Tables["MHSV"].Columns[3];
                ds_Diem.Tables["MHSV"].PrimaryKey = key;
                dataGridView.DataSource = ds_Diem.Tables["MHSV"];
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            // Add your logic for adding data
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            object[] keys = new object[2];
            keys[0] = comboBoxSV.SelectedValue.ToString();
            keys[1] = comboBoxMH.SelectedValue.ToString();
            DataRow dr = ds_Diem.Tables["MHSV"].Rows.Find(keys);
            if (dr != null)
            {
                dr.Delete();
            }
            SqlCommandBuilder cb = new SqlCommandBuilder(da_Diem);
            da_Diem.Update(ds_Diem, "MHSV");
            Load_Grid();
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            // Add your logic for editing data
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void comboBoxSV_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Add your logic for handling the selected index change of comboBoxSV
        }

        private void comboBoxMH_SelectedIndexChanged(object sender, EventArgs e)
        {
            comboBoxMH.ValueMember = "MaMonHoc";
            string maMH = comboBoxMH.SelectedValue.ToString();
            Load_GridTypeMH(maMH);
        }
    }
}
