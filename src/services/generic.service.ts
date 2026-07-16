import { CreateGenericInput, UpdateGenericInput } from '../types';
import { prisma } from '../config/database';
import { ApiError } from '../utils/ApiError';

export class GenericService {
  async getGeneric(genericId: number) {
    const generic = await prisma.generic.findUnique({ where: { id: genericId } });

    if (!generic) {
      throw new ApiError(400, `Generic with id ${genericId} not found`);
    }
    return generic;
  }
  async getAll(page: number, limit: number) {
    const totalPages = Math.floor(page * limit);
    const skip = page - 1;
    const [data, pages] = await prisma.$transaction([
      prisma.generic.findMany({
        skip,
        take: totalPages,
      }),
      prisma.generic.count({
        skip,
        take: totalPages,
      }),
    ]);
    return {
      data,
      meta: {
        page,
        limit,
        total: pages,
      },
    };
  }

  async create(data: CreateGenericInput) {
    return prisma.generic.create({ data });
  }

  async update(id: number, data: UpdateGenericInput) {
    const generic = await this.getGeneric(id);
    return prisma.generic.update({ where: { id: generic.id }, data });
  }
}
