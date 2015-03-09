json.id      @todo.id
json.message @message

if current_user.email == "jamesdabbs@gmail.com"
  json.secret_message "No seriously, you rock!"
end