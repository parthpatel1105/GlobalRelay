//
//  CountryDetails.swift
//  Global Relay
//
//  Created by Parth Patel on 07/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import Foundation

class CountryDetails {
    var name: String
    var country: [Country]
    
    init(named: String, includeCountry: [Country])
    {
        name = named
        country = includeCountry
    }
    
    class func countryDetails() -> [CountryDetails]
    {
        return [self.FirstSection(), self.SecondSection()]
    }
    
    private class func FirstSection() -> CountryDetails {
        
        var country = [Country]()
        
        country.append(Country(titled: "Canada", description: "Canada is a country in the northern part of North America. Its ten provinces and three territories extend from the Atlantic to the Pacific and northward into the Arctic Ocean, covering 9.98 million square kilometres, making it the world's second-largest country by total area.", imageName: "canada"))
        country.append(Country(titled: "USA", description: "The U.S. is a country of 50 states covering a vast swath of North America, with Alaska in the northwest and Hawaii extending the nation’s presence into the Pacific Ocean. Major Atlantic Coast cities are New York, a global finance and culture center, and capital Washington, DC. Midwestern metropolis Chicago is known for influential architecture and on the west coast, Los Angeles' Hollywood is famed for filmmaking.", imageName: "usa"))
        country.append(Country(titled: "United Kingdom", description: "The United Kingdom, made up of England, Scotland, Wales and Northern Ireland, is an island nation in northwestern Europe. England – birthplace of Shakespeare and The Beatles – is home to the capital, London, a globally influential centre of finance and culture. England is also site of Neolithic Stonehenge, Bath’s Roman spa and centuries-old universities at Oxford and Cambridge.", imageName: "uk"))
        country.append(Country(titled: "Italy", description: "Italy, a European country with a long Mediterranean coastline, has left a powerful mark on Western culture and cuisine. Its capital, Rome, is home to the Vatican as well as landmark art and ancient ruins. Other major cities include Florence, with Renaissance masterpieces such as Michelangelo’s David and Brunelleschi's Duomo; Venice, the city of canals; and Milan, Italy’s fashion capital.", imageName: "italy"))
        country.append(Country(titled: "France", description: "France, in Western Europe, encompasses medieval cities, alpine villages and Mediterranean beaches. Paris, its capital, is famed for its fashion houses, classical art museums including the Louvre and monuments like the Eiffel Tower. The country is also renowned for its wines and sophisticated cuisine. Lascaux’s ancient cave drawings, Lyon’s Roman theater and the vast Palace of Versailles attest to its rich history.", imageName: "france"))
        country.append(Country(titled: "Poland", description: "Poland, officially the Republic of Poland, is a country located in Central Europe. It is divided into 16 administrative subdivisions, covering an area of 312,696 square kilometres, and has a largely temperate seasonal climate.", imageName: "poland"))
        country.append(Country(titled: "Switzerland", description: "Switzerland is a mountainous Central European country, home to numerous lakes, villages and the high peaks of the Alps. Its cities contain medieval quarters, with landmarks like capital Bern’s Zytglogge clock tower and Lucerne’s wooden chapel bridge. The country is also known for its ski resorts and hiking trails. Banking and finance are key industries, and Swiss watches and chocolate are world renowned.", imageName: "switzer"))
        country.append(Country(titled: "Germany", description: "Germany is a Western European country with a landscape of forests, rivers, mountain ranges and North Sea beaches. It has over 2 millennia of history. Berlin, its capital, is home to art and nightlife scenes, the Brandenburg Gate and many sites relating to WWII. Munich is known for its Oktoberfest and beer halls, including the 16th-century Hofbräuhaus. Frankfurt, with its skyscrapers, houses the European Central Bank.", imageName: "germany"))
        country.append(Country(titled: "Netherlands", description: "The Netherlands, a country in northwestern Europe, is known for a flat landscape of canals, tulip fields, windmills and cycling routes. Amsterdam, the capital, is home to the Rijksmuseum, Van Gogh Museum and the house where Jewish diarist Anne Frank hid during WWII. Canalside mansions and a trove of works from artists including Rembrandt and Vermeer remain from the city's 17th-century Golden Age.", imageName: "netherland"))

        
        return CountryDetails(named: "North America & Europe", includeCountry: country)
    }
    
    private class func SecondSection() -> CountryDetails
    {
        var country = [Country]()
        
        country.append(Country(titled: "Japan", description: "The thinnest and lightest Mac ever with every component meticulously redesigned to create a Mac that is just two pounds and 13.1 mm thin. ", imageName: "japan"))
        country.append(Country(titled: "India", description: "India, officially the Republic of India, is a country in South Asia. It is the second-most populous country, the seventh-largest country by area, and the most populous democracy in the world.", imageName: "india"))
        country.append(Country(titled: "United Arab Emirates", description: "The United Arab Emirates, sometimes simply called the Emirates, is a country in Western Asia at the northeast end of the Arabian Peninsula on the Persian Gulf, bordering Oman to the east and Saudi Arabia to the south and west, as well as sharing maritime borders with Qatar to the west and Iran to the north.", imageName: "uae"))
        country.append(Country(titled: "Singapore", description: "Singapore, officially the Republic of Singapore, is a sovereign city-state and island country in maritime Southeast Asia. It lies about one degree of latitude north of the equator, off the southern tip of the Malay peninsula, and, by extension, the southernmost extremity of continental Eurasia.", imageName: "singapore"))
        country.append(Country(titled: "Turkey", description: "Turkey, officially the Republic of Turkey, is a transcontinental country located mainly on the Anatolian peninsula in Western Asia, with a smaller portion on the Balkan peninsula in Southeastern Europe.", imageName: "turkey"))
        country.append(Country(titled: "Israel", description: "Israel, a Middle Eastern country on the Mediterranean Sea, is regarded by Jews, Christians and Muslims as the biblical Holy Land. Its most sacred sites are in Jerusalem. Within its Old City, the Temple Mount complex includes the Dome of the Rock shrine, the historic Western Wall, Al-Aqsa Mosque and the Church of the Holy Sepulchre. Israel's financial hub, Tel Aviv, is known for its Bauhaus architecture and beaches.", imageName: "israel"))
        country.append(Country(titled: "Philippines", description: "The Philippines, officially the Republic of the Philippines, is an archipelagic country in Southeast Asia. Situated in the western Pacific Ocean, it consists of about 7,641 islands that are broadly categorized under three main geographical divisions from north to south: Luzon, Visayas and Mindanao.", imageName: "philippines"))
        country.append(Country(titled: "Nepal", description: "Nepal, officially the Federal Democratic Republic of Nepal, is a country in South Asia. It is located mainly in the Himalayas, but also includes parts of the Indo-Gangetic Plain. It is the 49th largest country by population and 93rd largest country by area.", imageName: "nepal"))
        
        return CountryDetails(named: "Asia", includeCountry: country)
    }

}

