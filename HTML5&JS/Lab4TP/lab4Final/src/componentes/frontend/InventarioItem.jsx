import React, { useState, useEffect } from 'react';
import axios from 'axios';

const InventarioItem = ({ match }) => {
  const [laptop, setLaptop] = useState({});

  useEffect(() => {
    const laptopId = match.params.id;

    axios.get(`http://localhost:5432/laptops/${laptopId}`)
      .then(response => setLaptop(response.data))
      .catch(error => console.error('Error fetching data:', error));
  }, [match.params.id]);

  return (
    <div>
      <h2>Detalles de la Laptop</h2>
      <p>Marca: {laptop.marca}</p>
      <p>Modelo: {laptop.modelo}</p>
      <p>RAM: {laptop.ram_gb} GB</p>
      <p>Disco Rígido: {laptop.disco_marca} - {laptop.disco_tipo} - {laptop.disco_tamano}</p>
      <p>Placa de Video: {laptop.placa_video}</p>
      <p>Precio: ${laptop.precio}</p>
    </div>
  );
};

export default InventarioItem;
