import app from "./app";
import { config } from "./config/env";

const s: any = "s";

console.log(s);
app.listen(config.port, () => {
  console.log(
    `🚀 Server running on http://localhost:${config.port} [${config.env}]`
  );
});
