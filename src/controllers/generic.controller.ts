import type { Request, Response } from 'express';

import ServiceFactory from '../factories/service.factory';
import { catchAsync } from '../utils/catchAsync';

const genericService = ServiceFactory.getGenericService();

export const getGenerics = catchAsync(async (req: Request, res: Response) => {
  const { page, limit } = req.query;

  const p = page || 1;
  const l = limit || 1;
  const generics = await genericService.getAll(+p, +l);
  res.success(generics, 'Generics fetched successfully');
});
