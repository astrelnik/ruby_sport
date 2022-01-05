namespace :articles do
  desc 'some desc'
  task clean: :environment do
    Article.removeUnpublished

    puts 'Unpublished articles have been removed!'
  end
end
