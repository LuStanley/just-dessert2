namespace :dev do
  # 請先執行 rails dev:fake_dessert，可以產生 15 個資料完整的 dessert 紀錄
  task fake_dessert: :environment do
    Dessert.destroy_all

    15.times do |i|
      file = File.open("#{Rails.root}/public/desserts_image/dessert#{i+1}.jpg")
      location = ["臺北火車站",
        "臺中火車站",
        "高雄火車站",
        "士林捷運站",
        "大安捷運站",
        "板橋捷運站",
        "內湖捷運站"
      ]
      time_mounth = FFaker::Time.between(Time.now, Time.now + 1.months)
      production_time = rand(1..5)

      Dessert.create!(name: FFaker::Name.first_name + "的手工甜點",
        amount: rand(1..10),
        location: location.sample,
        price: 500,
        description: FFaker::Lorem.paragraph,
        user_id: User.all.sample.id,
        image: file,
        production_time: production_time.to_s + "天",
        excess_time: time_mounth,
        pick_time: time_mounth + production_time.day + 1.day 
      )
    end
    puts "have created #{Dessert.count} fake desserts"
  end
end