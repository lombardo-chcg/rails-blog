class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }

  def author_full_name
    [author_first_name, author_last_name].join(' ')
  end

  def author_full_name=(name)
    name_array = name.split
    self.author_first_name = name_array[0]
    self.author_last_name = name_array[1]
  end
end
