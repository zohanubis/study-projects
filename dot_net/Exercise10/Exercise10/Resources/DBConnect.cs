using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Exercise10.Resources
{
    internal class DBConnect
    {

        SqlConnection conn;
        public SqlConnection Conn
        {
            get { return conn; }
            set { conn = value; }
        }
        string strConnect = @"Data Source = ZOHANUBIS; Initial Catalog = QLSinhVien; Integrated Security = True";
        public DBConnect()
        {
            conn = new SqlConnection(strConnect);
        }
        public SqlConnection GetConnection()
        {
            return conn;
        }
        public DataTable getDataTable(string sql)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            da.Fill(dt);
            return dt;
        }
        public int getDataSinhVien(DataTable dt)
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from SinhVien", conn);
            SqlCommandBuilder cb = new SqlCommandBuilder(da);
            int kq = da.Update(dt);
            return kq;
        }
        public void OpenConnection()
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
        }
        public void CloseConnection()
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        }
    }
}
