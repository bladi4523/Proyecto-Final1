﻿using System;
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
    public class nominasController : Controller
    {
        private FinalEntities2 db = new FinalEntities2();

        // GET: nominas
        public ActionResult Index(string SearchString)
        {
            var nominas = from n in db.nomina

                          select n;
            if (!String.IsNullOrEmpty(SearchString))
            {
                nominas = nominas.Where(n => n.Mes.Contains(SearchString) || n.Año.ToString() == SearchString);
            }
            return View(nominas.ToList());
        }
        public ActionResult CalcularNomina()
        {
            db.Database.ExecuteSqlCommand("exec Calcular_Nomina");
            ViewBag.mensaje = "TO' TA BIEN";
            return View("Index", db.nomina.ToList());
        }
        // GET: nominas/Details/5
        // GET: nominas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            nomina nomina = db.nomina.Find(id);
            if (nomina == null)
            {
                return HttpNotFound();
            }
            return View(nomina);
        }

        // GET: nominas/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: nominas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_Nom,Año,Mes,Monto_Total")] nomina nomina)
        {
            if (ModelState.IsValid)
            {
                db.nomina.Add(nomina);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(nomina);
        }

        // GET: nominas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            nomina nomina = db.nomina.Find(id);
            if (nomina == null)
            {
                return HttpNotFound();
            }
            return View(nomina);
        }

        // POST: nominas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_Nom,Año,Mes,Monto_Total")] nomina nomina)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nomina).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(nomina);
        }

        // GET: nominas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            nomina nomina = db.nomina.Find(id);
            if (nomina == null)
            {
                return HttpNotFound();
            }
            return View(nomina);
        }

        // POST: nominas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            nomina nomina = db.nomina.Find(id);
            db.nomina.Remove(nomina);
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
