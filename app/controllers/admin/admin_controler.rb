class Admin::AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :role_admin?


end