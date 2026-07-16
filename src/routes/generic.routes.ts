import { validate } from '../middlewares/validate';
import {
  createGeneric,
  deleteGeneric,
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
router.delete('/:genericId', deleteGeneric);
export default router;
