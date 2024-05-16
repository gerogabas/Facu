import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'
import { Apellido, Nombre } from './persona'
import { Lista } from './lista'
import { Comercio } from './comercio'

function App() {
  const [count, setCount] = useState(0)
  const frutas = ['naranja', 'banan', 'manzan', 'pera']

  return (
    <>
      <p>Hola, <Nombre/> <Apellido/></p>

      <h1>Lista compras</h1>
      <Lista comprar={frutas} fecha='2023-09-20'/>
      
      <Comercio nombre='nom' dir='alem 280' tel='1223334444' />


      <button onClick={() => setCount((count) => count + 1)}>
        count is {count}
      </button>
      <div>
        <a href="https://vitejs.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
    </>
  )
}

export default App
