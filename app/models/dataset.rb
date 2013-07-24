class Dataset < ActiveRecord::Base
	attr_accessible :nombre, :etiqueta_1, :etiqueta_2, :datos_1, :datos_2

	validates :nombre, presence: true
	validates :etiqueta_1, presence: true
	validates :etiqueta_2, presence: true
	validates :datos_1, presence: true
	validates :datos_2, presence: true
end

