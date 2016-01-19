FactoryGirl.define do
	factory :article do
		title "Article title"
		text "Article text"
		# Создаем фабрику с названием article_with_comments
		# для создания статьи с несколькими комментариями
		factory :article_with_comments do
			after(:create) do |article, evaluator| # после создания article

				create_list :comment, 3, article: article # создаем список из 3-х комментариев

			end
		end
	end	
end