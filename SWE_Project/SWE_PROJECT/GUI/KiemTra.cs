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

namespace GUI
{
    public partial class KiemTra : Form
    {
        DBConnect db = new DBConnect();
        DataTable dt;
        public KiemTra()
        {
            InitializeComponent();
            string sql = "SELECT * FROM ThongTinDonHang";
            dt = db.getDataTable(sql);
        }
        void Load_Grid(string sql)
        {
            dt = db.getDataTable(sql);
            dataGridView.DataSource = dt;
        }
        void Load_cbo()
        {
            DataTable dtComboBox = new DataTable("TrangThai");
            dtComboBox.Columns.Add("MaDonHang");
            dtComboBox.Columns.Add("TrangThai");

            DataRow allRow = dtComboBox.NewRow();
            allRow["MaDonHang"] = "Loai000";
            allRow["TrangThai"] = "Tất cả trạng thái";
            dtComboBox.Rows.Add(allRow);

            DataRow availableRow = dtComboBox.NewRow();
            availableRow["MaDonHang"] = "Loai001";
            availableRow["TrangThai"] = "Giao Hàng Thành Công";
            dtComboBox.Rows.Add(availableRow);

            DataRow outOfStockRow = dtComboBox.NewRow();
            outOfStockRow["MaDonHang"] = "Loai002";
            outOfStockRow["TrangThai"] = "Đang vận chuyển";
            dtComboBox.Rows.Add(outOfStockRow);

            DataRow failOfStockRow = dtComboBox.NewRow();
            failOfStockRow["MaDonHang"] = "Loai003";
            failOfStockRow["TrangThai"] = "Giao hàng thất bại";
            dtComboBox.Rows.Add(failOfStockRow);

            cbo_LocDuLieu.DataSource = dtComboBox;
            cbo_LocDuLieu.DisplayMember = "TrangThai";
            cbo_LocDuLieu.ValueMember = "MaDonHang";
        }
        private void dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void KiemTra_Load(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM ThongTinDonHang";
            Load_Grid(sql);
            Load_cbo();
        }

        private void txtMaDonHang_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void cbo_LocDuLieu_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedType = cbo_LocDuLieu.SelectedValue.ToString();

            if (selectedType == "Loai000")
            {
                string sql = "SELECT * FROM ThongTinDonHang";
                Load_Grid(sql);
            }
            else if (selectedType == "Loai001")
            {
                string sql = "SELECT * FROM ThongTinDonHang WHERE TrangThai = N'Giao Hàng Thành Công'";
                Load_Grid(sql);
            }
            else if (selectedType == "Loai002")
            {
                string sql = "SELECT * FROM ThongTinDonHang WHERE TrangThai = N'Đang vận chuyển'";
                Load_Grid(sql);
            }
            else if (selectedType == "Loai003")
            {
                string sql = "SELECT * FROM ThongTinDonHang WHERE TrangThai = N'Giao hàng thất bại'";
                Load_Grid(sql);
            }    

        }
    }
}
