//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TopCvFake.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CV
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CV()
        {
            this.NopCVs = new HashSet<NopCV>();
        }
    
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
    }
}
