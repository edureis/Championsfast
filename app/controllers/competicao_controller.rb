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
    @competicao = Competicao.new
    render :template => 'competicao/new'
  end

  def destroy
    @competicao = Competicao.find(params[:id])
    @competicao.destroy
    redirect_to(action: "show")
  end

end
