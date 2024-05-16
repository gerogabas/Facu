import React, { useState, useEffect } from 'react';
import axios from 'axios';

const InventarioForm = () => {
  const [marca, setMarca] = useState('');
  const [modelo, setModelo] = useState('');
  const [ram, setRAM] = useState('');
  const [discoTipo, setDiscoTipo] = useState('');
  const [discoTamano, setDiscoTamano] = useState('');
  const [discoMarca, setDiscoMarca] = useState('');
  const [placaVideo, setPlacaVideo] = useState('');
  const [precio, setPrecio] = useState('');
  const [discosRigidos, setDiscosRigidos] = useState([]);

  useEffect(() => {
    // Obtener datos de discos rígidos
    axios.get('http://localhost:5432q/discos_rigidos')
      .then(response => setDiscosRigidos(response.data))
      .catch(error => console.error('Error fetching data:', error));
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      // Crear una nueva laptop
      await axios.post('http://localhost:5432/laptops', {
        marca,
        modelo,
        ram_gb: parseInt(ram),
        disco_tipo: discoTipo,
        disco_tamano: discoTamano,
        disco_marca: discoMarca,
        placa_video: placaVideo,
        precio: parseInt(precio),
      });

      // Reiniciar el formulario después de agregar
      setMarca('');
      setModelo('');
      setRAM('');
      setDiscoTipo('');
      setDiscoTamano('');
      setDiscoMarca('');
      setPlacaVideo('');
      setPrecio('');
    } catch (error) {
      console.error('Error creating laptop:', error);
    }
  };

  return (
    <div>
      <h2>Agregar Laptop</h2>
      <form onSubmit={handleSubmit}>
        <label>Marca:
          <input type="text" value={marca} onChange={(e) => setMarca(e.target.value)} />
        </label>
        <label>Modelo:
          <input type="text" value={modelo} onChange={(e) => setModelo(e.target.value)} />
        </label>
        <label>RAM (GB):
          <input type="number" value={ram} onChange={(e) => setRAM(e.target.value)} />
        </label>
        <label>Disco Tipo:
          <input type="text" value={discoTipo} onChange={(e) => setDiscoTipo(e.target.value)} />
        </label>
        <label>Disco Tamaño:
          <input type="text" value={discoTamano} onChange={(e) => setDiscoTamano(e.target.value)} />
        </label>
        <label>Disco Marca:
          <input type="text" value={discoMarca} onChange={(e) => setDiscoMarca(e.target.value)} />
        </label>
        <label>Placa de Video:
          <input type="text" value={placaVideo} onChange={(e) => setPlacaVideo(e.target.value)} />
        </label>
        <label>Precio:
          <input type="number" value={precio} onChange={(e) => setPrecio(e.target.value)} />
        </label>
        <button type="submit">Agregar</button>
      </form>
    </div>
  );
};
export default InventarioForm;

