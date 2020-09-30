require 'rest-client' # actually let you hit the endpoint 
require 'json' # parse the response body into a form you can use 
require 'pry'

User.create({ name: "Javaughn" })
User.create({ name: "Liam" })
Enemy.create({ name: "Cell", health: 120 })
Goku.create ({ user_id: 1, health: 100, honor: 4 })
Goku.create ({ user_id: 1, health: 100, honor: 4 })
Battle.create ({ name: "Fight Cell!", goku_id: 1, user_id: 1, enemy_id: 2 })
# binding.pry