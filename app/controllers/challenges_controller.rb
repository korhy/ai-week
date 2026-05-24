class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show]
  before_action :set_own_challenge, only: [:edit, :update, :destroy]

  def index
    @challenges = Challenge.order(module: :asc, name: :asc)
  end

  def show

  end

  def new
    @challenge = current_user.challenges.build(system_prompt: Challenge::DEFAULT_SYSTEM_PROMPT)
  end


  def create
    @challenge = current_user.challenges.build(challenge_params)
    if @challenge.save
      redirect_to @challenge, notice: "Challenge was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @challenge.update(challenge_params)
      redirect_to @challenge, notice: "Challenge was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @challenge.destroy
    redirect_to challenges_url, notice: "Challenge was successfully destroyed."
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  def set_own_challenge
    @challenge = current_user.challenges.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(:name, :module, :content, :system_prompt)
  end
end
