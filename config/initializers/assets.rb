# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

Rails.application.config.assets.precompile += %w( new.css )

Rails.application.config.assets.precompile += %w( show.css )

Rails.application.config.assets.precompile += %w( global.css )

Rails.application.config.assets.precompile += %w( footer.css )
Rails.application.config.assets.precompile += %w( index.css )
Rails.application.config.assets.precompile += %w( addedplaces.css )
Rails.application.config.assets.precompile += %w( commentform.css )
Rails.application.config.assets.precompile += %w( jquery-ui.scss )
Rails.application.config.assets.precompile += %w( navbar.css )


# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( application.js session.js facebook.js google.js session.css edit.css)

Rails.application.config.assets.precompile += %w( login.js login.css login.edit.css login.index.css)
