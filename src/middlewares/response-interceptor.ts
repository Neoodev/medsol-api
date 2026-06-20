import type { NextFunction, Request, Response } from 'express';
import type { ApiResponse } from '@/types/api-response';

// Augment Express's Response interface so `res.success` is typed and
// autocompletes everywhere in the app without a manual cast.
declare module 'express-serve-static-core' {
  interface Response {
    success<T>(data: T, message?: string, statusCode?: number): Response;
  }
}

/**
 * Response interceptor.
 *
 * Attaches `res.success(data, message, statusCode)` to every response,
 * guaranteeing the { success, message, data } envelope is applied
 * consistently across all controllers — without each one constructing
 * the JSON body by hand.
 *
 * Usage in a controller:
 *   res.success(user, 'User created', 201);
 */
export const responseInterceptor = (_req: Request, res: Response, next: NextFunction): void => {
  res.success = function <T>(
    this: Response,
    data: T,
    message = 'Success',
    statusCode = 200,
  ): Response {
    const body: ApiResponse<T> = {
      success: true,
      message,
      data,
    };
    return this.status(statusCode).json(body);
  };

  next();
};
