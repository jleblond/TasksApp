class Admin::UserRolesController < Admin::AdminController


  def index
    @role_ids = Role.pluck(:id)

    @result = UserRole.all.group_by(&:role_id)

    @result.each do |key,value|
      value.each do |element|
        puts 'role '+element.role_id.to_s+'   user '+element.user_id.to_s
        #puts element.role_id
        #puts element.user_id
      end
    end


  end

  def show

  end

  def new

  end

  def create
    # @user = User.find(params[:id])
    #
    # if params[:user_roles].present?
    #   params[:user_roles].each { |r_id|
    #     UserRole.create(user_id: @user.id, role_id: r_id) if !r_id.blank?
    #  }
    #
    # if @user.save
    #
    #   end
    #
    #   flash[:notice] = "User created!"
    #   redirect_to(admin_users_path)
    # else
    #   flash[:alert] = "User not created"  #@user.errors
    #   render 'new'
    # end
  end

  def edit

  end

  def destroy
    if UserRole.find(params[:id]).destroy
      flash[:notice] = "User removed from this role group"
    elsif
    flash[:alert] = "User not removed from this role group"
    end

    redirect_to(admin_user_roles_path)
  end

end