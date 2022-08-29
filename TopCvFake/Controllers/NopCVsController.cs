using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TopCvFake.Models;

namespace TopCvFake.Controllers
{
    public class NopCVsController : Controller
    {
        private TopCVEntities db = new TopCVEntities();

        // GET: NopCVs
        public ActionResult Index()
        {
            var nopCVs = db.NopCVs.Include(n => n.CV).Include(n => n.DoiTac).Include(n => n.Profile).Include(n => n.User);
            return View(nopCVs.ToList());
        }

        // GET: NopCVs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NopCV nopCV = db.NopCVs.Find(id);
            if (nopCV == null)
            {
                return HttpNotFound();
            }
            return View(nopCV);
        }
        
        // GET: NopCVs/Create
        public ActionResult Create(int? MaBaidang ,int userid , Profile profile)
        {
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
                return null;
            User us = Session["TaiKhoan"] as User;

            var links = from l in db.Users
                        join c in db.Profiles on l.MaUser equals c.MaUser
                        //join t in db.CVs on l equals t. 
                        //group from i in db.CVs join y in db.DoiTacs on i.MaDoiTac equals y.MaDoiTac
                              select new { l.MaUser, l.HoTen, l.DiaChi, l.DienThoai, l.NgaySinh, l.Email, c.KinhNghiem, c.HocVan, c.HinhCV, c.NgonNgu }/* by db.NopCVs*/ ;

            ViewBag.MaBaiDang = new SelectList(db.CVs, "MaBaiDang"  , "TenCty" );
            ViewBag.MaDoiTac = new SelectList(db.DoiTacs, "MaDoiTac", "TenDoiTac");
            ViewBag.MaProfile = new SelectList(db.Profiles, "MaProfile", "ChucVuUngTuyen");
            ViewBag.MaUser = new SelectList(db.Users, "MaUser", "HoTen");
            ViewBag.DienThoai = new SelectList(db.Users, "MaUser", "Dienthoai");
            ViewBag.DiaChi = new SelectList(db.Users, "MaUser", "DiaChi");
            ViewBag.NgaySinh = new SelectList(db.Users, "MaUser", "NgaySinh");
            ViewBag.Email = new SelectList(db.Users, "MaUser", "Email");
            ViewBag.TenCty = new SelectList(db.CVs, "MaBaiDang", "TenCty");
            ViewBag.CongViec = new SelectList(db.CVs, "MaBaiDang", "CongViec");
            ViewBag.KinhNghiem = new SelectList(db.Profiles, "MaProfile", "KinhNghiem");
            //ViewBag.HinhCV =  new SelectList(db.Profiles, "MaUser", "HinhCV");
            //db.Profiles.Select(db.Profiles,"MaUser", "HinhCV");
            ViewBag.HinhCV = from p in db.Profiles where p.MaProfile == profile.MaProfile select p.HinhCV;
            ViewBag.HocVan = new SelectList(db.Profiles, "MaProfile", "HocVan");
            ViewBag.DiaChiCty = new SelectList(db.DoiTacs, "MaDoiTac", "DiaChi");
            return View() ;
        }
        // POST: NopCVs/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaNop,MaDoiTac,MaUser,MaBaiDang,MaProfile,ThuGioiThieu")] NopCV nopCV, int userid)
        {
            if (ModelState.IsValid)
            {
                nopCV.MaUser = userid;
                db.NopCVs.Add(nopCV);
                db.SaveChanges();
                return RedirectToAction("IndexUsAccept", "User" );
            }
            ViewBag.MaBaiDang = new SelectList(db.CVs, "MaBaiDang", "TenCty");
            ViewBag.MaDoiTac = new SelectList(db.DoiTacs, "MaDoiTac", "TenDoiTac");
            ViewBag.MaProfile = new SelectList(db.Profiles, "MaProfile", "ChucVuUngTuyen");
            ViewBag.MaUser = new SelectList(db.Users, "MaUser", "HoTen");
            return View(nopCV);
        }

        // GET: NopCVs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NopCV nopCV = db.NopCVs.Find(id);
            if (nopCV == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaBaiDang = new SelectList(db.CVs, "MaBaiDang", "TenCty", nopCV.MaBaiDang);
            ViewBag.MaDoiTac = new SelectList(db.DoiTacs, "MaDoiTac", "TenDoiTac", nopCV.MaDoiTac);
            ViewBag.MaProfile = new SelectList(db.Profiles, "MaProfile", "ChucVuUngTuyen", nopCV.MaProfile);
            ViewBag.MaUser = new SelectList(db.Users, "MaUser", "HoTen", nopCV.MaUser);
            return View(nopCV);
        }

        // POST: NopCVs/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaNop,MaDoiTac,MaUser,MaBaiDang,MaProfile,ThuGioiThieu")] NopCV nopCV)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nopCV).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaBaiDang = new SelectList(db.CVs, "MaBaiDang", "TenCty", nopCV.MaBaiDang);
            ViewBag.MaDoiTac = new SelectList(db.DoiTacs, "MaDoiTac", "TenDoiTac", nopCV.MaDoiTac);
            ViewBag.MaProfile = new SelectList(db.Profiles, "MaProfile", "ChucVuUngTuyen", nopCV.MaProfile);
            ViewBag.MaUser = new SelectList(db.Users, "MaUser", "HoTen", nopCV.MaUser);
            return View(nopCV);
        }

        // GET: NopCVs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NopCV nopCV = db.NopCVs.Find(id);
            if (nopCV == null)
            {
                return HttpNotFound();
            }
            return View(nopCV);
        }

        // POST: NopCVs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NopCV nopCV = db.NopCVs.Find(id);
            db.NopCVs.Remove(nopCV);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
