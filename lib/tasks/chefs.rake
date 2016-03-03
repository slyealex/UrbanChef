 namespace :chefs do
   desc "Set long/lat coords for all chefs w/o them"
   task :update_coordinates => :environment do
     chefs = Chef.where(longitude: nil, latitude: nil)
     chefs.each do |c|
       c.geocode

       if c.save
         puts "#{c.name} was updated"
       else
         puts "There was an issue saving a chef #{c.name} with id #{c.id}"
       end
     end
   end

end
 
