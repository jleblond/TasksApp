class Admin::UserRolesController < Admin::AdminController


  def index

    @roles = Role.all


    @role_ids = Role.pluck(:id)

    @result = UserRole.all.group_by(&:role_id)

    # @result.each do |key,value|
    #   value.each do |element|
    #     puts 'role '+element.role_id.to_s+'   user '+element.user_id.to_s
    #   end
    # end
    #

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



  def permissions
    @user = User.find(params[:id])
    UserRole.delete_all(user_id: @user.id)

    if params[:user_roles].present?
      params[:user_roles].each { |r_id|
        UserRole.create(user_id: @user.id, role_id: r_id) if !r_id.blank?
      }
    end

    redirect_to(admin_user_path(@user))
  end


  def destroy
    user_id = UserRole.find(params[:id]).user_id
    role_id = UserRole.find(params[:id]).role_id
    user_name = User.find(user_id).name
    role_name = Role.find(role_id).role_name

    if UserRole.find(params[:id]).destroy
      flash[:notice] = "User "+user_name+" was removed from group "+role_name
    elsif
      flash[:alert] = "User "+user_name+" was not removed from group "+role_name
    end

    redirect_to(admin_user_roles_path)
  end

end