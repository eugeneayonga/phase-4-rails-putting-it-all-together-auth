class RecipesController < ApplicationController

    def index
        if session[:user_id]
            recipes = Recipe.all
            render json: recipes, include: :user, status: :created
        else
            render json: { error: "Not authorized" }, status: :unauthorized
        end
    end

    def create
        if session[:user_id]
            recipe = Recipe.new(recipe_params)
            recipe.user_id = session[:user_id]
            if recipe.save
                render json: recipe, include: :user, status: :created
            else
                render json: { errors: recipe.errors.full_messages }, status: :unprocessable_entity
            end
        else
            render json: { error: "Not authorized" }, status: :unauthorized
        end
    end

    private

    def recipe_params
        params.permit(:title, :instructions)
    end

end
