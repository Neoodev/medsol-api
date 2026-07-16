import type { Request, Response } from 'express';

import ServiceFactory from '../factories/service.factory';
import { catchAsync } from '../utils/catchAsync';

const genericService = ServiceFactory.getGenericService();
export const getGeneric = catchAsync(async (req: Request, res: Response) => {
  const genericId = Number(req.params.genericId);
  const generic = await genericService.getGeneric(genericId);
  res.success(generic, 'Generic fetched successfully');
});
export const getGenerics = catchAsync(async (req: Request, res: Response) => {
  const { page, limit } = req.query;

  const p = page || 1;
  const l = limit || 1;
  const generics = await genericService.getAll(+p, +l);
  res.success(generics, 'Generics fetched successfully');
});

export const createGeneric = catchAsync(async (req: Request, res: Response) => {
  const generic = await genericService.create(req.body);
  res.success(generic, 'Generic created successfully', 201);
});

export const updateGeneric = catchAsync(async (req: Request, res: Response) => {
  const generic = await genericService.update(+req.params.genericId, req.body);
  res.success(generic, 'Generic updated successfully');
});

export const deleteGeneric = catchAsync(async (req: Request, res: Response) => {
  const genericId = Number(req.params.genericId);
  await genericService.delete(genericId);
  res.status(204).send();
});
