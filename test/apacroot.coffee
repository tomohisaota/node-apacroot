chai = require("chai")

apacroot = require("../lib/apacroot")

# Official Spec
# http://docs.amazonwebservices.com/AWSECommerceService/latest/DG/BrowseNodeIDs.html

describe "regions", ->
  it "has all regions", ->
    chai.expect(apacroot.regions()).to.deep.equal([ 'CA', 'CN', 'DE', 'ES', 'FR', 'IT', 'JP', 'UK', 'US' ])

describe "categories", ->
  it "CA", ->
    region = "CA"
    chai.expect(apacroot.categories(region)).not.include("Automotive")
    chai.expect(apacroot.categories(region)).to.include("Baby")

describe "rootnode", ->
  it "region JP for all categories", ->
    chai.expect(apacroot.rootnode("JP",'Apparel')).equals(361299011)
    chai.expect(apacroot.rootnode("JP",'Appliances')).equals(2277724051)
    chai.expect(apacroot.rootnode("JP","ArtsAndCrafts")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP",'Automotive')).equals(2017304051)
    chai.expect(apacroot.rootnode("JP",'Baby')).equals(13331821)
    chai.expect(apacroot.rootnode("JP",'Beauty')).equals(52391051)
    chai.expect(apacroot.rootnode("JP",'Books')).equals(465610)
    chai.expect(apacroot.rootnode("JP",'Classical')).equals(562032)
    chai.expect(apacroot.rootnode("JP","Collectibles")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP","DigitalMusic")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP",'DVD')).equals(562002)
    chai.expect(apacroot.rootnode("JP",'Electronics')).equals(3210991)
    chai.expect(apacroot.rootnode("JP",'ForeignBooks')).equals(388316011)
    chai.expect(apacroot.rootnode("JP","Garden")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP","GourmetFood")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP",'Grocery')).equals(57239051)
    chai.expect(apacroot.rootnode("JP",'HealthPersonalCare')).equals(161669011)
    chai.expect(apacroot.rootnode("JP",'Hobbies')).equals(13331821)
    chai.expect(apacroot.rootnode("JP","Home")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP","HomeGarden")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP","HomeImprovement")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP","Industrial")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP",'Jewelry')).equals(85896051)
    chai.expect(apacroot.rootnode("JP","KindleStore")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP",'Kitchen')).equals(3839151)
    chai.expect(apacroot.rootnode("JP","Lighting")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP","Magazines")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP","Miscellaneous")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP","MobileApps")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP",'MP3Downloads')).equals(2128134051)
    chai.expect(apacroot.rootnode("JP",'Music')).equals(562032)
    chai.expect(apacroot.rootnode("JP",'MusicalInstruments')).equals(2123629051)
    chai.expect(apacroot.rootnode("JP","OfficeProducts")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP","OutdoorLiving")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP","PCHardware")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP","PetSupplies")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP","Photo")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP",'Shoes')).equals(2016926051)
    chai.expect(apacroot.rootnode("JP",'Software')).equals(637630)
    chai.expect(apacroot.rootnode("JP","SoftwareVideoGames")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP",'SportingGoods')).equals(14304371)
    chai.expect(apacroot.rootnode("JP","Tools")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP",'Toys')).equals(13331821)
    chai.expect(apacroot.rootnode("JP",'VHS')).equals(2130989051)
    chai.expect(apacroot.rootnode("JP",'Video')).equals(561972)
    chai.expect(apacroot.rootnode("JP",'VideoGames')).equals(637872)
    chai.expect(apacroot.rootnode("JP",'Watches')).equals(324025011)
    chai.expect(apacroot.rootnode("JP","Wireless")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP","WirelessAccessories")).to.be.an('undefined');

  it "category Jewelry for all regions", ->
    chai.expect(apacroot.rootnode("CA","Jewelry")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("CN","Jewelry")).to.equals(816482051)
    chai.expect(apacroot.rootnode("DE","Jewelry")).to.equals(327473011)
    chai.expect(apacroot.rootnode("ES","Jewelry")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("FR","Jewelry")).to.equals(193711031)
    chai.expect(apacroot.rootnode("IT","Jewelry")).to.be.an('undefined');
    chai.expect(apacroot.rootnode("JP","Jewelry")).to.equals(85896051)
    chai.expect(apacroot.rootnode("UK","Jewelry")).to.equals(193717031)
    chai.expect(apacroot.rootnode("US","Jewelry")).to.equals(3880591)