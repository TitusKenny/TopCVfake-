using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TopCvFake.Models.ViewModels
{
    public class CVViewModels
    {
        public int MaBaiDang { get; set; }
        public string TenCty { get; set; }
        public string DiaChi { get; set; }
        public Nullable<int> MaPhanLoai { get; set; }
        public Nullable<System.DateTime> NgayDang { get; set; }
        public string Luong { get; set; }
        public string Logo { get; set; }
        public string CongViec { get; set; }
        public Nullable<int> MaDoiTac { get; set; }

        public IEnumerable<PhanLoaiMN> ListLoaiCV { get; set; }
       
        public virtual ICollection<DoiTac> DoiTacs { get; set; }
    }
}