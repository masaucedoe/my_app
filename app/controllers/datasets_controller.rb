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

		@x = @dataset.datos_1.split(",").map(&:to_f)
		@y = @dataset.datos_2.split(",").map(&:to_f)
		@n = @x.length
		@response = linear_regression(@n, @x, @y)

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

	private

	def linear_regression (n, x, y)
		response = Array.new(3)
		response[1] = b_determination n, x, y
		response[0] = a_determination response[1], n, x, y
		response[2] = r_determination n, x, y
		return response
	end

	def a_determination (b, n, x, y)
		s_x = 0
		for i in 0..n-1
			s_x += x[i]
		end

		s_y = 0
		for i in 0..n-1
			s_y += y[i]
		end

		a = (s_y - b * s_x) / n;
	end

	def b_determination (n, x, y)
		s_x = 0
		for i in 0..n-1
			s_x += x[i]
		end

		s_x_2 = 0
		for i in 0..n-1
			s_x_2 += x[i] * x[i]
		end

		s_y = 0
		for i in 0..n-1
			s_y += y[i]
		end

		s_x_y = 0
		for i in 0..n-1
			s_x_y += x[i] * y[i]
		end

		b = (1.0 * n * s_x_y - s_x * s_y) / (n * s_x_2 - s_x * s_x)
	end

	def r_determination (n, x, y)
		s_x_y = 0
		for i in 0..n-1
			s_x_y += x[i] * y[i]
		end

		s_x = 0
		for i in 0..n-1
			s_x += x[i]
		end

		s_y = 0
		for i in 0..n-1
			s_y += y[i]
		end

		s_x_2 = 0
		for i in 0..n-1
			s_x_2 += x[i] * x[i]
		end

		s_y_2 = 0
		for i in 0..n-1
			s_y_2 += y[i] * y[i]
		end

		r = (1.0 * n * s_x_y - s_x * s_y) * (1.0 * n * s_x_y - s_x * s_y) / ((n * s_x_2 - s_x * s_x) * (n * s_y_2 - s_y * s_y))
	end
end

