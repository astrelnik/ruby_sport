namespace :articles do
  desc 'some desc'
  task clean: :environment do
    puts 'Clean unpublished articles'
  end
end
