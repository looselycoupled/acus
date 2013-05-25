require 'open-uri'

20.times do
  Resource.seed(:title) do |r|
    r.title = Faker::Company::catch_phrase
    r.teaser = Faker::Lorem::paragraph(rand(3..5))
    r.content = Faker::Lorem::paragraphs(rand(2..4)).map{|p| "<p>#{p}</p>"}.join
    r.photo = OpenURI.open_uri("http://lorempixel.com/200/200/abstract/")
  end
end