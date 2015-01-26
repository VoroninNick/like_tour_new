class WorkRegion < ActiveRecord::Base
  attr_accessible :name, :slug, :published, :image

  translates :name, :slug
  attr_accessible :translations
  accepts_nested_attributes_for :translations
  attr_accessible :translations_attributes

  # generate slug for locale if other locale empty set value slug current name and slug with index locale name
  validates :name, :uniqueness => true, presence: true
  after_validation :generate_slug
  def generate_slug
    if self.errors[:name].empty?
      self.translations_by_locale.keys.each do |locale|
        t = self.translations_by_locale[locale.to_sym]
        if !t.slug || t.slug == ''
          #current_locale = I18n.locale
          req_locale = locale.to_sym
          req_locale = :ru if req_locale.to_sym == :uk

          I18n.with_locale req_locale do
            if t.name && t.name != ''
              t.slug = t.name.parameterize
            else
              t.slug = "#{ I18n.with_locale(:ru) {|locale|self.name.parameterize } }-#{locale}"
            end
          end
        end
      end
    end
  end

  class Translation
    attr_accessible :locale, :work_region_id
    attr_accessible  :name, :slug

    rails_admin do
      visible false
      nested do
        field :locale , :hidden
        field :name do
          label 'Назва'
          help 'Введіть унікальну не повторювану назву'
        end
        field :slug do
          label 'Транслітерація назви'
          help ''
        end
      end
    end
  end


  has_attached_file :image,
                    styles: { large: "200x200>"},
                    convert_options: { thumb: "-quality 94 -interlace Plane",
                                       large: "-quality 94 -interlace Plane" },
                    url: "/assets/images/:class/:id/image_:style.:extension",
                    path:':rails_root/public:url'


  validates_presence_of :image, :message => "Виберіть фотографію, відповідно до зазначених розмірів! Поле не може бути пустим."

  rails_admin do
    navigation_label 'Головна сторінка'
    label 'Область'
    label_plural 'Області'

    list do
      field :name do
        label 'Назва'
      end
      field :slug do
        label 'Транслітерація'
      end
      field :image do
        label 'Зображення'
      end
      field :published do
      label 'Зняти з публікації?'
      end
    end

    edit do
      field :translations, :globalize_tabs do
        label 'Локалізації'
      end
      field :image, :paperclip do
        label 'Зображення'
        help 'Зображення повинне мати розмір 200px / 200px'
      end
      field :published do
        label 'Зняти з публікації?'
        help ''
      end
    end
  end
end
