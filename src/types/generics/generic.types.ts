export interface CreateGenericInput {
  name: string;
  description: string;
}

export interface UpdateGenericInput extends Partial<CreateGenericInput> {}
