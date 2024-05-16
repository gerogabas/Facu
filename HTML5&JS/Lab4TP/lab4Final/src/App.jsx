import React, { useState } from 'react';
import InventarioList from './componentes/frontend/InventarioList';
import InventarioForm from './componentes/frontend/InventarioForm';

const App = () => {
  const [inventario, setInventario] = useState([]);

  const handleAdd = (item) => {
    setInventario([...inventario, { ...item, id: Date.now() }]);
  };

  const handleDelete = (id) => {
    setInventario(inventario.filter(item => item.id !== id));
  };

  return (
    <div>
      <InventarioForm onAdd={handleAdd} />
      <InventarioList inventario={inventario} onDelete={handleDelete} />
    </div>
  );
};

export default App;
