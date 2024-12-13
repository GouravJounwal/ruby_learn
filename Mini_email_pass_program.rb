Email ="gojo@.com"
Password = "1234" #this are constants
Password_valt = { aws: { "username" => "gourav", "password" => "1234" }, google: { "username" => "gourav", "password" => "1234" }, Microsoft: { "username" => "gourav", "password" => "1234" } }

def welcome
    print "welcome to my app of email validation and password validation"
end

def promt_email
    puts "enter your email: "
    email = gets.chomp
    return email
end

def email_validation(user_email)
    if user_email != Email
        puts "invalid email"
        exit
    end
end 

def promt_password
    print "enter your password: "
    password = gets.chomp
    return password
end

def password_validation(user_password)
    if user_password != Password
        puts "invalid password"
        return "invalid password"
    else
        print "Welcome here"
        exit
    end
end

def greet(user_email)
    puts "hello #{user_email}"
    print "what would you like to do?"
end     

def menu
    puts "1. create new service"
    puts "2. get credentials of services"
    puts "3. exit"
    print "enter your choice: "
    choice = gets.chomp
    return choice
end

def handel_user_selection(choice)
    case choice
    when "1"
        new_service=set_new_service_name
        set_email_for(new_service)
        set_password_for(new_service)
    when "2"
        requested_service=retrive_service_name
        credentials=retrive_service_name_cred(requested_service)
        desplay_service_cred(requested_service,credentials)
    when "3"
        exit_program
    end
end

def set_new_service_name
    print "enter name of service:"
    new_service = gets.chomp
    Password_valt[new_service.to_sym]= {}
    return new_service
end

def set_email_for(new_service) 
    print "enter username for this new service :"
    new_service_username = gets.chomp
    Password_valt[new_service.to_sym][:username]=new_service_username
    
end
def set_password_for(new_service) 
    print "enter password for this new service :"
    new_service_password = gets.chomp
    Password_valt[new_service.to_sym][:password]=new_service_password

end

def retrive_service_name
    print "enter  service you want credentials for AWS, Google , Microsoft to retrive:"
    cred_for_new_service=gets.chomp
    return cred_for_new_service
end

def retrive_service_name_cred(service_name)
    Password_valt[service_name.to_sym]
end

def desplay_service_cred(service_name,credentials)
    print "Here's cred you ask for:"
    credentials.each do |key,value|
        puts "#{key}:#{value}"
    end
end

def exit_program
    puts "thats all form our side"
    exit
end

welcome
user_email=promt_email
email_validation(user_email)
user_password=promt_password

check=password_validation(user_password)
puts "after validation #{check}"
if check == "invalid password"
    greet(user_email)
    choice=menu
    handel_user_selection(choice)
    exit
end
