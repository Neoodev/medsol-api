import { getGenerics } from '../controllers/generic.controller';
import { Router } from 'express';

const router = Router();

router.get('/', getGenerics);

export default router;
