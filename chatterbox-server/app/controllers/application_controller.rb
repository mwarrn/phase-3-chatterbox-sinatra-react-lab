class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Getting all the messages and ordering them by created_at, then converting them to json.
  get "/messages" do
    messages = Message.all.order(:created_at)
    messages.to_json
  end
  
  # Creating a new message with the body and username that is passed in, then converting it to json.
  post "/messages" do
    message = Message.create(body: params[:body], username: params[:username])
    message.to_json
  end
  
  # Finding the message by the id that is passed in, then updating the body of the message
  # with the body that is passed in. It is then converting it ts json.
  patch "/messages/:id" do
    message = Message.find(params[:id])
    message.update(body: params[:body])
    message.to_json
  end
  
  # Finding the message by the id that is passed in. Then it is deleting the message.
  delete "/messages/:id" do
    message = Message.find(params[:id])
    message.destroy
    message.to_json
  end
  
end
