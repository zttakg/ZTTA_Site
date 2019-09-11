task safety_db: [:environment] do
  raise 'You can\'t do it, because migrations run only in ERP!'
end

Rake::Task['db:load_config'].enhance ['safety_db'] unless Rails.env.test?
