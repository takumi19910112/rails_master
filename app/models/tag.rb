class Tag < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ruby' },
    { id: 3, name: 'rails' },
    { id: 4, name: 'terminal' },
    { id: 5, name: 'その他' },
  ]
  include ActiveHash::Associations
  has_many :questions
  end