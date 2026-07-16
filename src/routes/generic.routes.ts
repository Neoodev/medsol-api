import { validate } from '../middlewares/validate';
import {
  createGeneric,
  getGeneric,
  getGenerics,
  updateGeneric,
} from '../controllers/generic.controller';
import { Router } from 'express';
import { createGenericSchema, updateGenericSchema } from '../validations/generic.validation';

const router = Router();
router.get('/:genericId', getGeneric);
router.get('/', getGenerics);
router.post('/', validate(createGenericSchema), createGeneric);
router.patch('/:genericId', validate(updateGenericSchema), updateGeneric);

export default router;
