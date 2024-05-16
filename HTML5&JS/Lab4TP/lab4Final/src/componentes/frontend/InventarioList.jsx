import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';

const InventarioList = () => {
  const [laptops, setLaptops] = useState([]);

  useEffect(() => {
    axios.get('http://localhost:5432/laptops')
      .then(response => setLaptops(response.data))
      .catch(error => console.error('Error fetching data:', error));
  }, []);

  return (
    <div>
      <h2>Inventario de Laptops</h2>
      <ul>
        {laptops.map(laptop => (
          <li key={laptop.id}>
            <Link to={`/laptop/${laptop.id}`}>{laptop.marca} - {laptop.modelo}</Link>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default InventarioList;

