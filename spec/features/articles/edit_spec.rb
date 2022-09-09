require "rails_helper"

describe "user edits an article" do
  describe "they link from the show page" do
    it "displays all articles with edit changes" do
      article = Article.create!(title: "New Title", body: "New Body")

      visit article_path(article)
      click_link "Edit"
      expect(current_path).to eq(edit_article_path(article))

      fill_in "article[title]", with: "Newest Title Name!"
      fill_in "article[body]",  with: "New Body!"
      click_on "Update Article"

      new_article = Article.all.last
      
      expect(current_path).to eq(article_path(new_article))
      expect(page).to have_content("Newest Title Name!")
      expect(page).to have_content("New Body!")
      expect(page).to have_content("Article '#{new_article.title}' Updated!")

    end
  end
end