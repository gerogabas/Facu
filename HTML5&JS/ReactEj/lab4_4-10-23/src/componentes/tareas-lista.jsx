export default function TareasLista(props) {
    return (
        <>
            <table className="table table-striped">
                <thead>
                    <tr>
                        <th>Descripcion</th>
                        <th>Terminada</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    {
                        props.datos.map((dato) => (
                            <tr key={dato.id}>
                                <td>{dato.descripcion}</td>
                                <td>{dato.terminado?'Si':'No'}</td>
                                <td>
                                    <button className="btn btn-warning" onClick={()=>props.editar(dato.id)}>Editar</button>
                                    <button className="btn btn-danger" onClick={()=>props.borrar(dato.id)}>Borrar</button>
                                </td>
                            </tr>
                            )
                        )
                    }
                </tbody>
            </table>
        </>
    )
}

/*<tbody>
                    <tr>
                        <td>Tarea 1</td>
                        <td>No</td>
                        <td>
                            <button className="btn btn-warning">Editar</button>
                            <button className="btn btn-danger">Borrar</button>
                        </td>
                    </tr>
                </tbody>*/