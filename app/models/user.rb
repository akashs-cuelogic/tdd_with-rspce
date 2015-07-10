class User < ActiveRecord::Base
    
    validates_presence_of :email
    validates_presence_of :username
    validates_uniqueness_of :username  
    validates_uniqueness_of :email
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create 
    

    def self.checkuser(username,pass)
        user = User.where("username = ? AND encrypted_password = ?", username, pass).first
        if user
            1
        else
            0
        end
    end

    def self.check_user_status(user)
        if (user.status == 1)
          return 1
        else
          return 0
        end
    end
    
    

end
