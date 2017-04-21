namespace :update_db do
  desc "pull information from JSON file and update DB"
  task :seed_from_json => :environment do
    require 'open-uri'
    require 'json'
    url = "https://www.eventbriteapi.com/v3/events/search/?q=developers%20conference&token=CV7XEC5IT6GB6M6RF236"
    results = JSON.parse(open(url).read)
    count = 1
    results["events"].each do |event|
      topic = getTopic(event["category_id"])
      organizer = getOrganizer(event["organizer_id"])
      name = event["name"]["text"]
      description = event["description"]["text"]
      website = event["url"]
      date = event["start"]["utc"]
      event = Event.find_or_create_by(topic: topic, organizer: organizer,
                                      description: description, name: name,
                                      date: date, website: website)
      count = counter(count) #thiscounter is to let seeders know how many are there
    end
    puts "" #this is strictly to add a return aftr the counter
  end

  def getTopic(id)
    url = "https://www.eventbriteapi.com/v3/categories/#{id}/?token=AAXEJJLQI5U46AHOIFSE"
    results = JSON.parse(open(url).read)
    Topic.find_or_create_by(name: results["name"])
  end

  def getOrganizer(id)
    url = "https://www.eventbriteapi.com/v3/organizers/#{id}/?token=AAXEJJLQI5U46AHOIFSE"
    results = JSON.parse(open(url).read)
    Organizer.find_or_create_by(name: results["name"])
  end

  def counter(count)
    print "\r #{count}"
    count += 1
  end
end
