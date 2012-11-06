chai = require("chai")

apacroot = require("../lib/apacroot")

# Official Spec
# http://docs.amazonwebservices.com/AWSECommerceService/latest/DG/BrowseNodeIDs.html

describe "version", ->
  it "is 2011-08-01", ->
    chai.expect(apacroot.version()).to.equal("2011-08-01")

describe "endpoints", ->
  it "JP", ->
    chai.expect(apacroot.endpoint("JP")).to.equal("ecs.amazonaws.jp")

describe "cuontries", ->
  it "JP", ->
    chai.expect(apacroot.country("JP")).to.equal("Japan")


describe "locales", ->
  it "has all locales", ->
    chai.expect(apacroot.locales()).to.deep.equal([ 'CA', 'CN', 'DE', 'ES', 'FR', 'IT', 'JP', 'UK', 'US' ])

describe "categories", ->
  it "CA", ->
    locale = "CA"
    chai.expect(apacroot.categories(locale)).not.include("Automotive")
    chai.expect(apacroot.categories(locale)).to.include("Baby")

describe "rootnode", ->
  it "locale JP for all categories", ->
    chai.expect(apacroot.rootnodeOriginal("JP",'Apparel')).equals(361299011)
    chai.expect(apacroot.rootnodeOriginal("JP",'Appliances')).equals(2277724051)
    chai.expect(apacroot.rootnodeOriginal("JP","ArtsAndCrafts")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP",'Automotive')).equals(2017304051)
    chai.expect(apacroot.rootnodeOriginal("JP",'Baby')).equals(13331821)
    chai.expect(apacroot.rootnodeOriginal("JP",'Beauty')).equals(52391051)
    chai.expect(apacroot.rootnodeOriginal("JP",'Books')).equals(465610)
    chai.expect(apacroot.rootnodeOriginal("JP",'Classical')).equals(562032)
    chai.expect(apacroot.rootnodeOriginal("JP","Collectibles")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP","DigitalMusic")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP",'DVD')).equals(562002)
    chai.expect(apacroot.rootnodeOriginal("JP",'Electronics')).equals(3210991)
    chai.expect(apacroot.rootnodeOriginal("JP",'ForeignBooks')).equals(388316011)
    chai.expect(apacroot.rootnodeOriginal("JP","Garden")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP","GourmetFood")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP",'Grocery')).equals(57239051)
    chai.expect(apacroot.rootnodeOriginal("JP",'HealthPersonalCare')).equals(161669011)
    chai.expect(apacroot.rootnodeOriginal("JP",'Hobbies')).equals(13331821)
    chai.expect(apacroot.rootnodeOriginal("JP","Home")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP","HomeGarden")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP","HomeImprovement")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP","Industrial")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP",'Jewelry')).equals(85896051)
    chai.expect(apacroot.rootnodeOriginal("JP","KindleStore")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP",'Kitchen')).equals(3839151)
    chai.expect(apacroot.rootnodeOriginal("JP","Lighting")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP","Magazines")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP","Miscellaneous")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP","MobileApps")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP",'MP3Downloads')).equals(2128134051)
    chai.expect(apacroot.rootnodeOriginal("JP",'Music')).equals(562032)
    chai.expect(apacroot.rootnodeOriginal("JP",'MusicalInstruments')).equals(2123629051)
    chai.expect(apacroot.rootnodeOriginal("JP","OfficeProducts")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP","OutdoorLiving")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP","PCHardware")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP","PetSupplies")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP","Photo")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP",'Shoes')).equals(2016926051)
    chai.expect(apacroot.rootnodeOriginal("JP",'Software')).equals(637630)
    chai.expect(apacroot.rootnodeOriginal("JP","SoftwareVideoGames")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP",'SportingGoods')).equals(14304371)
    chai.expect(apacroot.rootnodeOriginal("JP","Tools")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP",'Toys')).equals(13331821)
    chai.expect(apacroot.rootnodeOriginal("JP",'VHS')).equals(2130989051)
    chai.expect(apacroot.rootnodeOriginal("JP",'Video')).equals(561972)
    chai.expect(apacroot.rootnodeOriginal("JP",'VideoGames')).equals(637872)
    chai.expect(apacroot.rootnodeOriginal("JP",'Watches')).equals(324025011)
    chai.expect(apacroot.rootnodeOriginal("JP","Wireless")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP","WirelessAccessories")).to.be.an('undefined');

  it "category Jewelry for all locales", ->
    chai.expect(apacroot.rootnodeOriginal("CA","Jewelry")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("CN","Jewelry")).to.equals(816482051)
    chai.expect(apacroot.rootnodeOriginal("DE","Jewelry")).to.equals(327473011)
    chai.expect(apacroot.rootnodeOriginal("ES","Jewelry")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("FR","Jewelry")).to.equals(193711031)
    chai.expect(apacroot.rootnodeOriginal("IT","Jewelry")).to.be.an('undefined');
    chai.expect(apacroot.rootnodeOriginal("JP","Jewelry")).to.equals(85896051)
    chai.expect(apacroot.rootnodeOriginal("UK","Jewelry")).to.equals(193717031)
    chai.expect(apacroot.rootnodeOriginal("US","Jewelry")).to.equals(3880591)