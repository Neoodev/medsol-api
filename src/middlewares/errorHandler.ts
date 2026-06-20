import type { NextFunction, Request, Response } from 'express';

import { config } from '../config/env';
import { ApiError } from '../utils/ApiError';
import type { ApiResponse } from '@/types/api-response';

export const errorHandler = (
  err: ApiError | Error,
  _req: Request,
  res: Response,
  _next: NextFunction,
): void => {
  let statusCode = 500;
  let message = 'Internal Server Error';

  if (err instanceof ApiError) {
    statusCode = err.statusCode;
    message = err.message;
  }

  const body: ApiResponse<null> & { stack?: string } = {
    success: false,
    message,
    data: null,
    ...(config.env === 'development' && { stack: err.stack }),
  };

  res.status(statusCode).json(body);
};

export const notFoundHandler = (req: Request, res: Response): void => {
  const body: ApiResponse<null> = {
    success: false,
    message: `Route ${req.originalUrl} not found`,
    data: null,
  };
  res.status(404).json(body);
};
