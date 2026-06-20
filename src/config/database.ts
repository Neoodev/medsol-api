import { PrismaClient } from '@prisma/client';
import { config } from './env';

// Singleton factory for Prisma Client
class PrismaFactory {
  private static instance: PrismaClient;

  static getInstance(): PrismaClient {
    if (!PrismaFactory.instance) {
      PrismaFactory.instance = new PrismaClient({
        log: config.env === 'development' ? ['query', 'error', 'warn'] : ['error'],
      });
    }
    return PrismaFactory.instance;
  }
}

export const prisma = PrismaFactory.getInstance();
