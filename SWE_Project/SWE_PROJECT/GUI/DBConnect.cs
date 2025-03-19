using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace GUI
{
    internal class DBConnect
    {
        SqlConnection cn = new SqlConnection(Properties.Settings.Default.conStr);
        public SqlConnection conn
        {
            get { return cn; }
            set { cn = value; }
        }
        public SqlConnection GetConnection()
        {
            return cn;
        }
        public DataTable getDataTable(string sql)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            da.Fill(dt);
            return dt;
        }
        public int updateDatabaseThongTinDonHang(DataTable dt)
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM ThongTinDonHang", cn);
            SqlCommandBuilder cb = new SqlCommandBuilder(da);
            int kq = da.Update(dt);
            return kq;
        }

        public DataTable getCuaHangData()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM CuaHang", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable getKhoData()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Kho", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public DataTable getDVVCData()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM DonViVanChuyen", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public void OpenConnection()
        {
            if (cn.State == ConnectionState.Closed)
            {
                cn.Open();
            }
        }
        public void CloseConnection()
        {
            if (cn.State == ConnectionState.Open)
            {
                cn.Close();
            }
        }
        public int updateDatabase(DataTable dt)
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from Users", cn);
            SqlCommandBuilder cb = new SqlCommandBuilder(da);
            int kq = da.Update(dt);
            return kq;
        }
        public bool Kt_TrungKhoa(string a)
        {
            SqlCommand cmd;
            string sql_selected = "select Count(*) from Users Where userName = '" + a + "'";
            if (cn.State == ConnectionState.Closed)
                cn.Open();
            cmd = new SqlCommand(sql_selected, cn);
            int kq = (int)cmd.ExecuteScalar();
            if (cn.State == ConnectionState.Open)
                cn.Close();
            if (kq == 1)
                return false;
            else
                return true;
        }
        
    }
}
