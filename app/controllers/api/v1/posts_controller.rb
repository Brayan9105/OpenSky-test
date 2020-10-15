module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]

      def index
        posts = Post.all
        render json: posts
      end

      def show
        render json: @post
      end

      def update
        if @post.update(post_params)
          Applog.save_log params[:controller], params[:action], @post.id
          head :no_content
        else
          render json: {errors: @post.errors}, status: 422
        end
      end

      def create
        post = Post.new(post_params)

        if post.save
          Applog.save_log params[:controller], params[:action], post.id
          head :no_content
        else
          render json: {errors: post.errors}, status: 422
        end
      end

      def destroy
        if @post.destroy
          Applog.save_log params[:controller], params[:action], @post.id
          head :no_content
        else
          render json: {errors: @post.errors}, status: 422
        end
      end

      private

      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title, :content, :author_id)
      end
    end
  end
end