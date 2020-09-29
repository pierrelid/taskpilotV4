module SlugConcern
  extend ActiveSupport::Concern

  def set_slug
    loop do
      self.slug = SecureRandom.uuid
      klass = Object.const_get self.class.name
      break unless klass.where(slug: slug).exists?
    end
  end
end
