import Joi from 'joi';

export const createGenericSchema = Joi.object({
  name: Joi.string().min(2).max(50).required(),
  description: Joi.string().optional(),
});

export const updateGenericSchema = Joi.object({
  name: Joi.string().min(2).max(50).required(),
  description: Joi.string().optional(),
});
