class LastTrainController < ActionController::Base
  # http://localhost:3000/api/last_train.json?user_id=1
  def get_last_train
    user = User.find(params[:user_id])
    # TODO 何らかの方法で最寄り駅を取得。
    depature = "溜池山王"

    last_train = LastTrain.ensure(depature, user.nearest_station)

    response = {
      depature: last_train.depature,
      destination: last_train.destination,
      depature_at: last_train.depature_at
    }
    respond_to do |format|
      format.json { render json: response }
    end
  end
end
