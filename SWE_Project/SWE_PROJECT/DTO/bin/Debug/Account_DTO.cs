using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DTO
{
    public class Account_DTO
    {
        // khởi tạo các trường để lưu dữ liệu
        private string username;
        private string password;
        private string typeuser;
        private string tthai;

        public string Username { get => username; set => username = value; }
        public string Password { get => password; set => password = value; }
        public string Typeuser { get => typeuser; set => typeuser = value; }
        public string Tthai { get => tthai; set => tthai = value; }
    }
}
