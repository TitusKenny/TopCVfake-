using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TopCvFake.Models.ViewModels
{
    public class NopCv
    {
        public int MaNop { get; set; }
        public Nullable<int> MaDoiTac { get; set; }
        public Nullable<int> MaUser { get; set; }
        public Nullable<int> MaBaiDang { get; set; }
        public Nullable<int> MaProfile { get; set; }
        public string ThuGioiThieu { get; set; }

        public virtual CV CV { get; set; }
        public virtual DoiTac DoiTac { get; set; }
        public virtual User User { get; set; }
        public virtual Profile Profile { get; set; }
    }
}