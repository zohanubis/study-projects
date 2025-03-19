using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class Account_DTO_tmp
    {
        // khởi tạo các trường để lưu dữ liệu
        private string username;
        private string typeuser;

        [DisplayName("Tài Khoản")]
        public string Username { get => username; set => username = value; }
        [DisplayName("Loại Tài Khoản")]
        public string Typeuser { get => typeuser; set => typeuser = value; }
    }
}
