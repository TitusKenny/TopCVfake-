using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TopCvFake.Models.ViewModels
{
    public class ProfileViewModels
    {
        public int MaProfile { get; set; }
        public string ChucVuUngTuyen { get; set; }
        public string HinhCV { get; set; }
        public string KinhNghiem { get; set; }
        public string HocVan { get; set; }
        public string NgonNgu { get; set; }
        public Nullable<int> MaUser { get; set; }

        public virtual ICollection<User> Users { get; set; }
    }
}