import morgan from 'morgan';
import { config } from './env';

export const requestLogger = morgan(config.logLevel);
