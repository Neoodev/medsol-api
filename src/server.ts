import app from './app';
import { config } from './config/env';

const s: any = 's';

app.listen(config.port, '0.0.0.0', () => {
  console.log(`🚀 Server running on http://localhost:${config.port} [${config.env}]`);
});
