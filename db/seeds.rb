# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Champ.destroy_all
Skin.destroy_all

Wish.destroy_all
UserChamp.destroy_all
Friendship.destroy_all

user_a = User.create(username: "usera", password: "a")
user_b = User.create(username: "userb", password: "b")
user_c = User.create(username: "userc", password: "c")

Friendship.create(user: User.find_by(username: "usera"), friend: User.find_by(username: "userb"))
Friendship.create(user: User.find_by(username: "usera"), friend: User.find_by(username: "userc"))
Friendship.create(user: User.find_by(username: "userb"), friend: User.find_by(username: "usera"))



# fri_ab = Friendship.create(user: user_a)

all_league_text = RestClient.get("http://ddragon.leagueoflegends.com/cdn/10.3.1/data/en_US/champion.json")
all_league_info = JSON.parse(all_league_text)

all_champ_info = all_league_info["data"]

# map over all champion information to attach images and name to create champs
champions_all = all_champ_info.map do |champion, info|
    Champ.create(name: info["name"], icon_img: "http://ddragon.leagueoflegends.com/cdn/10.3.1/img/champion/#{champion}.png")
end

# connect users to all champions
user_champs = champions_all.map do |champion|
    UserChamp.create(user: user_a, champ: champion)
    UserChamp.create(user: user_b, champ: champion)
    UserChamp.create(user: user_c, champ: champion)   
end

# #array of champ names
arr_champs = all_champ_info.map do |champion, info|    
    info["name"]
end

# champ_json = arr_champs.map do |champ|
champ_json = all_champ_info.map do |champion, info|
    url_ready_name = info["name"].split.join
    
    champ_find = Champ.find_by(name: "#{info["name"]}")

    champ_text = RestClient.get("http://ddragon.leagueoflegends.com/cdn/10.3.1/data/en_US/champion/#{champion}.json")
    champ_info = JSON.parse(champ_text)

    all_champ_info = champ_info["data"]["#{champion}"]["skins"]

    champ_skins = all_champ_info.map do |skin|
        # skins["name"]
        dbChamp = Champ.find_by(name: "#{info["name"]}")
        # p champion
        # p skin["name"]
        # p "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/#{champion}_#{skin["num"]}.jpg"
        # p "http://ddragon.leagueoflegends.com/cdn/img/champion/loading/#{champion}_#{skin["num"]}.jpg" 
        # p chimp

        skin = Skin.create(
            name: skin["name"], 
            splash_img: "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/#{champion}_#{skin["num"]}.jpg", 
            loading_img: "http://ddragon.leagueoflegends.com/cdn/img/champion/loading/#{champion}_#{skin["num"]}.jpg", 
            champ: dbChamp
        )
    end
    p "`````````````````"
    p all_champ_info
    p "`````````````````"
    
end

50.times do
    Wish.create(
        user: User.all.sample,
        skin: Skin.all.sample
    )
end