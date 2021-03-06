class VerificationsController < ApplicationController
  before_action :set_verification, only: [:show, :edit, :update, :destroy]

  def index
    @verifications = Verification.all
  end

  def show
    authorize @verification
    @comments = @verification.comments
    @comment = Comment.new
    
  end

  def new
    @verification = Verification.new(params[:case_id])
    authorize @verification
  end

  def edit
    authorize @verification
  end

  def create
    @case = Case.find(verification_params[:case_id].to_i)
    authorize @case
    @verification = @case.verifications.create(verification_params)
    @verification.user_id = current_user.id
    @verification.save!
    
    respond_to do |format|
      if @verification.save
        verifier_ids = Array.new
        verifiers = Array.new
        org = Organization.find(@case.organization_id)
        admin = User.with_role(:admin, org).first
        verifier_ids.push(@case.user_id)
        verifier_ids.push(admin.id)
        for i in @case.verifications
          verifier_ids.push(i.user_id)
        end
        for i in verifier_ids
          verifiers.push(User.find(i).email)
        end
        verifiers.uniq!
        for i in verifiers
          UserMailer.verification_notification_email(i, @verification.user_id, @case.id, @verification.id).deliver_later
        end
      
        format.html { redirect_to @verification, notice: 'Verification was successfully created.' }
        format.json { render :show, status: :created, location: @verification }
      else
        format.html { render :new }
        format.json { render json: @verification.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @verification.update(verification_params)
        format.html { redirect_to @verification, notice: 'Verification was successfully updated.' }
        format.json { render :show, status: :ok, location: @verification }
      else
        format.html { render :edit }
        format.json { render json: @verification.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @verification
    @verification.destroy
    respond_to do |format|
      format.html { redirect_to verifications_url, notice: 'Verification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_verification
      @verification = Verification.find(params[:id])
    end

    def verification_params
      params.require(:verification).permit(:check1, :check2, :check3, :check4, :check5, :amount, :remarks, :case_id, files:[])
    end
end
