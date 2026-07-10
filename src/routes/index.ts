import { Router } from 'express';

import userRoutes from './user.routes';

import genericRoutes from './generic.routes';
const router = Router();

router.get('/health', (_req, res) => {
  res.success(null, 'OK');
});

router.use('/users', userRoutes);
router.use('/generics', genericRoutes);

export default router;
