module CompeticaosHelper

  def buscar_competicao

    @competicao = CompeticaoTipo.select('nome')

    opcoes = []
    opcoes << "Tipo"

    @competicao.each do |c|
      opcoes << c.nome
    end
    opcoes
    #render :json => opcoes, :callback => params[:callback]

  end

end
