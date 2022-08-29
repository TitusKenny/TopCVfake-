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
    public class HomeController : Controller
    {
       private TopCVEntities db = new TopCVEntities();
        private List<CV> Laycv(int count)
        {
            return db.CVs.OrderByDescending(s => s.NgayDang).Take(count).ToList();
        }
        public ActionResult Index(int? page)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            var spmoi = (from l in db.CVs 
                         select l).OrderByDescending(s => s.NgayDang);
            return View(spmoi.ToPagedList(pageNum, pageSize));
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            return View();
        }
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            return View();
        }
        public ActionResult Error()
        {
            
            return View();
        }
        public ActionResult Create()
        {
            CVViewModels pModel = new CVViewModels
            {
                ListLoaiCV = db.PhanLoaiMNs.ToList()
            };
            return View(pModel);
        }
        [HttpPost]
        public ActionResult Create(CV cv, HttpPostedFileBase fileUpload)
        {
            var fileName = Path.GetFileName(fileUpload.FileName);
            var filePath = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
            fileUpload.SaveAs(filePath);
            if (!System.IO.File.Exists(filePath))
                fileUpload.SaveAs(filePath);


            CV CVM = new CV
            {
                TenCty = cv.TenCty,
                DiaChi = cv.DiaChi,
                MaPhanLoai = cv.MaPhanLoai,
                NgayDang = DateTime.Now,
                Luong = cv.Luong,
                Logo = "Content/Image/" + fileName,
                CongViec = cv.CongViec,
                MaDoiTac = cv.MaDoiTac
                
            };
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")

                return null;
            DoiTac dt = Session["TaiKhoan"] as DoiTac;
            CVM.MaDoiTac = dt.MaDoiTac ;
            db.CVs.Add(CVM);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Edit(int id)
        {
            CV cv = db.CVs.Where(s => s.MaBaiDang == id).FirstOrDefault();
            ViewBag.MaPhanLoai = new SelectList
                (db.PhanLoaiMNs.ToList().
                OrderBy(s => s.TenPhanLoaiMN), "MaPhanLoaiMN", "TenPhanLoaiMN");
            return View(cv);
        }
        [HttpPost]
        public ActionResult Edit(CV cv, HttpPostedFileBase fileUpload)
        {
            var fileName = Path.GetFileName(fileUpload.FileName);
            var filePath = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
            fileUpload.SaveAs(filePath);
            if (!System.IO.File.Exists(filePath))
                fileUpload.SaveAs(filePath);


            CV CVM = db.CVs.Where(s => s.MaBaiDang == cv.MaBaiDang).FirstOrDefault();          
            CVM.TenCty = cv.TenCty;
            CVM.DiaChi = cv.DiaChi;
            CVM.MaPhanLoai = cv.MaPhanLoai;
            CVM.NgayDang = cv.NgayDang;
            CVM.Luong = cv.Luong;
            CVM.Logo = "Content/Image/" + fileName;         
            CVM.CongViec = cv.CongViec;
            CVM.MaDoiTac = cv.MaDoiTac;
            //db.CVs.Add(CVM);
            db.SaveChanges();
            return RedirectToAction("Details",new {id= cv.MaBaiDang});
        }
        public ActionResult Delete(int id)
        {
            CV cv = db.CVs.Where(s => s.MaBaiDang == id).FirstOrDefault();
            ViewBag.MaPhanLoai = new SelectList
               (db.PhanLoaiMNs.ToList().
                OrderBy(s => s.TenPhanLoaiMN), "MaPhanLoaiMN", "TenPhanLoaiMN");
            return View(cv);
        }
        [HttpPost]
        public ActionResult Delete(CV cv ,int id)
        {
            CV cvm = db.CVs.Single(s => s.MaBaiDang == id);
            db.CVs.Remove(cvm);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Details(int id)
        {
            CV ctcv = db.CVs.FirstOrDefault(s => s.MaBaiDang == id);
            return View(ctcv);
        }
        public ActionResult DetailsCC(int id)
        {
            CV ctcv = db.CVs.FirstOrDefault(s => s.MaBaiDang == id);
            return View(ctcv);
        }

        [HttpGet]
        public ActionResult ProfileAdminView(int id, DoiTac dt)
        {
            dt = db.DoiTacs.FirstOrDefault(n => n.MaDoiTac == id);
            return PartialView(dt);
        }
        public ActionResult ProfileAdmin(int? id)
        {
            DoiTac dt = db.DoiTacs.FirstOrDefault(n => n.MaDoiTac == id);
            return View(dt);
        }
        public ActionResult EditProfileAdmin(int id)
        {
            DoiTac dt = db.DoiTacs.Where(s => s.MaDoiTac == id).FirstOrDefault();
            return View(dt);
        }
        [HttpPost]
        public ActionResult EditProfileAdmin(DoiTac dt)
        {
            DoiTac DTM = db.DoiTacs.Where(s => s.MaDoiTac == dt.MaDoiTac).FirstOrDefault();
            DTM.TenDoiTac = dt.TenDoiTac;
            DTM.DienThoai= dt.DienThoai;            
            DTM.Email = dt.Email;
            DTM.DiaChi = dt.DiaChi;
            DTM.MatKhau = dt.MatKhau;
            DTM.GioiThieu = dt.GioiThieu;
            db.SaveChanges();
            return RedirectToAction("ProfileAdmin", new {id = dt.MaDoiTac} );
        }
        public ActionResult SearchByName(int? page, string name)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            List<CV> sp = db.CVs.Where(s => s.TenCty.Contains(name) || s.CongViec.Contains(name) || s.DiaChi.Contains(name)).ToList();
            ViewBag.keyword = name;
            return View(sp.ToPagedList(pageNum, pageSize));
        }

        public ActionResult IndexAdPost(int? page)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
                return null;
            DoiTac dt = Session["TaiKhoan"] as DoiTac;
            var listsp = (from s in db.CVs
                         where s.MaDoiTac == dt.MaDoiTac 
                         select s).OrderByDescending(s => s.NgayDang);
            return PartialView(listsp.ToPagedList(pageNum, pageSize));
        }
        public ActionResult IndexAdAccept(int? page)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
                return null;
            DoiTac dt = Session["TaiKhoan"] as DoiTac;
            var listsp = (from s in db.NopCVs
                         where s.MaDoiTac == dt.MaDoiTac
                         select s).OrderByDescending(s => s.MaNop);
            return PartialView(listsp.ToPagedList(pageNum, pageSize));
        }
        public ActionResult DetailsNopCv(int id)
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
            return RedirectToAction("IndexAdAccept");
        }
        public ActionResult SearchByMN(int? page, int name)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            var listsp = (from s in db.CVs
                         where s.PhanLoaiMN.MaPhanLoaiMN == name
                         select s).OrderByDescending(s => s.NgayDang);
            return View(listsp.ToPagedList(pageNum, pageSize));
        }
        public ActionResult SearchByDC(int? page,string name)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            List<CV> sp = db.CVs.Where(s => s.DiaChi.Contains(name)).ToList();
            ViewBag.keyword = name;
            return View(sp.ToPagedList(pageNum, pageSize));
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
    }
    }