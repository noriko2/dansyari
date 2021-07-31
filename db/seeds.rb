sample_user = User.create!(user_name: "Dansyari Dekiru",
  email: "dansyari@example.com",
  password:              "dansyari",
  password_confirmation: "dansyari",
  # メール認証をスキップ (deviseのconfimableを確認済にする)
  confirmed_at: Time.now
)

100.times do |n|
  post = sample_user.posts.build(
    caption: "【 サンプル記録__#{n + 1} 】 ナイキスニーカー。靴の中に穴があいていたため断捨離。"
  )
  post.build_photo( image: File.open("./app/javascript/images/shoes.jpeg") )
  post.save
end
