"use client";

import { logger } from "@/libs/logger";
import React, { useEffect } from "react";

export default function ClientComponent() {
  useEffect(() => {
    logger.debug({ module: "ClientComponent" }, "Test Client Component");
  }, []);

  return <div>ClientComponent</div>;
}
