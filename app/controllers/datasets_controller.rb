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

	def index
		@datasets = Dataset.paginate(page: params[:page], per_page: 20)
	end

	def destroy
		Dataset.find(params[:id]).destroy
		redirect_to datasets_url
	end

	def edit
		@dataset = Dataset.find(params[:id])
	end

	def update
		@dataset = Dataset.find(params[:id])
		if @dataset.update_attributes(params[:dataset])
			redirect_to @dataset
		else
			render 'edit'
		end
	end
end

