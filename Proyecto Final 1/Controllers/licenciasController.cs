using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Proyecto_Final_1.Models;

namespace Proyecto_Final_1.Controllers
{
    public class licenciasController : Controller
    {
        private FinalEntities2 db = new FinalEntities2();

        // GET: licencias
        public ActionResult Index()
        {
            var licencias = db.licencias.Include(l => l.empleados);
            return View(licencias.ToList());
        }

        // GET: licencias/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            licencias licencias = db.licencias.Find(id);
            if (licencias == null)
            {
                return HttpNotFound();
            }
            return View(licencias);
        }

        // GET: licencias/Create
        public ActionResult Create()
        {
            ViewBag.Id_Em = new SelectList(db.empleados, "Id_Em", "Codigo_emp");
            return View();
        }

        // POST: licencias/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_licen,Id_Em,FechaDesde,FechaHasta,Motivo,Comentario")] licencias licencias)
        {
            if (ModelState.IsValid)
            {
                db.licencias.Add(licencias);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Id_Em = new SelectList(db.empleados, "Id_Em", "Codigo_emp", licencias.Id_Em);
            return View(licencias);
        }

        // GET: licencias/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            licencias licencias = db.licencias.Find(id);
            if (licencias == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id_Em = new SelectList(db.empleados, "Id_Em", "Codigo_emp", licencias.Id_Em);
            return View(licencias);
        }

        // POST: licencias/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_licen,Id_Em,FechaDesde,FechaHasta,Motivo,Comentario")] licencias licencias)
        {
            if (ModelState.IsValid)
            {
                db.Entry(licencias).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id_Em = new SelectList(db.empleados, "Id_Em", "Codigo_emp", licencias.Id_Em);
            return View(licencias);
        }

        // GET: licencias/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            licencias licencias = db.licencias.Find(id);
            if (licencias == null)
            {
                return HttpNotFound();
            }
            return View(licencias);
        }

        // POST: licencias/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            licencias licencias = db.licencias.Find(id);
            db.licencias.Remove(licencias);
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
