require "rails_helper"

RSpec.describe "GET api/v1/items" do
  it "returns list of all items" do
    Item.create(name: "Hammer", description: "It hammers", image_url: "www.google.com")

    get "api/v1/items"

    expect(response.status).to eq 200
    body = parse(response.body).first

    expect(body["name"]).to eq "Hammer"
    expect(body["description"]).to eq "It hammers"
    expect(body["image_url"]).to eq "www.google.com"
  end

  it "GET api/v1/items/1" do
    Item.create(name: "Hammer", description: "It hammers", image_url: "www.google.com")

    get "api/v1/items/1"

    expect(response.status).to eq 200

    body = parse(response.body)

    expect(body["name"]).to eq "Hammer"
    expect(body["description"]).to eq "It hammers"
    expect(body["image_url"]).to eq "www.google.com"
  end

  it "DELETE api/v1/items/1" do
    Item.create(name: "Hammer", description: "It hammers", image_url: "www.google.com")

    delete 'api/v1/items/1'

    expect(response.status).to eq 204

  end

  it "POST api/v1/items" do

    post 'api/v1/items?name=Hammer&description=It-Hammers&image_url=www.google.com'

    expect(response.status).to eq 201
  end
end
