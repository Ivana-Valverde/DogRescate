using System;
using System.Collections.Generic;
using System.Linq;

[Serializable]
public class Perro
{
    public int Id { get; set; }
    public string Nombre { get; set; }
    public string Edad { get; set; }
    public string Tamano { get; set; }
    public string Genero { get; set; }
    public string Raza { get; set; }
    public string Descripcion { get; set; }
    public string Foto { get; set; }
    public bool Urgente { get; set; }
}

public static class CatalogoPerros
{
    private static readonly object _lock = new object();

    private static readonly List<Perro> Lista = new List<Perro>
    {
        new Perro { Id = 1, Nombre = "Luna",  Edad = "5 años", Tamano = "Mediano", Foto = "img/perro policia.jpg", Descripcion = "Cariñosa y tranquila. Es una compañera ideal para familias." },
        new Perro { Id = 2, Nombre = "Rocco", Edad = "2 años", Tamano = "Pequeño", Foto = "img/solicitud.jpg",     Descripcion = "Juguetón y sociable. Es un compañero ideal para familias activas." },
        new Perro { Id = 3, Nombre = "Nela",  Edad = "4 años", Tamano = "Grande",  Foto = "img/perro golden.jpg",  Descripcion = "Inteligente y tranquila. Necesita un hogar sin gatos.", Urgente = true }
    };

    public static List<Perro> Todos()
    {
        lock (_lock) { return Lista.ToList(); }
    }

    public static Perro Buscar(int id)
    {
        lock (_lock) { return Lista.FirstOrDefault(p => p.Id == id); }
    }

    public static void Agregar(Perro perro)
    {
        lock (_lock)
        {
            perro.Id = Lista.Count == 0 ? 1 : Lista.Max(p => p.Id) + 1;
            Lista.Add(perro);
        }
    }
}

[Serializable]
public class Solicitud
{
    public string Id { get; set; }
    public int PerroId { get; set; }
    public string Mascota { get; set; }
    public DateTime Fecha { get; set; }
    public string Vivienda { get; set; }
    public string OtrasMascotas { get; set; }
    public string Motivo { get; set; }
}