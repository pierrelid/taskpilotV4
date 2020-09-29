module SlugConcern
  extend ActiveSupport::Concern

  def set_slug
    loop do
      self.slug = SecureRandom.uuid
      break unless Team.where(slug: slug).exists?
    end
  end
end
