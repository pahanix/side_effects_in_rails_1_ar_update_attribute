# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_non_obvious_rails_1_active_record_update_attribute_session',
  :secret      => 'f0be691740cd8f29426be6c36f79b8e0a354392b7fd2892337a4305237ea7410651d9e0cfe91c266316135ac9970d6d7b39d8d92955bac0c47f3c79fa5e39079'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
