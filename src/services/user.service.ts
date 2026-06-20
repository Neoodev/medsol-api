import { prisma } from '../config/database';
import { ApiError } from '../utils/ApiError';
import { Prisma } from '@prisma/client';

export interface CreateUserInput {
  name: string;
  email: string;
}

export interface UpdateUserInput {
  name?: string;
  email?: string;
}

export class UserService {
  async getAll() {
    return prisma.user.findMany();
  }

  async getById(id: number) {
    const user = await prisma.user.findUnique({ where: { id } });
    if (!user) {
      throw new ApiError(404, 'User not found');
    }
    return user;
  }

  async create(data: CreateUserInput) {
    try {
      return await prisma.user.create({ data });
    } catch (err) {
      if (err instanceof Prisma.PrismaClientKnownRequestError && err.code === 'P2002') {
        throw new ApiError(409, 'Email already in use');
      }
      throw err;
    }
  }

  async update(id: number, data: UpdateUserInput) {
    await this.getById(id);
    try {
      return await prisma.user.update({ where: { id }, data });
    } catch (err) {
      if (err instanceof Prisma.PrismaClientKnownRequestError && err.code === 'P2002') {
        throw new ApiError(409, 'Email already in use');
      }
      throw err;
    }
  }

  async delete(id: number) {
    await this.getById(id);
    return prisma.user.delete({ where: { id } });
  }
}
