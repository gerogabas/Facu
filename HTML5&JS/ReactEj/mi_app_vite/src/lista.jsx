export function Lista(objeto) {
    const frutas = objeto.comprar;
    console.log('Lista:')
    console.log(frutas)
    return(
        <>
            <table border='1'>                        
                {frutas.length > 0 
                ?
                    frutas.map((item,i)=> <tr key={i}> <td>{item}</td></tr>)
                :
                    'no hay valores'
                }
            </table>
        </>
    )
}
// AGREGAR key, con tr valor unico paratrada elemento. De esta manera se optimiza luego el intercambio por cosas modificadas

//{frutas.map((item,i) => <tr key={i}> <td>{item}</td></tr>)}