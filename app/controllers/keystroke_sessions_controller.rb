class KeystrokeSessionsController < ApplicationController
  before_action :set_keystroke_session, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @keystroke_sessions = KeystrokeSession.where(user_uuid: current_user.uuid).all
  end

  def show
  end

  def new
    @input_text = InputText.all.take!
    @keystroke_session = KeystrokeSession.new
  end

  def create
    @keystroke_session = KeystrokeSession.new(keystroke_session_params)
    @keystroke_session.user_uuid = current_user.uuid

    respond_to do |format|
      if @keystroke_session.save
        format.html { redirect_to @keystroke_session, notice: 'Keystroke session was successfully created.' }
        format.json { render :show, status: :created, location: @keystroke_session }
      else
        format.html { render :new }
        format.json { render json: @keystroke_session.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @keystroke_session.destroy
    respond_to do |format|
      format.html { redirect_to keystroke_sessions_url, notice: 'Keystroke session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keystroke_session
      @keystroke_session = KeystrokeSession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def keystroke_session_params
      params.require(:keystroke_session).permit(:text, :keystrokes)
    end
end
