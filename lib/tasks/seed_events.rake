require 'open-uri'
require 'json'

namespace :update_db do
  desc "pull information from JSON file and update DB"
  task :seed_from_json => :environment do
    topics = ['Swift', 'Java', 'Ruby', 'Python', 'Javascript', 'C++', 'Php', 'Front-end']
    topics.each do |topic|
      topic = Topic.find_or_create_by(name: topic)
      getEvent(topic)
    end
  end

  def getEvent(topic)
    url = "https://www.eventbriteapi.com/v3/events/search/?q=#{topic.name}%20developers%20conference&token=#{Figaro.env.api_key}"
    results = JSON.parse(open(url).read)
    count = 1
    results["events"].each do |event|
      organizer = getOrganizer(event["organizer_id"])
      if event['venue_id']
        city = getCity(event['venue_id'])
        address = getAddress(event['venue_id'])
      end
      name = event["name"]["text"]
      description = event["description"]["text"]
      website = event["url"]
      date = event["start"]["utc"]
      image = event["logo"]? event["logo"]["url"] : "http://bento.cdn.pbs.org/hostedbento-prod/filer_public/_bento_media/img/no-image-available.jpg"
      event = Event.find_or_create_by(topic: topic, organizer: organizer, city: city,
                                      description: description, name: name, address: address,
                                      date: date, website: website, image: image)
      count = counter(count) #thiscounter is to let seeders know how many are there
    end
    puts "" #this is strictly to add a return after the counter
  end

  def getCity(id)
    url = "https://www.eventbriteapi.com/v3/venues/#{id}/?token=#{Figaro.env.api_key}"
    results = JSON.parse(open(url).read)
    City.find_or_create_by(name: results["address"]["localized_area_display"])
  end

  def getAddress(id)
    url = "https://www.eventbriteapi.com/v3/venues/#{id}/?token=#{Figaro.env.api_key}"
    results = JSON.parse(open(url).read)
    results["address"]["address_1"]
  end

  def getOrganizer(id)
    url = "https://www.eventbriteapi.com/v3/organizers/#{id}/?token=#{Figaro.env.api_key}"
    results = JSON.parse(open(url).read)
    Organizer.find_or_create_by(name: results["name"])
  end

  def counter(count)
    print "\r #{count}"
    count += 1
  end
end
