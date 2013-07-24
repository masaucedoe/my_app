#encoding: utf-8
require 'spec_helper'

describe "Data pages" do
	subject { page }
	let(:base_title) { "Mi aplicación" }

	describe "create page" do
		before { visit carga_de_datos_path }
			it { should have_selector('h1', text: 'Cargar datos') }
			it { should have_selector('title', text: "#{base_title} | Carga de datos") }
	end

	describe "creation" do
		before { visit carga_de_datos_path }
		let(:submit) { "Crear conjunto de datos" }

		describe "with invalid information" do
			it "should not create a dataset" do
				expect { click_button submit }.not_to change(Dataset, :count)
			end

			describe "after submission" do
				before { click_button submit }

				it { should have_selector('title', text: 'Carga de datos') }
			end
		end
	end
end

