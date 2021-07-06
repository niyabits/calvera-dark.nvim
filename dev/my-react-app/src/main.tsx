import * as React from "react";
import ReactDOM from "react-dom";

type AppProps = {
  children: React.ReactNode;
};

function App(props: AppProps) {
  const [count, setCount] = React.useState(0);

  return (
    <div>
      {count}
      <button onClick={() => setCount(count + 1)}>Counter++</button>
      <div>{props.children}</div>
    </div>
  );
}

ReactDOM.render(
  <React.StrictMode>
    <App>Hi</App>
  </React.StrictMode>,
  document.getElementById("root")
);
