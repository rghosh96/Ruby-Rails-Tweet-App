# email:string
# password_digest:string
#
# password:string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
    # from rails; virtual password, not saved to db
    # runs thru bcrypt encryption to save as a hash
    # (have to uncomment in gem file)
    # we only deal with password & password confirmation,
    # and bcrypt converts it to the password_digest to
    # save in db
    has_secure_password

    # validations to make sure all fields are there
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Must be a valid email address!" }
end
