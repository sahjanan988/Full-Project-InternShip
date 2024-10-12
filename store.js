import React, { createContext, useContext, useState } from 'react';
const CounterContext = createContext();

function CounterProvider({ children }) {
  const [count, setCount] = useState(0);

  return (
    <CounterContext.Provider value={{ count, setCount }}>
      {children}
    </CounterContext.Provider> 

  );
}

function Counter() {
  const { count, setCount } = useContext(CounterContext);

  return (
    <div> 

      Count: {count}
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
}