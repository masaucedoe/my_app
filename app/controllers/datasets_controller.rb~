#encoding: utf-8
class DatasetsController < ApplicationController

	def new
		@dataset = Dataset.new
	end

	def create
		@dataset = Dataset.new(params[:dataset])
		if @dataset.save
			redirect_to datasets_path
		else
			render 'new'
		end
	end

	def show
		@dataset = Dataset.find(params[:id])
	end
end

