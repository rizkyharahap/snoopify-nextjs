import React, { useEffect, useState } from "react";

const Newcomponent = () => {
  const [first, setFirst] = useState(false);

  useEffect(() => {
    console.log(first);

    return () => {
      setFirst(false);
    };
  }, []);

  return <div>Newcomponent</div>;
};

export default Newcomponent;
