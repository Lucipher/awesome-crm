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

  before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

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

  def authenticate(password)
    begin
      in_derived_key = Digest::SHA256.hexdigest(password)

      in_salted_csk_decryptor = ActiveSupport::MessageEncryptor.new(in_derived_key, :cipher => 'aes-256-cbc')
      in_salted_csk = in_salted_csk_decryptor.decrypt(self.encrypted_password)

      in_password_salt = in_salted_csk[128..255]

      if in_password_salt == self.password_salt
        logger.debug "[User.self.authenticate] User authenticated"

        csk = in_salted_csk[0..127]
        db_password_decryptor = ActiveSupport::MessageEncryptor.new(csk, :cipher => 'aes-256-cbc')
        self.db_password = db_password_decryptor.decrypt(self.db_encrypted_password)

        return true
      else
        logger.debug "[User.self.authenticate] Authentication failed (salt mismatch)"
        return false
      end
    rescue
      logger.debug "[User.self.authenticate] Authentication failed (decryption failure)"
    end

    false
  end
end
