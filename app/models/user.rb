require 'digest/sha2'

class User < ActiveRecord::Base
  set_table_name "CRM.USERS"
  self.sequence_name = "CRM.USERS_SEQ"

  attr_accessor :password, :db_password
  before_save :encrypt_password

  validates_confirmation_of :password, :db_password
  validates_presence_of :password, :on => :create
  validates_presence_of :username
  validates_uniqueness_of :username

  attr_accessible :username, :password, :password_confirmation, :db_username, :db_password, :db_password_confirmation

  def encrypt_password
    if password.present?
      self.password_salt = SecureRandom.hex(64)
      derived_key = Digest::SHA256.hexdigest(password)
      csk = SecureRandom.hex(64)

      password_encryptor = ActiveSupport::MessageEncryptor.new(derived_key, :cipher => 'aes-256-cbc')
      self.encrypted_password = password_encryptor.encrypt(csk + password_salt)

      db_password_encryptor = ActiveSupport::MessageEncryptor.new(csk, :cipher => 'aes-256-cbc')
      self.db_encrypted_password = db_password_encryptor.encrypt(db_password)
    end
  end

  def self.authenticate(username, password)
    user = find_by_username(username)
    if user
      begin
        in_derived_key = Digest::SHA256.hexdigest(password)

        in_salted_csk_decryptor = ActiveSupport::MessageEncryptor.new(in_derived_key, :cipher => 'aes-256-cbc')
        in_salted_csk = in_salted_csk_decryptor.decrypt(user.encrypted_password)

        in_password_salt = in_salted_csk[128..255]

        if in_password_salt == user.password_salt
          logger.debug "[User.self.authenticate] User authenticated"

          csk = in_salted_csk[0..127]
          db_password_decryptor = ActiveSupport::MessageEncryptor.new(csk, :cipher => 'aes-256-cbc')
          user.db_password = db_password_decryptor.decrypt(user.db_encrypted_password)

          user
        else
          logger.debug "[User.self.authenticate] Authentication failed (salt mismatch)"
          nil
        end
      rescue
        logger.debug "[User.self.authenticate] Authentication failed (decryption failure)"
        nil
      end
    else
      nil
    end
  end
end
