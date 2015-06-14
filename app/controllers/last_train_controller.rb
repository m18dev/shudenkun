class LastTrainController < ActionController::Base
  # http://localhost:3000/api/last_train.json?user_id=1
  def get_last_train
    user = User.find(params[:user_id])
    depature = User.find(params[:departure])

    last_train = LastTrain.ensure(depature, user.nearest_station)

    response = {
      depature: last_train.depature,
      destination: last_train.destination,
      depature_at: last_train.depature_at,
      remain_min: last_train.remain_min
    }
    respond_to do |format|
      format.json { render json: response }
    end
  end
end
