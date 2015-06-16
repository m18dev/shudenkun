class LastTrainController < ActionController::Base
  # http://localhost:3000/api/last_train.json?user_id=1
  def get_last_train
    user = User.find(params[:user_id])
    depature = params[:depature]

    last_train = LastTrain.ensure(depature, user.nearest_station)

    interference = Interference.where(target_user: user.id).first

    response = {
      depature: last_train.depature,
      destination: last_train.destination,
      depature_at: interference.nil? ? last_train.depature_time_at : last_train.depature_time_at + 10.minute,
      remain_min: interference.nil?  ? last_train.remain_min : last_train.remain_min + 10
    }
    respond_to do |format|
      format.json { render json: response }
    end
  end
end
