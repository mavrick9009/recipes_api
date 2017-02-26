class RecipeFullSerializer < RecipeSerializer
  has_many :steps, serializer: StepSerializer

end
