require 'screenshot'
require 'open-uri'
require 'yaml'

settings = {:username => ENV["BROWSERSTACK_USERNAME"], :password => ENV["BROWSERSTACK_PASSWORD"]}
client = Screenshot::Client.new(settings)

# Grab latest list of possible browsers for reference
File.open("all_possible_browsers.yml", 'w'){|f| f.write(client.get_os_and_browsers.to_yaml)}

# To modify the browsers getting tested, update the browser hash below, along with the 
#    corresponding HTML in _posts/2016-05-26-update.md
params = {
    :url => "https://success.export.gov/search#/search?q=trade&_k=owl0t9",
    :win_res => "1280x1024",     #Options : "1024x768", "1280x1024"
    :mac_res => "1920x1080",    #Options : "1024x768", "1280x960", "1280x1024", "1600x1200", "1920x1080"
    :quality => "compressed",   #Options : "compressed", "original"
    :wait_time => 5,            #Options: 2, 5, 10, 15, 20, 60
    :orientation => "portrait", #Options: "portrait", "landscape"
    :tunnel => false,
    :browsers => [
            { os: "Windows", os_version: "10", browser: "ie", browser_version: "11.0" },
            { os: "Windows", os_version: "10", browser: "firefox", browser_version: "45.0" },
            { os: "Windows", os_version: "10", browser: "chrome", browser_version: "50.0" },
            { os: "Windows", os_version: "7", browser: "ie", browser_version: "10.0" },
            { os: "OS X", os_version: "El Capitan", browser: "safari", browser_version: "9.1" },
            { os: "ios", os_version: "8.3", device: "iPhone 6"},
            { os: "ios", os_version: "5.0", device: "iPad 2 (5.0)"},
            { os: "android", os_version: "4.4", device: "Samsung Galaxy S5"}
    ]
}

request_id = client.generate_screenshots(params)

while client.screenshots_done?(request_id) == false do
  puts "Waiting 10 seconds for job to finish..."
  sleep 10
end

puts "Waiting 10 more seconds to ensure job is finished..."
sleep 10

response = client.screenshots(request_id)

# Update the timestamp to show when screenshots were last grabbed:
File.open("_includes/browser-screenshots/timestamp.html", 'w'){|f| f.write(Time.now.strftime("%m/%d/%Y at %l:%M %p"))}

response.each do |entry|
  file_name = "images/browserstack/" + entry[:os] + "_" + entry[:os_version] + "_" +  entry[:browser] + "_" +  entry[:browser_version] + ".png"
  File.open(file_name, 'wb') do |fo|
    fo.write open(entry[:image_url]).read 
  end
end

