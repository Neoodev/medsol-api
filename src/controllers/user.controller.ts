import type { Request, Response } from 'express';

import ServiceFactory from '../factories/service.factory';
import { catchAsync } from '../utils/catchAsync';

const userService = ServiceFactory.getUserService();

export const getUsers = catchAsync(async (_req: Request, res: Response) => {
  const users = await userService.getAll();
  res.success(users, 'Users fetched successfully');
});

export const getUser = catchAsync(async (req: Request, res: Response) => {
  const id = Number(req.params.id);
  const user = await userService.getById(id);
  res.success(user, 'User fetched successfully');
});

export const createUser = catchAsync(async (req: Request, res: Response) => {
  const user = await userService.create(req.body);
  res.success(user, 'User created successfully', 201);
});

export const updateUser = catchAsync(async (req: Request, res: Response) => {
  const id = Number(req.params.id);
  const user = await userService.update(id, req.body);
  res.success(user, 'User updated successfully');
});

export const deleteUser = catchAsync(async (req: Request, res: Response) => {
  const id = Number(req.params.id);
  await userService.delete(id);
  res.status(204).send();
});
