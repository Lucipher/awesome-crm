class Session < ActiveRecord::Base
  self.table_name = "CRM.SESSIONS"
  self.sequence_name = "CRM.SESSIONS_SEQ"

  attr_accessor :session_key
  attr_accessible :cookie_id, :db_encrypted_password

  def self.generate(db_password)
    session = Session.new
    session.cookie_id = SecureRandom.hex(64)
    session.session_key = SecureRandom.hex(64)

    db_password_encryptor = ActiveSupport::MessageEncryptor.new(session.session_key, :cipher => 'aes-256-cbc')
    session.db_encrypted_password = db_password_encryptor.encrypt(db_password)

    session
  end

  def self.get_db_password(cookie_id, session_key)
    begin
      session = Session.find_by_cookie_id(cookie_id)

      if session.nil?
        logger.debug "[Session.self.get_db_password] Invalid db_session_id"
        return ""
      end

      db_password_decryptor = ActiveSupport::MessageEncryptor.new(session_key, :cipher => 'aes-256-cbc')
      db_password_decryptor.decrypt(session.db_encrypted_password)
    rescue
      ""
    end
  end
end
