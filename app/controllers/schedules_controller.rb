class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    
    if @schedule.save
      redirect_to schedules_path, notice: "スケジュールを登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
   
    if @schedule.update(schedule_params)
    redirect_to schedule_path(@schedule), notice: "スケジュールを更新しました"
    
    else
    render :edit, status: :unprocessable_entity
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy # データを削除
    redirect_to schedules_path, notice: "スケジュールを削除しました"
  end
end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :start_date, :end_date, :is_all_day, :comment)
  end
end