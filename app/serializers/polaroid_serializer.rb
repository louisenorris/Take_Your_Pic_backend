class PolaroidSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :user_id, :updated_at, :created_at, :photo

  def photo
    if object.photo.attached?
      {
        url: rails_blob_url(object.photo)
      }
    end
  end
end
