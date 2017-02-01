﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Catastro_Catalogo_Municipios
    {
        public int id_Catalogo_Municipio { get; set; }
        public string nombre_Municipio { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Catastro_Catalogo_Operaciones
    {
        public int id_Catalogo_Tipo_Operacion { get; set; }
        public int id_Catalogo_Tipo_Manifiesto { get; set; }
        public string nombre_Operacion { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Catastro_Catalogo_Poblaciones
    {
        public int id_Catalogo_Poblacion { get; set; }
        public int id_Catalogo_Municipio { get; set; }
        public int id_Catalogo_Oficina { get; set; }
        public string nombre_Poblacion { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Catastro_Catalogo_Tipos_Terrenos
    {
        public int id_Catalogo_Tipo_Terreno { get; set; }
        public string nombre_Tipo_Terreno { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Catastro_Catalogo_Usos_Terrenos_Urbanos
    {
        public int id_Catalogo_Uso_Terreno_Urbano { get; set; }
        public string nombre_Uso_Terreno_Urbano { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Catastro_Fichas
    {
        public int id_Ficha { get; set; }
        public int id_Solicitud_Notaria { get; set; }
        public int id_Predio { get; set; }
        public System.DateTime fecha_Movimiento { get; set; }
        public string clave_Catastral { get; set; }
        public int estatus { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Catastro_Fichas_Construcciones
    {
        public int id_Ficha_Construccion { get; set; }
        public int id_Ficha { get; set; }
        public int id_Predio { get; set; }
        public int id_Catalogo_Tipologia_Constructiva { get; set; }
        public decimal superficie_Construccion { get; set; }
        public System.DateTime fecha_Construccion { get; set; }
        public int edad { get; set; }
        public string factor_Edad { get; set; }
        public int niveles { get; set; }
        public string factor_Niveles { get; set; }
        public decimal valor_Unitario { get; set; }
        public decimal valor_Construccion { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Catastro_Fichas_Demeritos
    {
        public int id_Ficha_Demerito { get; set; }
        public int id_Ficha { get; set; }
        public int id_Predio { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Catastro_Fichas_Domicilios_Notificaciones
    {
        public int id_Ficha_Domicilio_Notificacion { get; set; }
        public int id_Ficha { get; set; }
        public int id_Catalogo_Colonia { get; set; }
        public int id_Catalogo_Calle { get; set; }
        public string numero_Oficial { get; set; }
        public string referencia { get; set; }
        public string telefono { get; set; }
        public string correo { get; set; }
        public string poblacion { get; set; }
        public string estado { get; set; }
        public string codigo_postal { get; set; }
        public string rfc { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Catastro_Fichas_Generales
    {
        public int id_Ficha_General { get; set; }
        public int id_Ficha { get; set; }
        public int id_Predio { get; set; }
        public int id_Catalogo_Colonia { get; set; }
        public int id_Catalogo_Calle { get; set; }
        public int id_Catalogo_Poblacion { get; set; }
        public int id_Catalogo_Municipio { get; set; }
        public int id_Catalogo_Codigo_Postal { get; set; }
        public int id_Catalogo_Notaria { get; set; }
        public int id_Catalogo_Tasa_Impuesto_Predial { get; set; }
        public string clave_Catastral { get; set; }
        public string codigo_Postal { get; set; }
        public string numero_Ubicacion_Predio { get; set; }
        public string domicilio_Fiscal { get; set; }
        public decimal cuota_Fija { get; set; }
        public System.DateTime fecha_Vigencia { get; set; }
        public System.DateTime fecha_Baldio { get; set; }
        public string rpp { get; set; }
        public System.DateTime fecha_RPP { get; set; }
        public string escritura { get; set; }
        public System.DateTime fecha_Escritura { get; set; }
        public string volumen { get; set; }
        public string numero_Medidor { get; set; }
        public string numero_Manzana { get; set; }
        public int numero_lote { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Catastro_Fichas_Propietarios
    {
        public int id_Ficha_Propietario { get; set; }
        public int id_Ficha { get; set; }
        public int id_Catalogo_Propietario { get; set; }
        public int id_Catalogo_Tipo_Propietario { get; set; }
        public decimal porcentaje { get; set; }
        public string curp { get; set; }
        public string rfc { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Catastro_Fichas_Terrenos
    {
        public int id_Ficha_Terreno_Urbano { get; set; }
        public int id_Ficha { get; set; }
        public int id_Predio { get; set; }
        public int id_Catalogo_Uso_Terreno_Rural { get; set; }
        public int id_Catalogo_Giro_Terreno { get; set; }
        public int id_Catalogo_Zona_Homogenea { get; set; }
        public int id_Catalogo_Bandas_Valor { get; set; }
        public decimal superficie_Legal { get; set; }
        public decimal superficie_Cartografica { get; set; }
        public decimal superficie_Grafica { get; set; }
        public decimal longitud_Frente { get; set; }
        public string fondo_Terreno { get; set; }
        public string irregularidad_Terreno { get; set; }
        public decimal valor_Unitario { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Catastro_Solicitudes_Domicilio_Notificacion
    {
        public int id_Solicitud_Domicilio_Notificacion { get; set; }
        public int id_Solicitud_Notaria { get; set; }
        public string calle { get; set; }
        public string numero_Oficial { get; set; }
        public string colonia { get; set; }
        public string poblacion { get; set; }
        public string codigo_Postal { get; set; }
        public string estado { get; set; }
        public string rfc { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Catastro_Solicitudes_Notarias
    {
        public int id_Solicitud_Notaria { get; set; }
        public int id_Catalogo_Notaria { get; set; }
        public int id_Estatus_Solicitud { get; set; }
        public int id_Catalogo_Usuario_Notaria { get; set; }
        public int id_Catalogo_Tipo_Manifiesto { get; set; }
        public int id_Catalogo_Tipo_Operacion { get; set; }
        public int folio_Solicitud_Notaria { get; set; }
        public Nullable<System.DateTime> fecha_solicitud { get; set; }
        public string oficina_Ubicacion { get; set; }
        public string codigo_Postal { get; set; }
        public string clave_Catastral_Vendedor { get; set; }
        public string curp_Vendedor { get; set; }
        public string clave_Catastral_Comprador { get; set; }
        public string curp_Comprador { get; set; }
        public string numero_Autorizacion { get; set; }
        public string tipo_Documento { get; set; }
        public string numero { get; set; }
        public string volumen { get; set; }
        public Nullable<System.DateTime> fecha_Documento { get; set; }
        public Nullable<decimal> precio_Pactado { get; set; }
        public Nullable<decimal> avaluo_Comercial { get; set; }
        public Nullable<decimal> valor_Base_Impuesto { get; set; }
        public Nullable<decimal> deduccion { get; set; }
        public Nullable<decimal> base_gravable { get; set; }
        public Nullable<decimal> impuesto_base { get; set; }
        public Nullable<decimal> importe { get; set; }
        public Nullable<decimal> recargos { get; set; }
        public string poblacion { get; set; }
        public Nullable<System.DateTime> fecha { get; set; }
        public Nullable<decimal> total { get; set; }
        public bool cancelado { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Catastro_Solicitudes_Predios
    {
        public int id_Solicitud_Predio { get; set; }
        public int id_Solicitud_Notaria { get; set; }
        public int id_Catalogo_Tipo_Terreno { get; set; }
        public int id_Catalogo_Uso_Terreno { get; set; }
        public int id_Catalogo_Tipo_Operacion { get; set; }
        public int tipo_Origen_Destino { get; set; }
        public string clave_Catastral_Predio { get; set; }
        public string municipio { get; set; }
        public string poblacion { get; set; }
        public string calle { get; set; }
        public string numero_Oficial { get; set; }
        public string colonia { get; set; }
        public string codigo_Postal { get; set; }
        public string numero_Lote { get; set; }
        public string numero_Manzana { get; set; }
        public Nullable<decimal> superficie_Terreno { get; set; }
        public string otro_Uso_Terreno { get; set; }
        public Nullable<decimal> valor_Catastral { get; set; }
        public string nombre_predio { get; set; }
        public string poblacion_cercana { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Catastro_Solicitudes_Propietarios
    {
        public int id_Solicitud_Propietario { get; set; }
        public int id_Solicitud_Notaria { get; set; }
        public int id_Tipo_Propietario { get; set; }
        public string nombre_Razon_Social { get; set; }
        public string curp { get; set; }
        public Nullable<decimal> porcentaje { get; set; }
        public int tipo_Propietario_Transmite_Adquiere { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Catastro_Solicitudes_Uso_Terreno_Rural
    {
        public int id_Solicitud_Uso_Terreno_Rural { get; set; }
        public int id_Solicitud_Notaria { get; set; }
        public int id_Catalogo_Clase_Terreno_Rural { get; set; }
        public Nullable<decimal> superficie_Hectareas { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class tb_Generales_Accesos
    {
        public int id_General_Acceso { get; set; }
        public string funcion { get; set; }
        public string orden { get; set; }
        public string nombre_acceso { get; set; }
        public string imagen_acceso { get; set; }
        public string url { get; set; }
        public string nombre_sistema { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class tb_Generales_Accesos_Usuarios
    {
        public int id_General_Acceso_Usuario { get; set; }
        public int id_General_Usuario { get; set; }
        public int id_General_Acceso { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class tb_Generales_Usuarios
    {
        public int id_General_Usuario { get; set; }
        public string nombre { get; set; }
        public int estatus { get; set; }
        public string correo { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class tb_Generales_Usuarios_Contraseñas
    {
        public int id_General_Usuario_Contraseña { get; set; }
        public int id_General_Usuario { get; set; }
        public string password { get; set; }
        public string GUID { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    
    public partial class sp_Domicilio_Notificacion_Info_Predios_Notarias_Result
    {
        public string nombre_Calle { get; set; }
        public string numero_Oficial { get; set; }
        public string nombre_Colonia { get; set; }
        public string poblacion { get; set; }
        public string estado { get; set; }
        public string codigo_postal { get; set; }
        public string rfc { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    
    public partial class sp_Leer_Construcciones_Result
    {
        public System.DateTime fecha_Construccion { get; set; }
        public int edad { get; set; }
        public string factor_Edad { get; set; }
        public int niveles { get; set; }
        public string factor_Niveles { get; set; }
        public string nombre_Tipologia_Constructiva { get; set; }
        public decimal valor_Unitario { get; set; }
        public decimal valor_Construccion { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    
    public partial class sp_Leer_Domicilio_Notificacion_Result
    {
        public int id_Catalogo_Calle { get; set; }
        public int id_Catalogo_Colonia { get; set; }
        public string telefono { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    
    public partial class sp_Leer_Informacion_Terreno_Result
    {
        public int id_Ficha_Terreno_Urbano { get; set; }
        public decimal superficie_Legal { get; set; }
        public decimal superficie_Cartografica { get; set; }
        public decimal longitud_Frente { get; set; }
        public string fondo_Terreno { get; set; }
        public string irregularidad_Terreno { get; set; }
        public decimal valor_Unitario { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    
    public partial class sp_Leer_Propietarios_Result
    {
        public string nombre { get; set; }
        public string rfc { get; set; }
        public string curp { get; set; }
        public string nombre_Tipo_Propietario { get; set; }
        public decimal porcentaje { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    
    public partial class sp_Leer_Ubicacion_Generales_Result
    {
        public int id_Ficha { get; set; }
        public int id_Catalogo_Calle { get; set; }
        public int id_Catalogo_Colonia { get; set; }
        public int id_Catalogo_Poblacion { get; set; }
        public int id_Catalogo_Codigo_Postal { get; set; }
        public string domicilio_Fiscal { get; set; }
        public string clave_Catastral { get; set; }
        public string nombre_Presidente { get; set; }
        public Nullable<System.DateTime> fecha_Movimiento { get; set; }
        public decimal cuota_Fija { get; set; }
        public System.DateTime fecha_Vigencia { get; set; }
        public System.DateTime fecha_Baldio { get; set; }
        public string rpp { get; set; }
        public System.DateTime fecha_RPP { get; set; }
        public string escritura { get; set; }
        public string volumen { get; set; }
        public System.DateTime fecha_Escritura { get; set; }
        public string numero_Medidor { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    
    public partial class sp_Ubicacion_Info_Predios_Notarias_Result
    {
        public Nullable<int> Ficha { get; set; }
        public string nombre_Municipio { get; set; }
        public string nombre_Poblacion { get; set; }
        public string nombre_Calle { get; set; }
        public string numero_Ubicacion_Predio { get; set; }
        public string nombre_Colonia { get; set; }
        public string numero_Manzana { get; set; }
        public int numero_lote { get; set; }
        public string volumen { get; set; }
        public string numero_Medidor { get; set; }
    }
}
