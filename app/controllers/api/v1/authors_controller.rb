module Api
  module V1
    class AuthorsController < ApplicationController
      before_action :set_author, only: [:show, :update, :destroy]

      def index
        authors = params[:sort].present? ? Author.authorSort(params[:sort]) : Author.all
        render json: authors
      end

      def show
        render json: @author
      end

      def update
        if @author.update(author_params)
          Applog.save_log params[:controller], params[:action], @author.id
          head :no_content
        else
          render json: {errors: @author.errors}, status: 422
        end
      end

      def create
        author = Author.new(author_params)

        if author.save
          Applog.save_log params[:controller], params[:action], author.id
          head :no_content
        else
          render json: {errors: author.errors}, status: 422
        end
      end

      def destroy
        
          if @author.destroy
            Applog.save_log params[:controller], params[:action], @author.id
            head :no_content
          else            
            render json: {errors: @author.erros}, status: 422
          end
        
        
      end

      private

      def set_author
        @author = Author.find(params[:id])
      end

      def author_params
        params.require(:author).permit(:name, :age, :country_id)
      end
    end
  end
end