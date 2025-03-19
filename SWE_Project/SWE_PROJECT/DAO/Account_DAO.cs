using DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class Account_DAO
    {
        static SqlConnection con;
        public static List<Account_DTO> LayAccount(string username, string pasword)
        {
            byte[] temp = ASCIIEncoding.ASCII.GetBytes(pasword);
            byte[] hasDate = new MD5CryptoServiceProvider().ComputeHash(temp);

            string hasPass = "";
            foreach (byte item in hasDate)
            {
                hasPass += item;
            }
            //var list = hasDate.ToString();
            //list.Reverse();
            con = DataProvider.MoKetNoi(); // mở kết nối đến CSDL
            DataTable dt = DataProvider.LayDuLieu("select * from account where username ='" + username + "' and passwork = '" + hasPass + "' and tthai = N'Bật'", con);
            // lấy dữ liệu vào datatable bằng câu truy vấn
            // nếu không thảo điều kiện thì datatable rỗng = 0
            if (dt.Rows.Count <= 0)
            {
                return null;
            }
            List<Account_DTO> lst = new List<Account_DTO>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                // gán các giả trị lấy được vào các trường đã tạo bên DTO
                Account_DTO ac = new Account_DTO();
                ac.Username = dt.Rows[0]["username"].ToString();
                ac.Password = dt.Rows[0]["passwork"].ToString();
                ac.Typeuser = dt.Rows[0]["typeuser"].ToString();
                ac.Tthai = dt.Rows[0]["tthai"].ToString();
                // trả về dữ liệu của Account_DTO nếu không có là rỗng
                lst.Add(ac);
            }
            con = DataProvider.DongKetNoi();
            return lst;
        }
    }
}
