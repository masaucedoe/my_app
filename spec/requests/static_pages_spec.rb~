#encoding: utf-8
require 'spec_helper'

describe "Static pages" do
	subject { page }
	let(:base_title) { "Mi aplicación" }

	describe "Inicio page" do
		before { visit '/static_pages/inicio' }
			it { should have_selector('h1', text: 'Mi aplicación') }
			it { should have_selector('title', text: "#{base_title} | Inicio") }
	end

	describe "Ayuda page" do
		before { visit '/static_pages/ayuda' }
			it { should have_selector('h1', text: 'Ayuda') }
			it { should have_selector('title', text: "#{base_title} | Ayuda") }
	end

	describe "Informacion page" do
		before { visit '/static_pages/informacion' }
			it { should have_selector('h1', text: 'Acerca de mi') }
			it { should have_selector('title', text: "#{base_title} | Información sobre mi") }
	end

	describe "Contacto page" do
		before { visit '/static_pages/contacto' }
			it { should have_selector('h1', text: 'Contáctame') }
			it { should have_selector('title', text: "#{base_title} | Contacto") }
	end
end

