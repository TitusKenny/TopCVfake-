using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TopCvFake.Models.ViewModels
{
    public class bigmodel
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

        public virtual DoiTac DoiTac { get; set; }
        public virtual PhanLoaiMN PhanLoaiMN { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NopCV> NopCVs { get; set; }
        public int MaProfile { get; set; }
        public string ChucVuUngTuyen { get; set; }
        public string HinhCV { get; set; }
        public string KinhNghiem { get; set; }
        public string HocVan { get; set; }
        public string NgonNgu { get; set; }
        public Nullable<int> MaUser { get; set; }
        public virtual ICollection<User> Users { get; set; }
        public virtual User User { get; set; }
        public int MaNop { get; set; }
        public string ThuGioiThieu { get; set; }
        public virtual CV CV { get; set; }
        public virtual Profile Profile { get; set; }
    }
}