import { Router } from 'express';

import userRoutes from './user.routes';

const router = Router();

router.get('/health', (_req, res) => {
  res.success(null, 'OK');
});

router.use('/users', userRoutes);

export default router;
