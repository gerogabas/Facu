export function Comercio(props){
    const { nombre, dir, tel} = props;

    return(
        <div>
            <b>{nombre} - {dir} - {tel}</b>
        </div>
    )
}