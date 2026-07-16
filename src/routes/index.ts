import { Router } from 'express';

import userRoutes from './user.routes';

import genericRoutes from './generic.routes';
const router = Router();

router.get('/health', (_req, res) => {
  res.success(null, 'OK');
});

router.use('/user', userRoutes);
router.use('/generic', genericRoutes);

export default router;
