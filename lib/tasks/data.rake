namespace :data do
  # rake data:populate_city
  desc 'Populate city from json'
  task :populate_city => :environment do
    data_json = JSON.parse(File.read('app/assets/javascripts/city.list.json'))

    data_json.each do |data|
      City.create(name: data['name'], country: data['country'], code: data['id'], latitude: data['coord']['lat'], longitude: data['coord']['lon'])
    end
  end
end