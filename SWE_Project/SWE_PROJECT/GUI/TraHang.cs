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
    public partial class TraHang : Form
    {

        DBConnect db = new DBConnect();
        DataTable dt;
        public TraHang()
        {
            InitializeComponent();
        }

        void Load_Grid(string sql)
        {
            dt = db.getDataTable(sql);
            dataGridView.DataSource = dt;
        }

        private void cbo_DVVC_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void TraHang_Load(object sender, EventArgs e)
        {
            string sql = "EXEC LayThongTinDonHang";
            Load_Grid(sql);
            //Load_cbo();

        }
        //void Load_cbo()
        //{
        //    DataTable dtComboBox = new DataTable("TrangThai");
        //    dtComboBox.Columns.Add("MaDonHang");
        //    dtComboBox.Columns.Add("TrangThai");

        //    DataRow allRow = dtComboBox.NewRow();
        //    allRow["MaDonHang"] = "Loai000";
        //    allRow["TrangThai"] = "Tất cả trạng thái";
        //    dtComboBox.Rows.Add(allRow);

        //    DataRow availableRow = dtComboBox.NewRow();
        //    availableRow["MaDonHang"] = "Loai001";
        //    availableRow["TrangThai"] = "Giao Hàng Thành Công";
        //    dtComboBox.Rows.Add(availableRow);

        //    DataRow outOfStockRow = dtComboBox.NewRow();
        //    outOfStockRow["MaDonHang"] = "Loai002";
        //    outOfStockRow["TrangThai"] = "Đang vận chuyển";
        //    dtComboBox.Rows.Add(outOfStockRow);

        //    DataRow failOfStockRow = dtComboBox.NewRow();
        //    failOfStockRow["MaDonHang"] = "Loai003";
        //    failOfStockRow["TrangThai"] = "Giao hàng thất bại";
        //    dtComboBox.Rows.Add(failOfStockRow);

        //    cbo_LocDuLieu.DataSource = dtComboBox;
        //    cbo_LocDuLieu.DisplayMember = "TrangThai";
        //    cbo_LocDuLieu.ValueMember = "MaDonHang";
        //}
        private void dataGridView_SelectionChanged(object sender, EventArgs e)
        {
            
            
        }

        private void btnChuyenFormTH_Click(object sender, EventArgs e)
        {
            FormTraHang f = new FormTraHang();
            f.ShowDialog();
        }

        private void dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void txtTenKhachHang_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnChuyen_Click(object sender, EventArgs e)
        {
            FormTraHang f = new FormTraHang();
            this.Hide();
            f.ShowDialog();
        }

        private void txtMaDonHang_TextChanged(object sender, EventArgs e)
        {
            string searchKeyword = txtMaDonHang.Text.Trim();
            string sql = $"EXEC GetFullDonHangInfoWithFilter @MaDonHangFilter = '{searchKeyword}'";
            Load_Grid(sql);
        }

        private void cbo_LocDuLieu_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string trangThaiFilter = cbo_LocDuLieu.SelectedValue.ToString();
            //string sql = $"EXEC GetDonHangInfoByTrangThai @TrangThaiFilter = '{trangThaiFilter}'";
            //Load_Grid(sql);
        }
    }
}
