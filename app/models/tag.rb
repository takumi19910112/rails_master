class Tag < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ruby' },
    { id: 3, name: 'rails' },
    { id: 4, name: 'Python'},
    { id: 5, name: 'JavaScript'},
    { id: 6, name: 'Java' },
    { id: 7, name: 'Go' },
    { id: 8, name: 'C'},
    { id: 9, name: 'terminal'},
    { id: 10, name: 'その他'},
  ]
  include ActiveHash::Associations
  has_many :questions
  end