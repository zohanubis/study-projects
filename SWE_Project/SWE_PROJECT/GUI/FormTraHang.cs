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
    public partial class FormTraHang : Form
    {
        DBConnect db = new DBConnect();
        DataTable dt;
        int TongTien = 0;
        public FormTraHang()
        {
            InitializeComponent();
        }



        void Load_Grid()
        {

        }
        void Load_cboKho()
        {
            DataTable dtComboBox = db.getKhoData();
            cbo_Kho.DataSource = dtComboBox;
            cbo_Kho.DisplayMember = "TenKho";
            cbo_Kho.ValueMember = "MaKho";
        }
        void Load_cboCuaHang()
        {
            DataTable dtComboBox = db.getCuaHangData();
            cbo_CuaHang.DataSource = dtComboBox;
            cbo_CuaHang.DisplayMember = "TenCuaHang";
            cbo_CuaHang.ValueMember = "MaCuaHang";
        }
        void Load_cboDVVC()
        {
            DataTable dtComboBox = db.getDVVCData();
            cbo_DVVC.DataSource = dtComboBox;
            cbo_DVVC.DisplayMember = "TenDonVi";
            cbo_DVVC.ValueMember = "MaDonVi";
        }
        private void FormTraHang_Load(object sender, EventArgs e)
        {
            Load_cboCuaHang();
            Load_cboKho();
            Load_cboDVVC();
        }

        private void guna2ControlBox1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void guna2ControlBox3_Click(object sender, EventArgs e)
        {

        }

        private void cbo_DVVC_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void comboBox_MucDo_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                if (int.TryParse(txtSLTra.Text, out int quantity) && quantity >= 0)
                {

                    int n = dataGridView.Rows.Add();
                    dataGridView.Rows[n].Cells[0].Value = txtMaTraHang.Text;
                    dataGridView.Rows[n].Cells[1].Value = txtTenKhachHang.Text;
                    dataGridView.Rows[n].Cells[2].Value = cbo_CuaHang.SelectedValue.ToString();
                    dataGridView.Rows[n].Cells[3].Value = txtTenSanPham.Text;
                    dataGridView.Rows[n].Cells[4].Value = txtSLTra.Text;
                    dataGridView.Rows[n].Cells[5].Value = cbo_DVVC.SelectedValue.ToString();
                    dataGridView.Rows[n].Cells[6].Value = cbo_Kho.SelectedValue.ToString();
                    dataGridView.Rows[n].Cells[7].Value = txtTongTienBanDau.Text;

                    // Assuming you manually input the value for txtPhiPhatSinh
                    if (int.TryParse(txtPhiPhatSinh.Text, out int phiPhatSinh))
                    {
                        // Calculate TongTien based on the input value of txtPhiPhatSinh and txtTongPhiBanDau
                        TongTien = int.Parse(txtTongTienBanDau.Text) + phiPhatSinh;

                        // Update the corresponding cell in the DataGridView with the calculated TongTien
                        dataGridView.Rows[n].Cells[8].Value = TongTien.ToString();

                        // Display the result in txtTongTien
                        txtTongTien.Text = TongTien.ToString();
                    }
                    else
                    {
                        MessageBox.Show("Vui lòng nhập giá trị hợp lệ cho phí phát sinh.");
                    }
                }
                else
                {
                    MessageBox.Show("Vui lòng nhập số lượng hợp lệ.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Lỗi khi thêm hàng: {ex.Message}", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void ppdHoaDon_Load(object sender, EventArgs e)
        {

        }
        private void InHoaDon()
        {
            pddHoaDon.Document = pdHoaDon;
            pddHoaDon.ShowDialog();
        }
        private void pdHoaDon_PrintPage(object sender, System.Drawing.Printing.PrintPageEventArgs e)
        {
            string ten = "PHIẾU TRẢ HÀNG LAZADA";
            string diaChiCH = "140 Lê Trọng Tân, Tây Thạnh, TP.HCM";
            string phone = "0779.139.003";
            string maDH = txtMaDonHang.Text;
            string cuaHang = cbo_CuaHang.SelectedValue.ToString();
            string diaChiKH = txtDiaChiKH.Text;
            string phoneKH = txtPhone.Text;
            string dVVC = cbo_DVVC.SelectedValue.ToString();
            string kho = cbo_Kho.SelectedValue.ToString();

            if (cbo_Kho.SelectedValue == "HNK001")
            {
                kho = "Kho Quận 11 - 185 – 189 đường Âu Cơ, phường 14, Q11";
            }else if(cbo_Kho.SelectedValue == "HCMK002")
            {
                kho = "Kho Gò Vấp - 260, hẻm 262, đường Quang Trung, phường 10, quận Gò Vấp";
            }
            else
            {
                kho = "Kho Quận 1 -2BIS,Nguyễn Thị Minh Khai, phường Đa Kao, Quận 1";
            }
            if(cbo_DVVC.SelectedValue == "DV001")
            {
                dVVC = "Giao Hàng Nhanh - 0123456789";
            }
            else if(cbo_DVVC.SelectedValue == "DV002")
            {
                dVVC = "Viettel Post - 0123456789";

            }
            string phuongThucThanhToan = null;
            if (checkCK.Checked)
            {
                phuongThucThanhToan = checkCK.Text;
            }
            else if (checkTheNH.Checked)
            {
                phuongThucThanhToan = checkTheNH.Text;
            }
            else
            {
                phuongThucThanhToan = checkTM.Text;
            }
            string loi = null;
            if (checkKH.Checked)
            {
                loi = checkKH.Text;
            }
            else if (checkShop.Checked) { loi = checkShop.Text; }
            else { loi = checkVC.Text; }
            string liDo = txtLiDo.Text;
            var w = pdHoaDon.DefaultPageSettings.PaperSize.Width;

            // In thông tin từ DataGridView
            if (dataGridView != null && dataGridView.Rows.Count > 0)
            {
                foreach (DataGridViewRow row in dataGridView.Rows)
                {
                    if (row.Cells.Count >= 7 && row.Cells[0].Value != null)
                    {
                        string maPTH = row.Cells[0].Value.ToString();
                        string tenKhachHang = row.Cells[1].Value.ToString();
                        string thanhTien = row.Cells[8].Value.ToString();
                        #region header
                        e.Graphics.DrawString(ten.ToUpper(),
                            new Font("Courier New", 12, FontStyle.Bold),
                            Brushes.Black, new Point(10, 20));
                        // Số Hóa Đơn
                        e.Graphics.DrawString(
                            string.Format("Số Phiếu: {0}", maPTH),
                            new Font("Courier New", 12, FontStyle.Bold),
                            Brushes.Black,
                            new PointF(w / 2 + 200, 20)
                            );
                        // Địa chỉ, phone
                        e.Graphics.DrawString(
                            string.Format("{0} - {1}", diaChiCH, phone),
                            new Font("Courier New", 8, FontStyle.Bold),
                            Brushes.Black,
                            new PointF(100, 45)
                            );
                        // Ngày xuất hóa đơn
                        e.Graphics.DrawString(
                           string.Format("{0}", DateTime.Now.ToString("dd/MM/yyyy HH:mm")),
                           new Font("Courier New", 12, FontStyle.Bold),
                           Brushes.Black,
                           new PointF(w / 2 + 200, 45)
                           );
                        Pen blackPen = new Pen(Color.Black, 1);
                        var y = 70;

                        Point p1 = new Point(10, y);
                        Point p2 = new Point(w - 10, y);
                        e.Graphics.DrawLine(blackPen, p1, p2);
                        y += 10;
                        e.Graphics.DrawString(
                            string.Format("Bên Khách Hàng"),
                            new Font("Courier New", 10, FontStyle.Bold),
                            Brushes.Black,
                            new PointF(50, y)
                            );
                        y += 15;
                        e.Graphics.DrawString(
                            string.Format("Tên Khách Hàng : {0}", tenKhachHang),
                            new Font("Courier New", 10, FontStyle.Regular),
                            Brushes.Black,
                            new PointF(100, y)
                            );
                        e.Graphics.DrawString(
                            string.Format("Số Điện Thoại : {0}", phoneKH),
                            new Font("Courier New", 10, FontStyle.Regular),
                            Brushes.Black,
                            new PointF(w / 2, y)
                            );
                        y += 15;
                        e.Graphics.DrawString(
                            string.Format("Địa chỉ khách hàng : {0}", diaChiKH),
                            new Font("Courier New", 10, FontStyle.Regular),
                            Brushes.Black,
                            new PointF(100, y)
                            );
                        y += 20;
                        p1 = new Point(10, y);
                        p2 = new Point(w - 10, y);
                        e.Graphics.DrawLine(blackPen, p1, p2);
                        #endregion
                        e.Graphics.DrawString(
                            string.Format("Bên Cửa Hàng"),
                            new Font("Courier New", 10, FontStyle.Bold),
                            Brushes.Black,
                            new PointF(50, y)
                            );
                        y += 15;
                        e.Graphics.DrawString(
                            string.Format("Tên Cửa Hàng : {0}", cuaHang ),
                            new Font("Courier New", 10, FontStyle.Regular),
                            Brushes.Black,
                            new PointF(100, y)
                            );
                        
                        y += 20;
                        p1 = new Point(10, y);
                        p2 = new Point(w - 10, y);
                        e.Graphics.DrawLine(blackPen, p1, p2);
                        #region body

                        e.Graphics.DrawString("STT", new Font("Courier New", 10, FontStyle.Bold), Brushes.Black, new Point(10, y));
                        e.Graphics.DrawString("Tên Sản Phẩm", new Font("Courier New", 10, FontStyle.Bold), Brushes.Black, new Point(50, y));
                        e.Graphics.DrawString("Số Lượng", new Font("Courier New", 10, FontStyle.Bold), Brushes.Black, new Point(w / 2 + 90, y));
                        e.Graphics.DrawString("Tiền Đầu", new Font("Courier New", 10, FontStyle.Bold), Brushes.Black, new Point(w / 2, y));
                        e.Graphics.DrawString("Thành Tiền", new Font("Courier New", 10, FontStyle.Bold), Brushes.Black, new Point(w - 200, y));

                        int i = 1;
                        y += 20;
                        foreach (DataGridViewRow row1 in dataGridView.Rows)
                        {
                            if (row1.Cells.Count >= 7 && row1.Cells[0].Value != null)
                            {
                                string tenSP = row1.Cells[3].Value.ToString();
                                string giaBanDau = row1.Cells[7].Value.ToString();
                                string soLuong = row1.Cells[4].Value.ToString();
                                string thanhtiens = row1.Cells[8].Value.ToString();

                                e.Graphics.DrawString(string.Format("{0}", i++), new Font("Courier New", 10, FontStyle.Regular), Brushes.Black, new Point(10, y));
                                e.Graphics.DrawString(string.Format("{0}", tenSP), new Font("Courier New", 10, FontStyle.Regular), Brushes.Black, new Point(50, y));
                                e.Graphics.DrawString(string.Format("{0}", soLuong), new Font("Courier New", 10, FontStyle.Regular), Brushes.Black, new Point(w / 2 + 100, y));
                                e.Graphics.DrawString(string.Format("{0}", giaBanDau), new Font("Courier New", 10, FontStyle.Regular), Brushes.Black, new Point(w / 2, y));
                                e.Graphics.DrawString(string.Format("{0}", thanhtiens), new Font("Courier New", 10, FontStyle.Bold), Brushes.Black, new Point(w - 200, y));
                                y += 20;

                            }
                        }
                        y += 40;
                        p1 = new Point(10, y);
                        p2 = new Point(w - 10, y);
                        e.Graphics.DrawLine(blackPen, p1, p2);
                        #endregion
                        y += 15;
                        e.Graphics.DrawString(
                            string.Format("Hình thức"),
                            new Font("Courier New", 10, FontStyle.Bold),
                            Brushes.Black,
                            new PointF(50, y)
                            );
                        y += 15;
                        e.Graphics.DrawString(
                            string.Format("Thanh Toán : {0}", phuongThucThanhToan),
                            new Font("Courier New", 10, FontStyle.Regular),
                            Brushes.Black,
                            new PointF(100, y)
                            );
                        e.Graphics.DrawString(
                            string.Format("Lỗi từ : {0}", loi),
                            new Font("Courier New", 10, FontStyle.Regular),
                            Brushes.Black,
                            new PointF(w / 2, y)
                            );
                        y += 40;
                        p1 = new Point(10, y);
                        p2 = new Point(w - 10, y);
                        e.Graphics.DrawLine(blackPen, p1, p2);
                        y += 15;

                        e.Graphics.DrawString(
                            string.Format("Lí do : {0}", liDo),
                            new Font("Courier New", 10, FontStyle.Bold),
                            Brushes.Black,
                            new PointF(100, y)
                            );
                        y += 40;
                        p1 = new Point(10, y);
                        p2 = new Point(w - 10, y);
                        e.Graphics.DrawLine(blackPen, p1, p2);
                        y += 10;
                        e.Graphics.DrawString(
                           string.Format("Kho : {0}", kho),
                           new Font("Courier New", 10, FontStyle.Bold),
                           Brushes.Black,
                           new PointF(100, y)
                           );
                        y += 15;
                        e.Graphics.DrawString(
                           string.Format("Đơn Vị Vận Chuyển : {0}", dVVC),
                           new Font("Courier New", 10, FontStyle.Bold),
                           Brushes.Black,
                           new PointF(100, y)
                           );
                        y += 40;
                        p1 = new Point(10, y);
                        p2 = new Point(w - 10, y);
                        e.Graphics.DrawLine(blackPen, p1, p2);
                        y += 10;
                        e.Graphics.DrawString(
                            string.Format("Bên Khách Hàng"),
                            new Font("Courier New", 10, FontStyle.Bold),
                            Brushes.Black,
                            new PointF(100, y)
                            );
                        e.Graphics.DrawString(
                            string.Format("Bên Công Ty"),
                            new Font("Courier New", 10, FontStyle.Bold),
                            Brushes.Black,
                            new PointF(w / 2, y)
                            );
                        y += 30;
                        e.Graphics.DrawString(
                            string.Format("(Kí tên)"),
                            new Font("Courier New", 10, FontStyle.Bold),
                            Brushes.Black,
                            new PointF(100, y)
                            );
                        e.Graphics.DrawString(
                            string.Format("(Kí Tên)"),
                            new Font("Courier New", 10, FontStyle.Bold),
                            Brushes.Black,
                            new PointF(w / 2, y)
                            );
                    }
                }
            }
        }

        private void btnChuyenFormTH_Click(object sender, EventArgs e)
        {
            InHoaDon();
        }
    }

}
