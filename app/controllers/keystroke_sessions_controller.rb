class KeystrokeSessionsController < ApplicationController
  before_action :set_keystroke_session, only: [:show, :edit, :update, :destroy]

  # GET /keystroke_sessions
  # GET /keystroke_sessions.json
  def index
    @keystroke_sessions = KeystrokeSession.all
  end

  # GET /keystroke_sessions/1
  # GET /keystroke_sessions/1.json
  def show
  end

  # GET /keystroke_sessions/new
  def new
    @keystroke_session = KeystrokeSession.new
  end

  # GET /keystroke_sessions/1/edit
  def edit
  end

  # POST /keystroke_sessions
  # POST /keystroke_sessions.json
  def create
    binding.pry
    @keystroke_session = KeystrokeSession.new(keystroke_session_params)

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

  # PATCH/PUT /keystroke_sessions/1
  # PATCH/PUT /keystroke_sessions/1.json
  def update
    respond_to do |format|
      if @keystroke_session.update(keystroke_session_params)
        format.html { redirect_to @keystroke_session, notice: 'Keystroke session was successfully updated.' }
        format.json { render :show, status: :ok, location: @keystroke_session }
      else
        format.html { render :edit }
        format.json { render json: @keystroke_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keystroke_sessions/1
  # DELETE /keystroke_sessions/1.json
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
