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

namespace KT_PhamHoDangHuy_2001215828
{
    public partial class ExerciseForm1 : Form
    {
        SqlConnection cn = new SqlConnection(Properties.Settings.Default.conStr);
        SqlDataAdapter da_Lop;
        DataSet ds_Lop = new DataSet();
        DataColumn[] key = new DataColumn[1];
        public ExerciseForm1()
        {
            InitializeComponent();
        }
        void Load_cboLop()
        {
            string strSelect = "Select * from Lop";
            da_Lop = new SqlDataAdapter(strSelect, cn);
            da_Lop.Fill(ds_Lop, "Lop");

            cbo_Lop.DataSource = ds_Lop.Tables["Lop"];
            cbo_Lop.DisplayMember = "MaLop";
            cbo_Lop.ValueMember = "MaLop";
        }
        void Load_Grid()
        {
            string strSelect = "Select * from SinhVien";
            da_Lop = new SqlDataAdapter(strSelect, cn);
            da_Lop.Fill(ds_Lop, "SinhVien");
            key[0] = ds_Lop.Tables["SinhVien"].Columns[0];
            ds_Lop.Tables["SinhVien"].PrimaryKey = key;
            dataGridView.DataSource = ds_Lop.Tables["SinhVien"];
        }
        void DataBingding(DataTable pDT)
        {
            cbo_Lop.DataBindings.Clear();
            txtMaSV.DataBindings.Clear();
            txtHoSV.DataBindings.Clear();
            txtTenSV.DataBindings.Clear();
            mtxtNgaySinh.DataBindings.Clear();
            txtGioiTinh.DataBindings.Clear();

            cbo_Lop.DataBindings.Add("Text", pDT, "MaLop");
            txtHoSV.DataBindings.Add("Text", pDT, "HoSV");
            txtTenSV.DataBindings.Add("Text", pDT, "TenSV");
            txtGioiTinh.DataBindings.Add("Text", pDT, "GioiTinh");
            txtMaSV.DataBindings.Add("Text", pDT, "MaSinhVien");
            mtxtNgaySinh.DataBindings.Add("Text", pDT, "NgaySinh");
        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            DataRow newrow = ds_Lop.Tables["SinhVien"].NewRow();
            newrow["MaSinhVien"] = txtMaSV.Text;
            newrow["HoSV"] = txtHoSV.Text;
            newrow["TenSV"] = txtTenSV.Text;
            newrow["NgaySinh"] = mtxtNgaySinh.Text;
            newrow["GioiTinh"] = txtGioiTinh.Text;
            newrow["MaLop"] = cbo_Lop.SelectedValue.ToString();
            try
            {
                ds_Lop.Tables["SinhVien"].Rows.Add(newrow);
            }
            catch
            {
                MessageBox.Show("Mã Lớp không được trùng");
            }
            SqlCommandBuilder cb = new SqlCommandBuilder(da_Lop);
            da_Lop.Update(ds_Lop, "SinhVien");
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            DataRow dr = ds_Lop.Tables["SinhVien"].Rows.Find(txtMaSV.Text);
            if (dr != null) { dr.Delete(); }
            SqlCommandBuilder cb = new SqlCommandBuilder(da_Lop);
            da_Lop.Update(ds_Lop, "SinhVien");
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            DataRow dr = ds_Lop.Tables["SinhVien"].Rows.Find(txtMaSV.Text);
            if (dr != null)
            {
                
                dr["TenSV"] = txtTenSV.Text;
                dr["HoSV"] = txtHoSV.Text;
                dr["NgaySinh"] = mtxtNgaySinh.Text;
                dr["MaLop"] = cbo_Lop.SelectedValue.ToString();
                SqlCommandBuilder cb = new SqlCommandBuilder(da_Lop);
                da_Lop.Update(ds_Lop, "SinhVien");
            }
        }

        private void ExerciseForm1_Load(object sender, EventArgs e)
        {
            Load_cboLop();
            Load_Grid();
            DataBingding(ds_Lop.Tables["SinhVien"]);
        }
    }
}
