#encoding: utf-8
require 'spec_helper'

describe Dataset do
	before { @dataset = Dataset.new(nombre: "Ejemplo", etiqueta_1: "Ejemplo_1", etiqueta_2: "Ejemplo_2", datos_1: "1,1,1,1,1", datos_2: "2,2,2,2,2") }
	subject { @dataset }

	it { should respond_to(:nombre) }
	it { should respond_to(:etiqueta_1) }
	it { should respond_to(:etiqueta_2) }
	it { should respond_to(:datos_1) }
	it { should respond_to(:datos_2) }

	it { should be_valid }

	describe "when nombre is not present" do
		before { @dataset.nombre = " " }
		it { should_not be_valid }
	end

	describe "when etiqueta_1 is not present" do
		before { @dataset.etiqueta_1 = " " }
		it { should_not be_valid }
	end

	describe "when etiqueta_2 is not present" do
		before { @dataset.etiqueta_2 = " " }
		it { should_not be_valid }
	end

	describe "when datos_1 is not present" do
		before { @dataset.datos_1 = " " }
		it { should_not be_valid }
	end

	describe "when datos_2 is not present" do
		before { @dataset.datos_2 = " " }
		it { should_not be_valid }
	end
end

