class CompeticaoController < ActionController::Base

  def index
    @competicao = Competicao.order :nome
    render :template => 'competicao/competicao'
  end

  def show
    @competicao = Competicao.find(params[:id])
    render :template => 'competicao/show'
  end

  def new
    @competicao = Competicao.all
    render :template => 'layouts/championship'
  end

end
