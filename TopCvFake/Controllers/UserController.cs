using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using TopCvFake.Models;
using TopCvFake.Models.ViewModels;

using PagedList;
using PagedList.Mvc;



namespace TopCvFake.Controllers
{
    public class UserController : Controller
    {
        
        private TopCVEntities db = new TopCVEntities();
        private List<Profile> Laycv(int count)
        {
            return db.Profiles.OrderByDescending(s => s.MaProfile).Take(count).ToList();
        }
        public ActionResult Index(int? page)
        { 
            int pageSize = 9;
            int pageNum = (page ?? 1);           
            var spmoi = (from l in db.CVs 
                         select l ).OrderByDescending(s => s.NgayDang) ;
            return View(spmoi.ToPagedList(pageNum, pageSize));
        }
        public ActionResult IndexMonth(int? page)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            var spmoi = (from l in db.CVs
                         where l.NgayDang.Value.Month == DateTime.Now.Month
                         select l).OrderByDescending(s => s.NgayDang);
            return View(spmoi.ToPagedList(pageNum, pageSize));
        }
        public ActionResult IndexDay(int? page)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            var spmoi = (from l in db.CVs
                         where l.NgayDang.Value.Day == DateTime.Now.Day
                         select l).OrderByDescending(s => s.NgayDang);
            return View(spmoi.ToPagedList(pageNum, pageSize));
        }
        public ActionResult IndexHour(int? page)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            var spmoi = (from l in db.CVs
                         where l.NgayDang.Value.Hour == DateTime.Now.Hour
                         select l).OrderByDescending(s => s.NgayDang);
            return View(spmoi.ToPagedList(pageNum, pageSize));
        }
        public ActionResult ProfileAdmin(int? id , DoiTac dt )
        {
            dt = db.DoiTacs.FirstOrDefault(n => n.MaDoiTac == id);
            return PartialView(dt);
        }
        public ActionResult Profile(int id)
        {   
            User us = db.Users.FirstOrDefault(n => n.MaUser == id);
            return View(us);
        }
        public ActionResult EditProfileUser(int id)
        {
            User us = db.Users.Where(s => s.MaUser == id).FirstOrDefault();
            return View(us);
        }
        [HttpPost]
        public ActionResult EditProfileUser(User user)
        {
            
            User Us = db.Users.Where(s => s.MaUser == user.MaUser).FirstOrDefault();
            Us.HoTen = user.HoTen;
            Us.DienThoai = user.DienThoai;
            Us.DiaChi = user.DiaChi;
            Us.Email = user.Email;
            Us.MatKhau = user.MatKhau;
            Us.NgaySinh = user.NgaySinh;
            db.SaveChanges();
            return RedirectToAction("Profile",new {id = user.MaUser});
        }
        [HttpGet]
        public ActionResult DetailsCV(int id,Profile profile)
        {
            CV cv = db.CVs.FirstOrDefault(n => n.MaBaiDang == id);
            return View(cv);
        }
        public ActionResult CV(int? page)
        {
            int pageSize = 4;
            int pageNum = (page ?? 1);
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
                return null;
            User user = Session["TaiKhoan"] as User;
            var listsp = (from s in db.Profiles
                         where s.MaUser == user.MaUser 
                         select s).OrderByDescending(s=>s.MaProfile);
            return View(listsp.ToPagedList(pageNum, pageSize));
        }
        public ActionResult Create()
        {
            ProfileViewModels pModel = new ProfileViewModels();
            return View(pModel);
        }
        [HttpPost]
        public ActionResult Create(Profile pro5, HttpPostedFileBase fileUpload)
        {
            var fileName = Path.GetFileName(fileUpload.FileName);
            var filePath = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
            fileUpload.SaveAs(filePath);
            if (!System.IO.File.Exists(filePath))
                fileUpload.SaveAs(filePath);

            Profile PRO5 = new Profile
            {
                ChucVuUngTuyen = pro5.ChucVuUngTuyen,
                HinhCV = "Content/Image/" + fileName,
                KinhNghiem = pro5.KinhNghiem,
                HocVan = pro5.HocVan,
                NgonNgu = pro5.NgonNgu
            };
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")

                return null;
            User us = Session["TaiKhoan"] as User;
            PRO5.MaUser = us.MaUser;
            db.Profiles.Add(PRO5);
            db.SaveChanges();
            return RedirectToAction("CV", new {id = us.MaUser} );
        }
        public ActionResult Details(int id)
        {
            Profile pro5 = db.Profiles.FirstOrDefault(s => s.MaProfile == id);
            return View(pro5);
        }
        public ActionResult Edit(int id)
        {
            Profile pro5 = db.Profiles.Where(s => s.MaProfile == id).FirstOrDefault();    
            return View(pro5);
        }     
        [HttpPost]
        public ActionResult Edit(Profile pro5, HttpPostedFileBase fileUpload)
        {
            var fileName = Path.GetFileName(fileUpload.FileName);
            var filePath = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
            fileUpload.SaveAs(filePath);
            if (!System.IO.File.Exists(filePath))
                fileUpload.SaveAs(filePath);

            Profile PRO5 = db.Profiles.Where(s => s.MaProfile == pro5.MaProfile).FirstOrDefault();
            PRO5.ChucVuUngTuyen = pro5.ChucVuUngTuyen;
            PRO5.HinhCV = "Content/Image/" + fileName;
            PRO5.KinhNghiem = pro5.KinhNghiem;
            PRO5.HocVan = pro5.HocVan;
            PRO5.NgonNgu = pro5.NgonNgu;                   
            db.SaveChanges();
            return RedirectToAction("Details", new {id = pro5.MaProfile});
        }
        public ActionResult Delete(int id)
        {
           Profile pro5 = db.Profiles.Where(s => s.MaProfile == id).FirstOrDefault();           
            return View(pro5);
        }
        [HttpPost]
        public ActionResult Delete(Profile pro5, int id)
        {
            Profile PRO5 = db.Profiles.Single(s => s.MaProfile == id);
            db.Profiles.Remove(PRO5);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult SearchByName(int? page, string name)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            List<CV> sp = db.CVs.Where(s => s.TenCty.Contains(name) || s.CongViec.Contains(name) || s.DiaChi.Contains(name)).ToList();
            ViewBag.keyword = name;
            return View(sp.ToPagedList(pageNum, pageSize));
        }
        public ActionResult SearchByDC(int? page, string name)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            List<CV> sp = db.CVs.Where(s => s.DiaChi.Contains(name)).ToList();
            ViewBag.keyword = name;
            return View(sp.ToPagedList(pageNum, pageSize));
        }
        public ActionResult SearchByMN(int? page,int name)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            var listsp = (from s in db.CVs
                          where s.PhanLoaiMN.MaPhanLoaiMN == name
                          select s).OrderByDescending(s => s.NgayDang);
            return View(listsp.ToPagedList(pageNum, pageSize));
        }

        public ActionResult About()
        {
            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }
        public ActionResult Error()
        {          
            return View();
        }
        public ActionResult IndexUsAccept(int? page )
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
                return null;
            User us = Session["TaiKhoan"] as User;
            var listsp = (from s in db.NopCVs
                         where s.MaUser == us.MaUser
                         select s).OrderByDescending(s => s.MaNop);
            return PartialView(listsp.ToPagedList(pageNum, pageSize));
        }
        public ActionResult DetailsNopCv(int id,Profile profile)
        {
            NopCV nopcv = db.NopCVs.FirstOrDefault(s => s.MaNop == id);
            return View(nopcv);
        }
        public ActionResult DeleteNopCv(int id)
        {
            NopCV nopcv = db.NopCVs.Where(s => s.MaNop == id).FirstOrDefault();
            return View(nopcv);
        }
        [HttpPost]
        public ActionResult DeleteNopCv(NopCV nopcv, int id)
        {
            NopCV nop = db.NopCVs.Single(s => s.MaNop == id);
            db.NopCVs.Remove(nop);
            db.SaveChanges();
            return RedirectToAction("IndexUsAccept");
        }
        public ActionResult test(string diachi , string luong, int? page , string searchString, int categoryID = 0)
        {
            diachi = null;luong = null;searchString = null;
            int pageSize = 9;
            int pageNum = (page ?? 1);
            //1. Tạo danh sách danh mục để hiển thị ở giao diện View thông qua DropDownList
            var categories = from c in db.PhanLoaiMNs select c;
            ViewBag.categoryID = new SelectList(categories, "MaPhanLoaiMN", "TenPhanLoaiMN"); // danh sách Category

            //2. Tạo câu truy vấn kết 2 bảng Link, Category bằng mệnh đề join
            var links = from l in db.CVs
                        join c in db.PhanLoaiMNs on l.PhanLoaiMN.MaPhanLoaiMN equals c.MaPhanLoaiMN
                        select new { l.MaDoiTac, l.TenCty, l.DiaChi, l.CongViec, l.Luong, c.MaPhanLoaiMN,c.TenPhanLoaiMN ,l.NgayDang,l.Logo };

            //3. Tìm kiếm chuỗi truy vấn
            if (!String.IsNullOrEmpty(searchString))
            {
                links = links.Where(s => s.CongViec.Contains(searchString));
            }
            if (!String.IsNullOrEmpty(luong))
            {
                links = links.Where(s => s.Luong.Contains(luong));
            }
            if (!String.IsNullOrEmpty(diachi))
            {
                links = links.Where(s => s.DiaChi.Contains(diachi));
            }
            //4. Tìm kiếm theo CategoryID
            if (categoryID != 0)
            {
                links = links.Where(x => x.MaPhanLoaiMN == categoryID);
            }
            
            //5. Chuyển đổi kết quả từ var sang danh sách List<Link>
            List<CV> listLinks = new List<CV>();
            foreach (var item in links)
            {
                CV temp = new CV();
                temp.MaPhanLoai = item.MaPhanLoaiMN;
                //temp.PhanLoaiMN.TenPhanLoaiMN = item.TenPhanLoaiMN;
                temp.TenCty = item.TenCty;
                temp.MaDoiTac = item.MaDoiTac;
                temp.Luong = item.Luong;
                temp.CongViec = item.CongViec;
                temp.DiaChi = item.DiaChi;
                temp.Logo=item.Logo;
                listLinks.Add(temp);
            }

            return View(listLinks.ToPagedList(pageNum, pageSize));
        }
        
    }

}