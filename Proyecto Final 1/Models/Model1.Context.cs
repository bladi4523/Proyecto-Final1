﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Proyecto_Final_1.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class FinalEntities2 : DbContext
    {
        public FinalEntities2()
            : base("name=FinalEntities2")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<cargos> cargos { get; set; }
        public virtual DbSet<departamentos> departamentos { get; set; }
        public virtual DbSet<empleados> empleados { get; set; }
        public virtual DbSet<licencias> licencias { get; set; }
        public virtual DbSet<nomina> nomina { get; set; }
        public virtual DbSet<permisos> permisos { get; set; }
        public virtual DbSet<Salida_Empleados> Salida_Empleados { get; set; }
        public virtual DbSet<vacaciones> vacaciones { get; set; }
    
        public virtual int Calcular_Nomina()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("Calcular_Nomina");
        }
    }
}
