# frozen_string_literal: true

require 'spec_helper'

module RailsBestPractices
  module Reviews
    describe RestrictAutoGeneratedRoutesReview do
      let(:runner) { Core::Runner.new(prepares: Prepares::ControllerPrepare.new, reviews: described_class.new) }

      describe 'resources' do
        before do
          content = <<-EOF
          class PostsController < ApplicationController
            def show; end
            def new; end
            def create; end
            def edit; end
            def update; end
            def destroy; end
          end
          EOF
          runner.prepare('app/controllers/posts_controller.rb', content)
        end

        it 'should restrict auto-generated routes' do
          content = <<-EOF
          RailsBestPracticesCom::Application.routes.draw do
            resources :posts
          end
          EOF
          runner.review('config/routes.rb', content)
          expect(runner.errors.size).to eq(1)
          expect(runner.errors[0].to_s).to eq('config/routes.rb:2 - restrict auto-generated routes posts (except: [:index])')
        end

        it 'should not restrict auto-generated routes with only' do
          content = <<-EOF
          RailsBestPracticesCom::Application.routes.draw do
            resources :posts, only: %w(show new create edit update destroy)
          end
          EOF
          runner.review('config/routes.rb', content)
          expect(runner.errors.size).to eq(0)
        end

        it 'should not restrict auto-generated routes with except' do
          content = <<-EOF
          RailsBestPracticesCom::Application.routes.draw do
            resources :posts, except: :index
          end
          EOF
          runner.review('config/routes.rb', content)
          expect(runner.errors.size).to eq(0)
        end

        describe 'specify a controller' do
          it 'should restrict auto-generated routes' do
            content = <<-EOF
            RailsBestPracticesCom::Application.routes.draw do
              resources :articles, controller: "posts"
            end
            EOF
            runner.review('config/routes.rb', content)
            expect(runner.errors.size).to eq(1)
            expect(runner.errors[0].to_s).to eq('config/routes.rb:2 - restrict auto-generated routes articles (except: [:index])')
          end
        end

        describe 'namespace' do
          before do
            content = <<-EOF
            class Admin::CommentsController < ApplicationController
              def show; end
              def new; end
              def create; end
              def edit; end
              def update; end
              def destroy; end
            end
            EOF
            runner.prepare('app/controllers/admin/comments_controller.rb', content)
          end

          it 'should restrict auto-generated routes' do
            content = <<-EOF
            RailsBestPracticesCom::Application.routes.draw do
              namespace :admin do
                resources :comments
              end
            end
            EOF
            runner.review('config/routes.rb', content)
            expect(runner.errors.size).to eq(1)
            expect(runner.errors[0].to_s).to eq('config/routes.rb:3 - restrict auto-generated routes admin/comments (except: [:index])')
          end

          it 'should restrict auto-generated routes with scope :module' do
            content = <<-EOF
            RailsBestPracticesCom::Application.routes.draw do
              scope module: :admin do
                resources :comments
              end
            end
            EOF
            runner.review('config/routes.rb', content)
            expect(runner.errors.size).to eq(1)
            expect(runner.errors[0].to_s).to eq('config/routes.rb:3 - restrict auto-generated routes admin/comments (except: [:index])')
          end

          it 'should restrict auto-generated routes with resources :module' do
            content = <<-EOF
            RailsBestPracticesCom::Application.routes.draw do
              resources :comments, module: :admin
            end
            EOF
            runner.review('config/routes.rb', content)
            expect(runner.errors.size).to eq(1)
            expect(runner.errors[0].to_s).to eq('config/routes.rb:2 - restrict auto-generated routes admin/comments (except: [:index])')
          end
        end

        describe 'nested routes' do
          before do
            content = <<-EOF
            class CommentsController < ApplicationController
              def index; end
              def show; end
              def new; end
              def create; end
              def edit; end
              def update; end
              def destroy; end
            end
            EOF
            runner.prepare('app/controllers/comments_controller.rb', content)
          end

          it 'should restrict auto-generated routes' do
            content = <<-EOF
            RailsBestPracticesCom::Application.routes.draw do
              resources :posts do
                resources :comments
              end
            end
            EOF
            runner.review('config/routes.rb', content)
            expect(runner.errors.size).to eq(1)
            expect(runner.errors[0].to_s).to eq('config/routes.rb:2 - restrict auto-generated routes posts (except: [:index])')
          end

          it 'should not restrict auto-generated routes with only' do
            content = <<-EOF
            RailsBestPracticesCom::Application.routes.draw do
              resources :posts, only: %w(show new create edit update destroy) do
                resources :comments
              end
            end
            EOF
            runner.review('config/routes.rb', content)
            expect(runner.errors.size).to eq(0)
          end

          it 'should not restrict auto-generated routes with except' do
            content = <<-EOF
            RailsBestPracticesCom::Application.routes.draw do
              resources :posts, except: :index do
                resources :comments
              end
            end
            EOF
            runner.review('config/routes.rb', content)
            expect(runner.errors.size).to eq(0)
          end
        end
      end

      describe 'resource' do
        before do
          content = <<-EOF
          class AccountsController < ApplicationController
            def show; end
            def new; end
            def create; end
            def edit; end
            def update; end
          end
          EOF
          runner.prepare('app/controllers/accounts_controller.rb', content)
        end

        it 'should restrict auto-generated routes' do
          content = <<-EOF
          ActionController::Routing::Routes.draw do |map|
            map.resource :account
          end
          EOF
          runner.review('config/routes.rb', content)
          expect(runner.errors.size).to eq(1)
          expect(runner.errors[0].to_s).to eq('config/routes.rb:2 - restrict auto-generated routes account (except: [:destroy])')
        end

        it 'should not restrict auto-generated routes with only' do
          content = <<-EOF
          ActionController::Routing::Routes.draw do |map|
            map.resource :account, only: %w(show new create edit update)
          end
          EOF
          runner.review('config/routes.rb', content)
          expect(runner.errors.size).to eq(0)
        end

        it 'should not restrict auto-generated routes with except' do
          content = <<-EOF
          ActionController::Routing::Routes.draw do |map|
            map.resource :account, except: :destroy
          end
          EOF
          runner.review('config/routes.rb', content)
          expect(runner.errors.size).to eq(0)
        end

        it 'should not check ignored files' do
          runner = Core::Runner.new(prepares: Prepares::ControllerPrepare.new,
                                    reviews: described_class.new(ignored_files: /config\/routes\.rb/))

          content = <<-EOF
          ActionController::Routing::Routes.draw do |map|
            map.resource :account
          end
          EOF
          runner.review('config/routes.rb', content)
          expect(runner.errors.size).to eq(0)
        end
      end

      context 'api_only = true' do
        let(:runner) { Core::Runner.new(prepares: [Prepares::ConfigPrepare.new, Prepares::ControllerPrepare.new], reviews: described_class.new) }

        before do
          content = <<-EOF
          module RailsBestPracticesCom
            class Application < Rails::Application
              config.api_only = true
            end
          end
          EOF
          runner.prepare('config/application.rb', content)
          content = <<-EOF
          class PostsController < ApplicationController
            def show; end
            def create; end
            def update; end
            def destroy; end
          end
          EOF
          runner.prepare('app/controllers/posts_controller.rb', content)
        end

        it 'should restrict auto-generated routes' do
          content = <<-EOF
          RailsBestPracticesCom::Application.routes.draw do
            resources :posts
          end
          EOF
          runner.review('config/routes.rb', content)
          expect(runner.errors.size).to eq(1)
          expect(runner.errors[0].to_s).to eq('config/routes.rb:2 - restrict auto-generated routes posts (except: [:index])')
        end

        it 'should not restrict auto-generated routes with only' do
          content = <<-EOF
          RailsBestPracticesCom::Application.routes.draw do
            resources :posts, only: %w(show create update destroy)
          end
          EOF
          runner.review('config/routes.rb', content)
          expect(runner.errors.size).to eq(0)
        end
      end
    end
  end
end
