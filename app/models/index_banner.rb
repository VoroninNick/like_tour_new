class IndexBanner < ActiveRecord::Base
  has_paper_trail
  attr_accessible :name, :description, :slug, :link,  :published, :position, :image

  translates :name, :slug, :description, :link, :date_from, :name_text, :where_to_go, :versioning => :paper_trail # , :versioning => :paper_trail for paper_trail
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
    attr_accessible :locale, :index_banner_id
    attr_accessible  :name, :slug, :description, :link, :date_from, :name_text, :where_to_go

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
        group :banner_text do
          label 'Текст для банера:'
          active false
          field :date_from do
            label 'час початку:'
            help ''
          end
          field :name_text do
            label 'назва:'
            help ''
          end
          field :where_to_go do
            label 'місце призначення:'
            help ''
          end
        end
        field :link do
          label 'Посилання'
          help ''
        end

      end
    end
  end

  has_attached_file :image,
                    styles: { large: "1920x1200>"},
                    convert_options: { large: "-quality 94 -interlace Plane" },
                    url: "/assets/images/:class/:id/image_:style.:extension",
                    path:':rails_root/public:url'


  validates_presence_of :image, :message => "Виберіть фотографію, відповідно до зазначених розмірів! Поле не може бути пустим."
  validates_presence_of :name, :message => "Введіть назву! Поле не може бути пустим."


  # def self.get_item_class
  #
  # end

  rails_admin do
    navigation_label 'Головна сторінка'
    label 'Банер'
    label_plural 'Банери'

    # for nestable
    #nestable_tree( { position_field: :position, max_depth: 3 } )
    nestable_list true

    list do
      field :name
      field :position
      field :image
      field :description
      field :published
    end

    edit do
      field :published do
        label 'Опубліковано:'
        help ''
      end
      field :translations, :globalize_tabs do
        label 'Локалізації'
      end
      field :image, :paperclip do
        label 'Зображення'
        help 'Зображення для альбому повинне бути 1920. / 1200.'
      end
      field :position do
        label 'Порядковий номер'
      end
    end
  end
end
