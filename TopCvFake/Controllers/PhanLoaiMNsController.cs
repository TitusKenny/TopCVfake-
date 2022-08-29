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
    public class PhanLoaiMNsController : Controller
    {
        private TopCVEntities db = new TopCVEntities();

        // GET: PhanLoaiMNs
        public ActionResult Index()
        {
            return View(db.PhanLoaiMNs.ToList());
        }

        // GET: PhanLoaiMNs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhanLoaiMN phanLoaiMN = db.PhanLoaiMNs.Find(id);
            if (phanLoaiMN == null)
            {
                return HttpNotFound();
            }
            return View(phanLoaiMN);
        }

        // GET: PhanLoaiMNs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PhanLoaiMNs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaPhanLoaiMN,TenPhanLoaiMN")] PhanLoaiMN phanLoaiMN)
        {
            if (ModelState.IsValid)
            {
                db.PhanLoaiMNs.Add(phanLoaiMN);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(phanLoaiMN);
        }

        // GET: PhanLoaiMNs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhanLoaiMN phanLoaiMN = db.PhanLoaiMNs.Find(id);
            if (phanLoaiMN == null)
            {
                return HttpNotFound();
            }
            return View(phanLoaiMN);
        }

        // POST: PhanLoaiMNs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaPhanLoaiMN,TenPhanLoaiMN")] PhanLoaiMN phanLoaiMN)
        {
            if (ModelState.IsValid)
            {
                db.Entry(phanLoaiMN).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(phanLoaiMN);
        }

        // GET: PhanLoaiMNs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhanLoaiMN phanLoaiMN = db.PhanLoaiMNs.Find(id);
            if (phanLoaiMN == null)
            {
                return HttpNotFound();
            }
            return View(phanLoaiMN);
        }

        // POST: PhanLoaiMNs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PhanLoaiMN phanLoaiMN = db.PhanLoaiMNs.Find(id);
            db.PhanLoaiMNs.Remove(phanLoaiMN);
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
