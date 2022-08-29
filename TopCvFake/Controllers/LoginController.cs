using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using TopCvFake.Models;

namespace TopCvFake.Controllers
{
    public class LoginController : Controller
    {
        private  TopCVEntities db = new TopCVEntities();
        // GET: Login
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(FormCollection collection)
        {
            var taikhoan = collection["TaiKhoan"];
            var matkhau = collection["MatKhau"];
            User us = db.Users.SingleOrDefault(s => s.Email == taikhoan && s.MatKhau == matkhau);
            DoiTac dt = db.DoiTacs.SingleOrDefault(q => q.Email == taikhoan && q.MatKhau == matkhau);
            if (String.IsNullOrEmpty(taikhoan))
            {
                @ViewData["Loi1"] = "Phải nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                @ViewData["Loi2"] = "Phải nhập mật khẩu";
            }
            else
            {
                if (dt != null)
                {
                    ViewBag.Thongbao = "Đã đăng nhập thành công";
                    Session["TaiKhoan"] = dt;
                    
                    return RedirectToAction("Index", "Home");
                }
                else
                if (us != null)

                {
                    Session["MaUser"] = us;
                    ViewBag.Thongbao = "Đã đăng nhập thành công";
                    Session["TaiKhoan"] = us;
                    return RedirectToAction("Index", "User");
                }
                else
                {
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
                    return RedirectToAction("Index", "Login");
                }
            }
            return this.Index();
        }
        [HttpGet]
        public ActionResult RegisterUs()
        {
            return View();
        }
        [HttpPost]
        public ActionResult RegisterUs(User user, FormCollection collectionn)
        {
                var hoten = collectionn["HoTen"];
                var matkhau = collectionn["MatKhau"];
                var email = collectionn["Email"];
                var diachi = collectionn["DiaChi"];
                var dienthoai = collectionn["DienThoai"];
                var ngaysinh = String.Format("{0:MM/dd/yyyy}", collectionn["NgaySinh"]);
                if (String.IsNullOrEmpty(hoten))
                {
                    ViewData["Loi1"] = "Phải nhập đầy đủ";
                }
                else if (String.IsNullOrEmpty(matkhau))
                {
                    ViewData["Loi3"] = "Phải nhập đầy đủ";
                }
                else if (String.IsNullOrEmpty(email))
                {
                    ViewData["Loi4"] = "Phải nhập đầy đủ";
                }
                else if (String.IsNullOrEmpty(diachi))
                {
                    ViewData["Loi5"] = "Phải nhập đầy đủ";
                }
                else if (String.IsNullOrEmpty(dienthoai))
                {
                    ViewData["Loi6"] = "Phải nhập đầy đủ";
                }
                else if (String.IsNullOrEmpty(ngaysinh))
                {
                    ViewData["Loi7"] = "Phải nhập đầy đủ";
                }
                else
                {
                    user.HoTen = hoten;
                    user.DienThoai = Convert.ToInt32(dienthoai);
                    user.DiaChi = diachi;
                    user.Email = email;
                    user.MatKhau = matkhau;
                    user.NgaySinh = DateTime.Parse(ngaysinh);
                    db.Users.Add(user);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                return this.RegisterUs();

        }
        [HttpGet]
        public ActionResult RegisterAd()
        {
            return View();
        }
        [HttpPost]
        public ActionResult RegisterAd(DoiTac doi, FormCollection collectionn)
        {

            var hoten = collectionn["TenDoiTac"];
            var matkhau = collectionn["MatKhau"];
            var email = collectionn["Email"];
            var diachi = collectionn["DiaChi"];
            var dienthoai = collectionn["DienThoai"];
            var gioithieu =  collectionn["GioiThieu"];
            if (String.IsNullOrEmpty(hoten))
            {
                ViewData["Loi1"] = "Phải nhập đầy đủ";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi3"] = "Phải nhập đầy đủ";
            }
            else if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi4"] = "Phải nhập đầy đủ";
            }
            else if (String.IsNullOrEmpty(diachi))
            {
                ViewData["Loi5"] = "Phải nhập đầy đủ";
            }
            else if (String.IsNullOrEmpty(dienthoai))
            {
                ViewData["Loi6"] = "Phải nhập đầy đủ";
            }
            else if (String.IsNullOrEmpty(gioithieu))
            {
                ViewData["Loi7"] = "Phải nhập đầy đủ";
            }
            else
            {
                doi.TenDoiTac = hoten;
                doi.DienThoai = Convert.ToInt32(dienthoai);
                doi.DiaChi = diachi;
                doi.Email = email;
                doi.MatKhau = matkhau;
                doi.GioiThieu = gioithieu;
                db.DoiTacs.Add(doi);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return this.RegisterAd();

        }
        public ActionResult Logout()
        {
            Session.Remove("TaiKhoan");
            return Redirect("/");
        }

    }
}