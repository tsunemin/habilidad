# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
# if add new css or js exec this command.
# bundle exec rake assets:clobber
Rails.application.config.assets.precompile += %w( commons/commons.css )
Rails.application.config.assets.precompile += %w( commons/commons.js )
Rails.application.config.assets.precompile += %w( commons/header.css )
Rails.application.config.assets.precompile += %w( commons/footer.css )
Rails.application.config.assets.precompile += %w( commons/error_messages.css )
Rails.application.config.assets.precompile += %w( mailers/mailer.css )
Rails.application.config.assets.precompile += %w( mailers/request_registration.css )
Rails.application.config.assets.precompile += %w( views/certifications.css )
Rails.application.config.assets.precompile += %w( views/certifications.js )
Rails.application.config.assets.precompile += %w( views/businesses.css )
Rails.application.config.assets.precompile += %w( views/businesses.js )
Rails.application.config.assets.precompile += %w( views/clients.css )
Rails.application.config.assets.precompile += %w( views/clients.js )
Rails.application.config.assets.precompile += %w( views/top.css )
Rails.application.config.assets.precompile += %w( views/account.css )
Rails.application.config.assets.precompile += %w( views/account.js )
