namespace :promotion_code do
  desc "100円-1000円引きのプロモーションコードを10個生成するタスク"
  task generate: :environment do
    10.times do |n|
      code = SecureRandom.alphanumeric(7)
      discount_rate = rand(100..1000)
      promotion = Promotion.new(
        code: code,
        discount_rate: discount_rate,
      )
     promotion.save!
    end
  end
end
