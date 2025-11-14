class IdolsController < ApplicationController
    def index
    end

    def new
        @idol = Idol.new
    end

    def show
        @idol = Idol.find_by(id: params[:id])
    end

    def create
        idol = Idol.new(idol_params)
        if idol.save
            flash[:notice] = "診断が完了しました"
            redirect_to idol_path(idol.id)
        else
            redirect_to :action => "new"
        end
    end
  
  private
    def idol_params
        params.require(:idol).permit(:question1, :question2, :question3, :question4)
    end
end
