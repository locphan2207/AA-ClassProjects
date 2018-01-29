json.partial!

# if @user
#   json.session do
#     json.currentUser do
#       json.extract! @user, :id, :username
#     end
#   end
#   json.errors do
#     json.session []
#   end
# else
#   json.session do
#     json.currentUser 'null'
#   end
#   json.errors do
#     json.session @errors
#   end
# end
