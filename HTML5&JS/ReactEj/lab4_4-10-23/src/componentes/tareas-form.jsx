export default function TareasForm(props){
    return(
        <>
            <div className="m-2">
                <label htmlFor="descripcion">Descripcion</label>
                <input type="text" id="desc"/>
            </div>

            <div className="m-2">
                <input type="checkbox" name="" id="chbox" />
                <label className="" htmlFor="terminada">Terminada?</label>
            </div>

            <div className="m-2">
                <button className="btn btn-primary" onClick={()=>props.agregar(
                        document.getElementById('desc').innerHTML, document.getElementById('chbox').innerHTML)-
                    }>Aceptar</button>
                <button className="btn btn-secondary" onClick={()=>props.ocultar()}>Cancelar</button>
            </div>
        </>
    )
}