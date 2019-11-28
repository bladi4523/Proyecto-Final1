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
    public class empleadosController : Controller
    {
        private FinalEntities2 db = new FinalEntities2();

        // GET: empleados
        //public ActionResult Index()
        //{
        //    var empleados = db.empleados.Include(e => e.cargos).Include(e => e.cargos1).Include(e => e.cargos2).Include(e => e.departamentos);
        //    return View(empleados.ToList());
        //}
        public ActionResult Index(string SearchString)
        {
            if (SearchString == null)
            {
                var empleados = db.empleados.Include(e => e.cargos).Include(e => e.cargos1).Include(e => e.cargos2).Include(e => e.departamentos);
                return View(empleados.ToList());
            }
            var resultado = db.empleados.Where(x => x.Nombre.Contains(SearchString) || x.departamentos.Nombre.Contains(SearchString) && x.Estatus == "Activo");
            return View(resultado.ToList());
        }
        public ActionResult EntradaEmpleado(string SearchString)
        {
            if (string.IsNullOrEmpty(SearchString))
            {
                var empleados = db.empleados.Include(e => e.cargos).Include(e => e.cargos1).Include(e => e.cargos2).Include(e => e.departamentos);
                return View(empleados.ToList());
            }
            var resultado = db.empleados.Where(x => x.Fecha_Ingreso.Value.Month.ToString() == SearchString);
            return View(resultado.ToList());
        }
        // GET: empleados/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            empleados empleados = db.empleados.Find(id);
            if (empleados == null)
            {
                return HttpNotFound();
            }
            return View(empleados);
        }

        // GET: empleados/Create
        public ActionResult Create()
        {
            ViewBag.Id_car = new SelectList(db.cargos, "Id_car", "CargosN");
            ViewBag.Id_car = new SelectList(db.cargos, "Id_car", "CargosN");
            ViewBag.Id_car = new SelectList(db.cargos, "Id_car", "CargosN");
            ViewBag.Id_Dep = new SelectList(db.departamentos, "Id_Dep", "Nombre");
            return View();
        }

        // POST: empleados/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_Em,Codigo_emp,Nombre,Apellido,Telefono,Id_Dep,Id_car,Fecha_Ingreso,Salario,Estatus")] empleados empleados)
        {
            if (ModelState.IsValid)
            {
                db.empleados.Add(empleados);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Id_car = new SelectList(db.cargos, "Id_car", "CargosN", empleados.Id_car);
            ViewBag.Id_car = new SelectList(db.cargos, "Id_car", "CargosN", empleados.Id_car);
            ViewBag.Id_car = new SelectList(db.cargos, "Id_car", "CargosN", empleados.Id_car);
            ViewBag.Id_Dep = new SelectList(db.departamentos, "Id_Dep", "Nombre", empleados.Id_Dep);
            return View(empleados);
        }

        // GET: empleados/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            empleados empleados = db.empleados.Find(id);
            if (empleados == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id_car = new SelectList(db.cargos, "Id_car", "CargosN", empleados.Id_car);
            ViewBag.Id_car = new SelectList(db.cargos, "Id_car", "CargosN", empleados.Id_car);
            ViewBag.Id_car = new SelectList(db.cargos, "Id_car", "CargosN", empleados.Id_car);
            ViewBag.Id_Dep = new SelectList(db.departamentos, "Id_Dep", "Nombre", empleados.Id_Dep);
            return View(empleados);
        }

        // POST: empleados/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_Em,Codigo_emp,Nombre,Apellido,Telefono,Id_Dep,Id_car,Fecha_Ingreso,Salario,Estatus")] empleados empleados)
        {
            if (ModelState.IsValid)
            {
                db.Entry(empleados).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id_car = new SelectList(db.cargos, "Id_car", "CargosN", empleados.Id_car);
            ViewBag.Id_car = new SelectList(db.cargos, "Id_car", "CargosN", empleados.Id_car);
            ViewBag.Id_car = new SelectList(db.cargos, "Id_car", "CargosN", empleados.Id_car);
            ViewBag.Id_Dep = new SelectList(db.departamentos, "Id_Dep", "Nombre", empleados.Id_Dep);
            return View(empleados);
        }

        // GET: empleados/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            empleados empleados = db.empleados.Find(id);
            if (empleados == null)
            {
                return HttpNotFound();
            }
            return View(empleados);
        }

        // POST: empleados/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            empleados empleados = db.empleados.Find(id);
            db.empleados.Remove(empleados);
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
