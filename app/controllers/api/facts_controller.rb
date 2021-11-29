class Api::FactsController < ApplicationController

    before_action :set_fact, only: [:show, :destroy, :update]

    def index
        render json: Fact.all
    end

    def show
        render json: @fact
    end

    def create
        @fact = Fact.new(fact_params)
        if @fact.save
            render json: @fact
        else
            render json: {errors: @fact.errors}, status: :unprocessable_entity
        end
    end

    def update
        # @fact = Fact.find(params[:id])
        if @fact.update(fact_params)
            render json: @fact
        else
            render json: {errors: @fact.errors}, status: 422
        end
    end

    def destroy
        # @fact = Fact.find(params[:id]).destroy
        render json: @fact.destroy
    end

    private

    def set_fact
        @fact = Fact.find(params[:id])
    end

    def fact_params
        params.require(:fact).permit(:text, :source, :username, :stars)
        ## this makes the parameters require it to be a fact. and then permits the keys that the fact model has
    end

end
