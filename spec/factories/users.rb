FactoryBot.define do
  factory :user do
    nickname             {"たくみ"}
    email                 {"takumi19910112@gmail.com"}
    password              {"takumi0112"}
    password_confirmation {password}
    first_name            {"山坂"}
    last_name             {"巧"}

  end
end
