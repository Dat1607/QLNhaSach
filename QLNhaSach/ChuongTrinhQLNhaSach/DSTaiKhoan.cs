using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChuongTrinhQLNhaSach
{
    public class DSTaiKhoan
    {
        private static DSTaiKhoan instance;
        public static DSTaiKhoan Instance
        {
            get
            {
                if (instance == null)
                    instance = new DSTaiKhoan();
                return instance;
            }
            set => instance = value;
        }
        List<TK_MK> lstTaiKhoan;

        public List<TK_MK> LstTaiKhoan
        {
            get => lstTaiKhoan;
            set => lstTaiKhoan = value;
        }
        DSTaiKhoan()
        {
            lstTaiKhoan = new List<TK_MK>();
            lstTaiKhoan.Add(new TK_MK("user1", "123456",TK_MK.LoaiTK.nhanvien));
            lstTaiKhoan.Add(new TK_MK("user2", "123456",TK_MK.LoaiTK.user));
            lstTaiKhoan.Add(new TK_MK("admin", "123",TK_MK.LoaiTK.admin));
        }
    }
}
