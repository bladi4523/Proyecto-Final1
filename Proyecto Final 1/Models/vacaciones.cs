//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Proyecto_Final_1.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class vacaciones
    {
        public int Id_vac { get; set; }
        public Nullable<int> Id_Em { get; set; }
        public Nullable<System.DateTime> FechaDesde { get; set; }
        public Nullable<System.DateTime> FechaHasta { get; set; }
        public Nullable<int> año { get; set; }
        public string Comentario { get; set; }
    
        public virtual empleados empleados { get; set; }
    }
}
