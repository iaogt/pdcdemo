class FormularioController < ApplicationController

    def index
        @pedidos = Pedido.all
    end

end
