# http://docs.amazonwebservices.com/AWSECommerceService/latest/DG/BrowseNodeIDs.html
data = '''
	CA	CN	DE	ES	FR	IT	JP	UK	US
Apparel	 	2016156051	78689031	 	340855031	 	361299011	83451031	1036592
Appliances	 	80207071	 	 	 	 	2277724051	 	2619525011
ArtsAndCrafts	 	 	 	 	 	 	 	 	2617941011
Automotive	 	1947899051	78194031	 	 	 	2017304051	248877031	15690151
Baby	3561346011	 	357577011	 	206617031	1571286031	13331821	60032031	165796011
Beauty	 	746776051	64257031	 	197858031	 	52391051	66280031	11055981
Books	927726	658390051	541686	599364031	468256	411663031	465610	1025612	1000
Classical	962454	 	542676	 	537366	 	562032	505510	301668
Collectibles	 	 	 	 	 	 	 	 	4991425011
DigitalMusic	 	 	 	 	 	 	 	 	195208011
DVD	14113311	 	547664	599379031	578608	412606031	562002	283926	2625373011
Electronics	677211011	2016116051	569604	667049031	1058082	412609031	3210991	560800	493964
ForeignBooks	927726	 	54071011	599367031	69633011	433842031	388316011	 	 
Garden	 	 	 	 	 	635016031	 	 	 
GourmetFood	 	 	 	 	 	 	 	 	3580501
Grocery	 	2127215051	340846031	 	 	 	57239051	340834031	16310101
HealthPersonalCare	 	852803051	64257031	 	197861031	 	161669011	66280031	3760931
Hobbies	 	 	 	 	 	 	13331821	 	 
Home	 	2016126051	 	 	 	 	 	 	 
HomeGarden	 	 	10925241	 	 	 	 	11052591	285080
HomeImprovement	 	1952920051	 	 	590748031	 	 	2016929051	 
Industrial	 	 	 	 	 	 	 	 	228239
Jewelry	 	816482051	327473011	 	193711031	 	85896051	193717031	3880591
KindleStore	 	 	530484031	530484031	818936031	818937031	 	341677031	133141011
Kitchen	2206275011	 	3169011	599391031	57686031	524015031	3839151	11052591	1063498
Lighting	 	 	213083031	 	213080031	1571292031	 	213077031	 
Magazines	 	 	1198526	 	 	 	 	 	599872
Miscellaneous	 	899280051	 	 	 	 	 	 	10304191
MobileApps	 	 	 	 	 	 	 	 	2350149011
MP3Downloads	 	 	77256031	 	206442031	 	2128134051	77198031	195211011
Music	962454	754386051	542676	599373031	537366	412600031	562032	505510	301668
MusicalInstruments	 	 	340849031	 	340862031	 	2123629051	340837031	11091801
OfficeProducts	 	2127221051	16291311	 	192420031	 	 	560800	1084128
OutdoorLiving	 	 	10925051	 	 	 	 	11052591	1063498
PCHardware	 	 	569604	 	 	 	 	 	493964
PetSupplies	 	 	 	 	 	 	 	 	1063498
Photo	 	755653051	569604	 	 	 	 	 	493964
Shoes	 	2029189051	 	 	215934031	524006031	2016926051	 	 
Software	3234171	863872051	542064	599376031	548012	412612031	637630	1025614	409488
SoftwareVideoGames	3323751	 	541708	 	548014	 	 	1025616	 
SportingGoods	 	836312051	16435121	 	 	 	14304371	319530011	3375251
Tools	 	 	 	 	 	 	 	11052591	468240
Toys	 	647070051	12950661	599385031	548014	523997031	13331821	712832	493964
VHS	962072	 	547082	 	578610	 	2130989051	283926	404272
Video	962454	2016136051	547664	 	578608	 	561972	283926	130
VideoGames	110218011	897415051	541708	599382031	548014	412603031	637872	1025616	493964
Watches	 	1953164051	193708031	599388031	60937031	524009031	324025011	595312	377110011
Wireless	 	 	 	 	 	 	 	 	508494
WirelessAccessories	 	 	 	 	 	 	 	 	13900851
'''

lines = data.split(/\n/)
locales = lines.shift().split(/\t/)
nodes = {}
for locale in locales
  nodes[locale] = {}

for line in lines
  items = line.split(/\t/)
  key = items.shift(items)
  for index,code of items
    continue if(code == " ")
    nodes[[locales[index]]][key] = parseInt(code)

#http://docs.amazonwebservices.com/AWSECommerceService/latest/DG/AnatomyOfaRESTRequest.html
#But it seems that some of endpoints does not work
endpoints = {}
endpoints["CA"] = "ecs.amazonaws.ca"
endpoints["CN"] = "webservices.amazon.cn"
endpoints["DE"] = "ecs.amazonaws.de"
endpoints["ES"] = "webservices.amazon.es"
endpoints["FR"] = "ecs.amazonaws.fr"
endpoints["IT"] = "webservices.amazon.it"
endpoints["JP"] = "ecs.amazonaws.jp"
endpoints["UK"] = "ecs.amazonaws.co.uk"
endpoints["US"] = "ecs.amazonaws.com"

exports.version =->
  return "2011-08-01"

# Deprecated
exports.regions =->
  return Object.keys(nodes)

exports.locales =->
  return Object.keys(nodes)
  
exports.endpoint = (locale)->
  return endpoints[locale]

exports.categories = (locale)->
  return Object.keys(nodes[locale])
  
exports.rootnode = (locale,category)->
  return nodes[locale][category]