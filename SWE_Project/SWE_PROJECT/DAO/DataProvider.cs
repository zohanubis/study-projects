using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class DataProvider
    {
        public static SqlConnection MoKetNoi()
        {
            //desktop-5ol6p9r\sqlexpress2019
            //(local)\SQLEXPRESS
            SqlConnection KetNoi = new SqlConnection(@"Data Source=ZOHANUBIS;Initial Catalog=QL_TraHangLazda;Integrated Security=True");
            KetNoi.Open();
            return KetNoi;
        }
        public static SqlConnection DongKetNoi()
        {
            SqlConnection KetNoi = new SqlConnection(@"Data Source=ZOHANUBIS;Initial Catalog=QL_TraHangLazda;Integrated Security=True");
            KetNoi.Close();
            return KetNoi;
        }
        //public string KiemTraTaiKhoan( string TK, string MK)
        //{
        //    SqlConnection KetNoi = new SqlConnection(@"Data Source=ZOHANUBIS;Initial Catalog=QL_TraHangLazda;Integrated Security=True");
        //    SqlCommand cmd;
        //    string selected = "Select * from Account";
        //    if (KetNoi.State == ConnectionState.Closed)
        //    {
        //        KetNoi.Open();
        //    }
        //    cmd = new SqlCommand(selected, KetNoi);
        //    SqlDataReader rd = cmd.ExecuteReader();
        //    while (rd.Read())
        //    {
        //        string tak = rd["username"].ToString();
        //        string mak = rd["password"].ToString();
        //        string role = rd["typeuser"].ToString();
        //        if(TK == tak && MK == mak && role == "AD")
        //        {
        //            if(KetNoi.State == ConnectionState.Open)
        //            {
        //                KetNoi.Close();

        //            }
        //            return AD;
        //        }
        //        if (TK == tak && MK == mak && role == "NV")
        //        {
        //            if (KetNoi.State == ConnectionState.Open)
        //            {
        //                KetNoi.Close();

        //            }
        //            return 2;
        //        }
        //        if(KetNoi.State == ConnectionState.Open)
        //        {
        //            KetNoi.Close();
        //        }
        //        return 0;
        //    }
        //}
        public static DataTable LayDuLieu(string truyvan, SqlConnection KetNoi)
        {
            SqlDataAdapter da = new SqlDataAdapter(truyvan, KetNoi);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public static bool KLayDuLieu(string truyvan, SqlConnection Ketoi)
        {
            try
            {
                SqlCommand cm = new SqlCommand(truyvan, Ketoi);
                cm.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public static int TruyVanLayGiaTriINT(string truyvan, SqlConnection Ketnoi)
        {
            try
            {
                SqlCommand cm = new SqlCommand(truyvan, Ketnoi);
                int GiaTri = Convert.ToInt32(cm.ExecuteScalar());
                return GiaTri;
            }
            catch (Exception)
            {
                return -1;
            }
        }
    }
}
