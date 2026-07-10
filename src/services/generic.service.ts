import { prisma } from '../config/database';

export class GenericService {
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
}
