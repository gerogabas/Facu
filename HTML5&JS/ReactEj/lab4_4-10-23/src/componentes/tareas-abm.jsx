import { useState } from "react";
import TareasForm from "./tareas-form";
import TareasLista from "./tareas-lista";

export default function TareasAbm() {

    const [formVisible, setFormVisible] = useState(false);
    const [tareas, setTareas] = useState([
        {id:1, descripcion: 'tarea 1', terminado: false},
        {id:2, descripcion: 'tarea 2', terminado: true},
        {id:3, descripcion: 'tarea 3', terminado: true}
    ])

    function mostrarForm() {
        setFormVisible(true)
    }
    function ocultarForm() {
        setFormVisible(false)
    }
    function borrarTarea(elem){
        let nuevoArray = tareas.filter(t => t.id != elem);
        setTareas(nuevoArray);
    }
    function editarTarea(elem){
        alert('pto')
    }
    function agregarTarea(txt,booleano){
        console.log(txt+booleano)
        let array = tareas;
        array.push(elem);
        setTareas(array);
    }
    return (
        <>
            <h2>ABM de tareas</h2>
            <TareasLista datos={tareas} borrar={borrarTarea} editar={editarTarea} agregar={agregarTarea}/>

            <div>
                <button className="btn btn-primary" onClick={mostrarForm}>Agregar</button>
            </div>

            {formVisible ? <TareasForm ocultar={ocultarForm} /> : null}
        </>
    )
}