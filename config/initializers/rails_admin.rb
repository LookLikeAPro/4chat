RailsAdmin.config do |config|

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  # config.authorize_with do
  #   redirect_to main_app.root_path unless current_user.try(:admin?)
  # end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Publication' do
    list do
      field :title
      field :author
      field :isbn
      field :updated_at
      scopes [:all, :production_only]
    end
  end
end
