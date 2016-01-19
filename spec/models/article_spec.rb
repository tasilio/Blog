require "spec_helper"

describe Article do  
	describe "validation" do # Проверяем работу валидации модели
		it  {should validate_presence_of :title}
		it 	{should validate_presence_of :text}
	end
	describe "associations" do # Проверяем работу связи 1 к множеству модели
		it  {should have_many :comments}
	end
	describe "#subject" do
		it "returns the article title" do
			# Создаем объект артикле хитрым способом
			article = create(:article, title: 'Lorem ipsum')
			# assert, проверка
			expect(article.subject).to eq 'Lorem ipsum'
		end
	end
	describe "#last_comment" do
		it "returns the last comment" do
			article = create(:article_with_comments) # создаем статью с тремя комментариями
			# Проверка
			expect(article.last_comment.body).to eq "comment body 3"

		end
	end
end