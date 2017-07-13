json.extract! user, :id, :avatar, :nickname, :wechat, :name, :gender, :school, :grade, :major, :mobile, :created_at, :updated_at
json.url user_url(user, format: :json)
