Trail.destroy_all

response = RestClient.get("https://www.mtbproject.com/data/get-trails?lat=39.6965&lon=-105.1002&maxDistance=100&maxResults=100&key=4790190-4582a5581cccc3d3274321dca72ea4b1")
result = JSON.parse(response)

result["trails"].each do |trail|
    Trail.create(
        mtb_project_id: trail['id'],
        name: trail['name'],
        difficulty: trail['difficulty'],
        location: trail['location'],
        url: trail['url'],
        length: trail['length'],
        ascent: trail['ascent'],
        longitude: trail['longitude'],
        latitude: trail['latitude'],
        condition_status: trail['conditionStatus'],
        condition_details: trail['conditionDetails'],
        condition_date: trail['conditionDate']
    )
end

# example_user_seed = User.create(name: "Example", username: "Example", email: "Example", password: "password")
# example_trail_seed = Trail.create(
#         mtb_project_id: 1,
#         name: "example",
#         difficulty: "example",
#         location: "example",
#         url: "example",
#         length: 1,
#         ascent: 1,
#         longitude: 1,
#         latitude: 1,
#         condition_status: "example",
#         condition_details: "example",
#         condition_date: "example"
# )
# example_user_trail_seed = UserTrail.create(user: example_user_seed, trail: example_trail_seed)
