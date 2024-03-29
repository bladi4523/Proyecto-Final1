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
    
    public partial class empleados
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public empleados()
        {
            this.licencias = new HashSet<licencias>();
            this.permisos = new HashSet<permisos>();
            this.vacaciones = new HashSet<vacaciones>();
            this.Salida_Empleados = new HashSet<Salida_Empleados>();
        }
    
        public int Id_Em { get; set; }
        public string Codigo_emp { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Telefono { get; set; }
        public int Id_Dep { get; set; }
        public int Id_car { get; set; }
        public Nullable<System.DateTime> Fecha_Ingreso { get; set; }
        public Nullable<int> Salario { get; set; }
        public string Estatus { get; set; }
    
        public virtual cargos cargos { get; set; }
        public virtual cargos cargos1 { get; set; }
        public virtual cargos cargos2 { get; set; }
        public virtual departamentos departamentos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<licencias> licencias { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<permisos> permisos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<vacaciones> vacaciones { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Salida_Empleados> Salida_Empleados { get; set; }
    }
}
