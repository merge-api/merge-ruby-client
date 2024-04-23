# frozen_string_literal: true

require "date"
require_relative "purchase_order_line_item_item"
require_relative "currency_enum"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The PurchaseOrderLineItem Object
    #  ### Description
    #  The `PurchaseOrderLineItem` object is used to represent a purchase order's line
    #  item.
    #  ### Usage Example
    #  Fetch from the `GET PurchaseOrder` endpoint and view a company's purchase
    #  orders.
    class PurchaseOrderLineItem
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime]
      attr_reader :created_at
      # @return [DateTime] This is the datetime that this object was last updated by Merge
      attr_reader :modified_at
      # @return [String] A description of the good being purchased.
      attr_reader :description
      # @return [Float] The line item's unit price.
      attr_reader :unit_price
      # @return [Float] The line item's quantity.
      attr_reader :quantity
      # @return [Merge::Accounting::PurchaseOrderLineItemItem]
      attr_reader :item
      # @return [String] The purchase order line item's account.
      attr_reader :account
      # @return [String] The purchase order line item's associated tracking category.
      attr_reader :tracking_category
      # @return [Array<String>] The purchase order line item's associated tracking categories.
      attr_reader :tracking_categories
      # @return [String] The purchase order line item's tax amount.
      attr_reader :tax_amount
      # @return [String] The purchase order line item's total amount.
      attr_reader :total_line_amount
      # @return [Merge::Accounting::CurrencyEnum] The purchase order line item's currency.
      #  - `XUA` - ADB Unit of Account
      #  - `AFN` - Afghan Afghani
      #  - `AFA` - Afghan Afghani (1927–2002)
      #  - `ALL` - Albanian Lek
      #  - `ALK` - Albanian Lek (1946–1965)
      #  - `DZD` - Algerian Dinar
      #  - `ADP` - Andorran Peseta
      #  - `AOA` - Angolan Kwanza
      #  - `AOK` - Angolan Kwanza (1977–1991)
      #  - `AON` - Angolan New Kwanza (1990–2000)
      #  - `AOR` - Angolan Readjusted Kwanza (1995–1999)
      #  - `ARA` - Argentine Austral
      #  - `ARS` - Argentine Peso
      #  - `ARM` - Argentine Peso (1881–1970)
      #  - `ARP` - Argentine Peso (1983–1985)
      #  - `ARL` - Argentine Peso Ley (1970–1983)
      #  - `AMD` - Armenian Dram
      #  - `AWG` - Aruban Florin
      #  - `AUD` - Australian Dollar
      #  - `ATS` - Austrian Schilling
      #  - `AZN` - Azerbaijani Manat
      #  - `AZM` - Azerbaijani Manat (1993–2006)
      #  - `BSD` - Bahamian Dollar
      #  - `BHD` - Bahraini Dinar
      #  - `BDT` - Bangladeshi Taka
      #  - `BBD` - Barbadian Dollar
      #  - `BYN` - Belarusian Ruble
      #  - `BYB` - Belarusian Ruble (1994–1999)
      #  - `BYR` - Belarusian Ruble (2000–2016)
      #  - `BEF` - Belgian Franc
      #  - `BEC` - Belgian Franc (convertible)
      #  - `BEL` - Belgian Franc (financial)
      #  - `BZD` - Belize Dollar
      #  - `BMD` - Bermudan Dollar
      #  - `BTN` - Bhutanese Ngultrum
      #  - `BOB` - Bolivian Boliviano
      #  - `BOL` - Bolivian Boliviano (1863–1963)
      #  - `BOV` - Bolivian Mvdol
      #  - `BOP` - Bolivian Peso
      #  - `BAM` - Bosnia-Herzegovina Convertible Mark
      #  - `BAD` - Bosnia-Herzegovina Dinar (1992–1994)
      #  - `BAN` - Bosnia-Herzegovina New Dinar (1994–1997)
      #  - `BWP` - Botswanan Pula
      #  - `BRC` - Brazilian Cruzado (1986–1989)
      #  - `BRZ` - Brazilian Cruzeiro (1942–1967)
      #  - `BRE` - Brazilian Cruzeiro (1990–1993)
      #  - `BRR` - Brazilian Cruzeiro (1993–1994)
      #  - `BRN` - Brazilian New Cruzado (1989–1990)
      #  - `BRB` - Brazilian New Cruzeiro (1967–1986)
      #  - `BRL` - Brazilian Real
      #  - `GBP` - British Pound
      #  - `BND` - Brunei Dollar
      #  - `BGL` - Bulgarian Hard Lev
      #  - `BGN` - Bulgarian Lev
      #  - `BGO` - Bulgarian Lev (1879–1952)
      #  - `BGM` - Bulgarian Socialist Lev
      #  - `BUK` - Burmese Kyat
      #  - `BIF` - Burundian Franc
      #  - `XPF` - CFP Franc
      #  - `KHR` - Cambodian Riel
      #  - `CAD` - Canadian Dollar
      #  - `CVE` - Cape Verdean Escudo
      #  - `KYD` - Cayman Islands Dollar
      #  - `XAF` - Central African CFA Franc
      #  - `CLE` - Chilean Escudo
      #  - `CLP` - Chilean Peso
      #  - `CLF` - Chilean Unit of Account (UF)
      #  - `CNX` - Chinese People’s Bank Dollar
      #  - `CNY` - Chinese Yuan
      #  - `CNH` - Chinese Yuan (offshore)
      #  - `COP` - Colombian Peso
      #  - `COU` - Colombian Real Value Unit
      #  - `KMF` - Comorian Franc
      #  - `CDF` - Congolese Franc
      #  - `CRC` - Costa Rican Colón
      #  - `HRD` - Croatian Dinar
      #  - `HRK` - Croatian Kuna
      #  - `CUC` - Cuban Convertible Peso
      #  - `CUP` - Cuban Peso
      #  - `CYP` - Cypriot Pound
      #  - `CZK` - Czech Koruna
      #  - `CSK` - Czechoslovak Hard Koruna
      #  - `DKK` - Danish Krone
      #  - `DJF` - Djiboutian Franc
      #  - `DOP` - Dominican Peso
      #  - `NLG` - Dutch Guilder
      #  - `XCD` - East Caribbean Dollar
      #  - `DDM` - East German Mark
      #  - `ECS` - Ecuadorian Sucre
      #  - `ECV` - Ecuadorian Unit of Constant Value
      #  - `EGP` - Egyptian Pound
      #  - `GQE` - Equatorial Guinean Ekwele
      #  - `ERN` - Eritrean Nakfa
      #  - `EEK` - Estonian Kroon
      #  - `ETB` - Ethiopian Birr
      #  - `EUR` - Euro
      #  - `XBA` - European Composite Unit
      #  - `XEU` - European Currency Unit
      #  - `XBB` - European Monetary Unit
      #  - `XBC` - European Unit of Account (XBC)
      #  - `XBD` - European Unit of Account (XBD)
      #  - `FKP` - Falkland Islands Pound
      #  - `FJD` - Fijian Dollar
      #  - `FIM` - Finnish Markka
      #  - `FRF` - French Franc
      #  - `XFO` - French Gold Franc
      #  - `XFU` - French UIC-Franc
      #  - `GMD` - Gambian Dalasi
      #  - `GEK` - Georgian Kupon Larit
      #  - `GEL` - Georgian Lari
      #  - `DEM` - German Mark
      #  - `GHS` - Ghanaian Cedi
      #  - `GHC` - Ghanaian Cedi (1979–2007)
      #  - `GIP` - Gibraltar Pound
      #  - `XAU` - Gold
      #  - `GRD` - Greek Drachma
      #  - `GTQ` - Guatemalan Quetzal
      #  - `GWP` - Guinea-Bissau Peso
      #  - `GNF` - Guinean Franc
      #  - `GNS` - Guinean Syli
      #  - `GYD` - Guyanaese Dollar
      #  - `HTG` - Haitian Gourde
      #  - `HNL` - Honduran Lempira
      #  - `HKD` - Hong Kong Dollar
      #  - `HUF` - Hungarian Forint
      #  - `IMP` - IMP
      #  - `ISK` - Icelandic Króna
      #  - `ISJ` - Icelandic Króna (1918–1981)
      #  - `INR` - Indian Rupee
      #  - `IDR` - Indonesian Rupiah
      #  - `IRR` - Iranian Rial
      #  - `IQD` - Iraqi Dinar
      #  - `IEP` - Irish Pound
      #  - `ILS` - Israeli New Shekel
      #  - `ILP` - Israeli Pound
      #  - `ILR` - Israeli Shekel (1980–1985)
      #  - `ITL` - Italian Lira
      #  - `JMD` - Jamaican Dollar
      #  - `JPY` - Japanese Yen
      #  - `JOD` - Jordanian Dinar
      #  - `KZT` - Kazakhstani Tenge
      #  - `KES` - Kenyan Shilling
      #  - `KWD` - Kuwaiti Dinar
      #  - `KGS` - Kyrgystani Som
      #  - `LAK` - Laotian Kip
      #  - `LVL` - Latvian Lats
      #  - `LVR` - Latvian Ruble
      #  - `LBP` - Lebanese Pound
      #  - `LSL` - Lesotho Loti
      #  - `LRD` - Liberian Dollar
      #  - `LYD` - Libyan Dinar
      #  - `LTL` - Lithuanian Litas
      #  - `LTT` - Lithuanian Talonas
      #  - `LUL` - Luxembourg Financial Franc
      #  - `LUC` - Luxembourgian Convertible Franc
      #  - `LUF` - Luxembourgian Franc
      #  - `MOP` - Macanese Pataca
      #  - `MKD` - Macedonian Denar
      #  - `MKN` - Macedonian Denar (1992–1993)
      #  - `MGA` - Malagasy Ariary
      #  - `MGF` - Malagasy Franc
      #  - `MWK` - Malawian Kwacha
      #  - `MYR` - Malaysian Ringgit
      #  - `MVR` - Maldivian Rufiyaa
      #  - `MVP` - Maldivian Rupee (1947–1981)
      #  - `MLF` - Malian Franc
      #  - `MTL` - Maltese Lira
      #  - `MTP` - Maltese Pound
      #  - `MRU` - Mauritanian Ouguiya
      #  - `MRO` - Mauritanian Ouguiya (1973–2017)
      #  - `MUR` - Mauritian Rupee
      #  - `MXV` - Mexican Investment Unit
      #  - `MXN` - Mexican Peso
      #  - `MXP` - Mexican Silver Peso (1861–1992)
      #  - `MDC` - Moldovan Cupon
      #  - `MDL` - Moldovan Leu
      #  - `MCF` - Monegasque Franc
      #  - `MNT` - Mongolian Tugrik
      #  - `MAD` - Moroccan Dirham
      #  - `MAF` - Moroccan Franc
      #  - `MZE` - Mozambican Escudo
      #  - `MZN` - Mozambican Metical
      #  - `MZM` - Mozambican Metical (1980–2006)
      #  - `MMK` - Myanmar Kyat
      #  - `NAD` - Namibian Dollar
      #  - `NPR` - Nepalese Rupee
      #  - `ANG` - Netherlands Antillean Guilder
      #  - `TWD` - New Taiwan Dollar
      #  - `NZD` - New Zealand Dollar
      #  - `NIO` - Nicaraguan Córdoba
      #  - `NIC` - Nicaraguan Córdoba (1988–1991)
      #  - `NGN` - Nigerian Naira
      #  - `KPW` - North Korean Won
      #  - `NOK` - Norwegian Krone
      #  - `OMR` - Omani Rial
      #  - `PKR` - Pakistani Rupee
      #  - `XPD` - Palladium
      #  - `PAB` - Panamanian Balboa
      #  - `PGK` - Papua New Guinean Kina
      #  - `PYG` - Paraguayan Guarani
      #  - `PEI` - Peruvian Inti
      #  - `PEN` - Peruvian Sol
      #  - `PES` - Peruvian Sol (1863–1965)
      #  - `PHP` - Philippine Peso
      #  - `XPT` - Platinum
      #  - `PLN` - Polish Zloty
      #  - `PLZ` - Polish Zloty (1950–1995)
      #  - `PTE` - Portuguese Escudo
      #  - `GWE` - Portuguese Guinea Escudo
      #  - `QAR` - Qatari Rial
      #  - `XRE` - RINET Funds
      #  - `RHD` - Rhodesian Dollar
      #  - `RON` - Romanian Leu
      #  - `ROL` - Romanian Leu (1952–2006)
      #  - `RUB` - Russian Ruble
      #  - `RUR` - Russian Ruble (1991–1998)
      #  - `RWF` - Rwandan Franc
      #  - `SVC` - Salvadoran Colón
      #  - `WST` - Samoan Tala
      #  - `SAR` - Saudi Riyal
      #  - `RSD` - Serbian Dinar
      #  - `CSD` - Serbian Dinar (2002–2006)
      #  - `SCR` - Seychellois Rupee
      #  - `SLL` - Sierra Leonean Leone
      #  - `XAG` - Silver
      #  - `SGD` - Singapore Dollar
      #  - `SKK` - Slovak Koruna
      #  - `SIT` - Slovenian Tolar
      #  - `SBD` - Solomon Islands Dollar
      #  - `SOS` - Somali Shilling
      #  - `ZAR` - South African Rand
      #  - `ZAL` - South African Rand (financial)
      #  - `KRH` - South Korean Hwan (1953–1962)
      #  - `KRW` - South Korean Won
      #  - `KRO` - South Korean Won (1945–1953)
      #  - `SSP` - South Sudanese Pound
      #  - `SUR` - Soviet Rouble
      #  - `ESP` - Spanish Peseta
      #  - `ESA` - Spanish Peseta (A account)
      #  - `ESB` - Spanish Peseta (convertible account)
      #  - `XDR` - Special Drawing Rights
      #  - `LKR` - Sri Lankan Rupee
      #  - `SHP` - St. Helena Pound
      #  - `XSU` - Sucre
      #  - `SDD` - Sudanese Dinar (1992–2007)
      #  - `SDG` - Sudanese Pound
      #  - `SDP` - Sudanese Pound (1957–1998)
      #  - `SRD` - Surinamese Dollar
      #  - `SRG` - Surinamese Guilder
      #  - `SZL` - Swazi Lilangeni
      #  - `SEK` - Swedish Krona
      #  - `CHF` - Swiss Franc
      #  - `SYP` - Syrian Pound
      #  - `STN` - São Tomé & Príncipe Dobra
      #  - `STD` - São Tomé & Príncipe Dobra (1977–2017)
      #  - `TVD` - TVD
      #  - `TJR` - Tajikistani Ruble
      #  - `TJS` - Tajikistani Somoni
      #  - `TZS` - Tanzanian Shilling
      #  - `XTS` - Testing Currency Code
      #  - `THB` - Thai Baht
      #  - `XXX` - The codes assigned for transactions where no currency is involved
      #  - `TPE` - Timorese Escudo
      #  - `TOP` - Tongan Paʻanga
      #  - `TTD` - Trinidad & Tobago Dollar
      #  - `TND` - Tunisian Dinar
      #  - `TRY` - Turkish Lira
      #  - `TRL` - Turkish Lira (1922–2005)
      #  - `TMT` - Turkmenistani Manat
      #  - `TMM` - Turkmenistani Manat (1993–2009)
      #  - `USD` - US Dollar
      #  - `USN` - US Dollar (Next day)
      #  - `USS` - US Dollar (Same day)
      #  - `UGX` - Ugandan Shilling
      #  - `UGS` - Ugandan Shilling (1966–1987)
      #  - `UAH` - Ukrainian Hryvnia
      #  - `UAK` - Ukrainian Karbovanets
      #  - `AED` - United Arab Emirates Dirham
      #  - `UYW` - Uruguayan Nominal Wage Index Unit
      #  - `UYU` - Uruguayan Peso
      #  - `UYP` - Uruguayan Peso (1975–1993)
      #  - `UYI` - Uruguayan Peso (Indexed Units)
      #  - `UZS` - Uzbekistani Som
      #  - `VUV` - Vanuatu Vatu
      #  - `VES` - Venezuelan Bolívar
      #  - `VEB` - Venezuelan Bolívar (1871–2008)
      #  - `VEF` - Venezuelan Bolívar (2008–2018)
      #  - `VND` - Vietnamese Dong
      #  - `VNN` - Vietnamese Dong (1978–1985)
      #  - `CHE` - WIR Euro
      #  - `CHW` - WIR Franc
      #  - `XOF` - West African CFA Franc
      #  - `YDD` - Yemeni Dinar
      #  - `YER` - Yemeni Rial
      #  - `YUN` - Yugoslavian Convertible Dinar (1990–1992)
      #  - `YUD` - Yugoslavian Hard Dinar (1966–1990)
      #  - `YUM` - Yugoslavian New Dinar (1994–2002)
      #  - `YUR` - Yugoslavian Reformed Dinar (1992–1993)
      #  - `ZWN` - ZWN
      #  - `ZRN` - Zairean New Zaire (1993–1998)
      #  - `ZRZ` - Zairean Zaire (1971–1993)
      #  - `ZMW` - Zambian Kwacha
      #  - `ZMK` - Zambian Kwacha (1968–2012)
      #  - `ZWD` - Zimbabwean Dollar (1980–2008)
      #  - `ZWR` - Zimbabwean Dollar (2008)
      #  - `ZWL` - Zimbabwean Dollar (2009)
      attr_reader :currency
      # @return [String] The purchase order line item's exchange rate.
      attr_reader :exchange_rate
      # @return [String] The company the purchase order line item belongs to.
      attr_reader :company
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      attr_reader :remote_was_deleted
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param description [String] A description of the good being purchased.
      # @param unit_price [Float] The line item's unit price.
      # @param quantity [Float] The line item's quantity.
      # @param item [Merge::Accounting::PurchaseOrderLineItemItem]
      # @param account [String] The purchase order line item's account.
      # @param tracking_category [String] The purchase order line item's associated tracking category.
      # @param tracking_categories [Array<String>] The purchase order line item's associated tracking categories.
      # @param tax_amount [String] The purchase order line item's tax amount.
      # @param total_line_amount [String] The purchase order line item's total amount.
      # @param currency [Merge::Accounting::CurrencyEnum] The purchase order line item's currency.
      #  - `XUA` - ADB Unit of Account
      #  - `AFN` - Afghan Afghani
      #  - `AFA` - Afghan Afghani (1927–2002)
      #  - `ALL` - Albanian Lek
      #  - `ALK` - Albanian Lek (1946–1965)
      #  - `DZD` - Algerian Dinar
      #  - `ADP` - Andorran Peseta
      #  - `AOA` - Angolan Kwanza
      #  - `AOK` - Angolan Kwanza (1977–1991)
      #  - `AON` - Angolan New Kwanza (1990–2000)
      #  - `AOR` - Angolan Readjusted Kwanza (1995–1999)
      #  - `ARA` - Argentine Austral
      #  - `ARS` - Argentine Peso
      #  - `ARM` - Argentine Peso (1881–1970)
      #  - `ARP` - Argentine Peso (1983–1985)
      #  - `ARL` - Argentine Peso Ley (1970–1983)
      #  - `AMD` - Armenian Dram
      #  - `AWG` - Aruban Florin
      #  - `AUD` - Australian Dollar
      #  - `ATS` - Austrian Schilling
      #  - `AZN` - Azerbaijani Manat
      #  - `AZM` - Azerbaijani Manat (1993–2006)
      #  - `BSD` - Bahamian Dollar
      #  - `BHD` - Bahraini Dinar
      #  - `BDT` - Bangladeshi Taka
      #  - `BBD` - Barbadian Dollar
      #  - `BYN` - Belarusian Ruble
      #  - `BYB` - Belarusian Ruble (1994–1999)
      #  - `BYR` - Belarusian Ruble (2000–2016)
      #  - `BEF` - Belgian Franc
      #  - `BEC` - Belgian Franc (convertible)
      #  - `BEL` - Belgian Franc (financial)
      #  - `BZD` - Belize Dollar
      #  - `BMD` - Bermudan Dollar
      #  - `BTN` - Bhutanese Ngultrum
      #  - `BOB` - Bolivian Boliviano
      #  - `BOL` - Bolivian Boliviano (1863–1963)
      #  - `BOV` - Bolivian Mvdol
      #  - `BOP` - Bolivian Peso
      #  - `BAM` - Bosnia-Herzegovina Convertible Mark
      #  - `BAD` - Bosnia-Herzegovina Dinar (1992–1994)
      #  - `BAN` - Bosnia-Herzegovina New Dinar (1994–1997)
      #  - `BWP` - Botswanan Pula
      #  - `BRC` - Brazilian Cruzado (1986–1989)
      #  - `BRZ` - Brazilian Cruzeiro (1942–1967)
      #  - `BRE` - Brazilian Cruzeiro (1990–1993)
      #  - `BRR` - Brazilian Cruzeiro (1993–1994)
      #  - `BRN` - Brazilian New Cruzado (1989–1990)
      #  - `BRB` - Brazilian New Cruzeiro (1967–1986)
      #  - `BRL` - Brazilian Real
      #  - `GBP` - British Pound
      #  - `BND` - Brunei Dollar
      #  - `BGL` - Bulgarian Hard Lev
      #  - `BGN` - Bulgarian Lev
      #  - `BGO` - Bulgarian Lev (1879–1952)
      #  - `BGM` - Bulgarian Socialist Lev
      #  - `BUK` - Burmese Kyat
      #  - `BIF` - Burundian Franc
      #  - `XPF` - CFP Franc
      #  - `KHR` - Cambodian Riel
      #  - `CAD` - Canadian Dollar
      #  - `CVE` - Cape Verdean Escudo
      #  - `KYD` - Cayman Islands Dollar
      #  - `XAF` - Central African CFA Franc
      #  - `CLE` - Chilean Escudo
      #  - `CLP` - Chilean Peso
      #  - `CLF` - Chilean Unit of Account (UF)
      #  - `CNX` - Chinese People’s Bank Dollar
      #  - `CNY` - Chinese Yuan
      #  - `CNH` - Chinese Yuan (offshore)
      #  - `COP` - Colombian Peso
      #  - `COU` - Colombian Real Value Unit
      #  - `KMF` - Comorian Franc
      #  - `CDF` - Congolese Franc
      #  - `CRC` - Costa Rican Colón
      #  - `HRD` - Croatian Dinar
      #  - `HRK` - Croatian Kuna
      #  - `CUC` - Cuban Convertible Peso
      #  - `CUP` - Cuban Peso
      #  - `CYP` - Cypriot Pound
      #  - `CZK` - Czech Koruna
      #  - `CSK` - Czechoslovak Hard Koruna
      #  - `DKK` - Danish Krone
      #  - `DJF` - Djiboutian Franc
      #  - `DOP` - Dominican Peso
      #  - `NLG` - Dutch Guilder
      #  - `XCD` - East Caribbean Dollar
      #  - `DDM` - East German Mark
      #  - `ECS` - Ecuadorian Sucre
      #  - `ECV` - Ecuadorian Unit of Constant Value
      #  - `EGP` - Egyptian Pound
      #  - `GQE` - Equatorial Guinean Ekwele
      #  - `ERN` - Eritrean Nakfa
      #  - `EEK` - Estonian Kroon
      #  - `ETB` - Ethiopian Birr
      #  - `EUR` - Euro
      #  - `XBA` - European Composite Unit
      #  - `XEU` - European Currency Unit
      #  - `XBB` - European Monetary Unit
      #  - `XBC` - European Unit of Account (XBC)
      #  - `XBD` - European Unit of Account (XBD)
      #  - `FKP` - Falkland Islands Pound
      #  - `FJD` - Fijian Dollar
      #  - `FIM` - Finnish Markka
      #  - `FRF` - French Franc
      #  - `XFO` - French Gold Franc
      #  - `XFU` - French UIC-Franc
      #  - `GMD` - Gambian Dalasi
      #  - `GEK` - Georgian Kupon Larit
      #  - `GEL` - Georgian Lari
      #  - `DEM` - German Mark
      #  - `GHS` - Ghanaian Cedi
      #  - `GHC` - Ghanaian Cedi (1979–2007)
      #  - `GIP` - Gibraltar Pound
      #  - `XAU` - Gold
      #  - `GRD` - Greek Drachma
      #  - `GTQ` - Guatemalan Quetzal
      #  - `GWP` - Guinea-Bissau Peso
      #  - `GNF` - Guinean Franc
      #  - `GNS` - Guinean Syli
      #  - `GYD` - Guyanaese Dollar
      #  - `HTG` - Haitian Gourde
      #  - `HNL` - Honduran Lempira
      #  - `HKD` - Hong Kong Dollar
      #  - `HUF` - Hungarian Forint
      #  - `IMP` - IMP
      #  - `ISK` - Icelandic Króna
      #  - `ISJ` - Icelandic Króna (1918–1981)
      #  - `INR` - Indian Rupee
      #  - `IDR` - Indonesian Rupiah
      #  - `IRR` - Iranian Rial
      #  - `IQD` - Iraqi Dinar
      #  - `IEP` - Irish Pound
      #  - `ILS` - Israeli New Shekel
      #  - `ILP` - Israeli Pound
      #  - `ILR` - Israeli Shekel (1980–1985)
      #  - `ITL` - Italian Lira
      #  - `JMD` - Jamaican Dollar
      #  - `JPY` - Japanese Yen
      #  - `JOD` - Jordanian Dinar
      #  - `KZT` - Kazakhstani Tenge
      #  - `KES` - Kenyan Shilling
      #  - `KWD` - Kuwaiti Dinar
      #  - `KGS` - Kyrgystani Som
      #  - `LAK` - Laotian Kip
      #  - `LVL` - Latvian Lats
      #  - `LVR` - Latvian Ruble
      #  - `LBP` - Lebanese Pound
      #  - `LSL` - Lesotho Loti
      #  - `LRD` - Liberian Dollar
      #  - `LYD` - Libyan Dinar
      #  - `LTL` - Lithuanian Litas
      #  - `LTT` - Lithuanian Talonas
      #  - `LUL` - Luxembourg Financial Franc
      #  - `LUC` - Luxembourgian Convertible Franc
      #  - `LUF` - Luxembourgian Franc
      #  - `MOP` - Macanese Pataca
      #  - `MKD` - Macedonian Denar
      #  - `MKN` - Macedonian Denar (1992–1993)
      #  - `MGA` - Malagasy Ariary
      #  - `MGF` - Malagasy Franc
      #  - `MWK` - Malawian Kwacha
      #  - `MYR` - Malaysian Ringgit
      #  - `MVR` - Maldivian Rufiyaa
      #  - `MVP` - Maldivian Rupee (1947–1981)
      #  - `MLF` - Malian Franc
      #  - `MTL` - Maltese Lira
      #  - `MTP` - Maltese Pound
      #  - `MRU` - Mauritanian Ouguiya
      #  - `MRO` - Mauritanian Ouguiya (1973–2017)
      #  - `MUR` - Mauritian Rupee
      #  - `MXV` - Mexican Investment Unit
      #  - `MXN` - Mexican Peso
      #  - `MXP` - Mexican Silver Peso (1861–1992)
      #  - `MDC` - Moldovan Cupon
      #  - `MDL` - Moldovan Leu
      #  - `MCF` - Monegasque Franc
      #  - `MNT` - Mongolian Tugrik
      #  - `MAD` - Moroccan Dirham
      #  - `MAF` - Moroccan Franc
      #  - `MZE` - Mozambican Escudo
      #  - `MZN` - Mozambican Metical
      #  - `MZM` - Mozambican Metical (1980–2006)
      #  - `MMK` - Myanmar Kyat
      #  - `NAD` - Namibian Dollar
      #  - `NPR` - Nepalese Rupee
      #  - `ANG` - Netherlands Antillean Guilder
      #  - `TWD` - New Taiwan Dollar
      #  - `NZD` - New Zealand Dollar
      #  - `NIO` - Nicaraguan Córdoba
      #  - `NIC` - Nicaraguan Córdoba (1988–1991)
      #  - `NGN` - Nigerian Naira
      #  - `KPW` - North Korean Won
      #  - `NOK` - Norwegian Krone
      #  - `OMR` - Omani Rial
      #  - `PKR` - Pakistani Rupee
      #  - `XPD` - Palladium
      #  - `PAB` - Panamanian Balboa
      #  - `PGK` - Papua New Guinean Kina
      #  - `PYG` - Paraguayan Guarani
      #  - `PEI` - Peruvian Inti
      #  - `PEN` - Peruvian Sol
      #  - `PES` - Peruvian Sol (1863–1965)
      #  - `PHP` - Philippine Peso
      #  - `XPT` - Platinum
      #  - `PLN` - Polish Zloty
      #  - `PLZ` - Polish Zloty (1950–1995)
      #  - `PTE` - Portuguese Escudo
      #  - `GWE` - Portuguese Guinea Escudo
      #  - `QAR` - Qatari Rial
      #  - `XRE` - RINET Funds
      #  - `RHD` - Rhodesian Dollar
      #  - `RON` - Romanian Leu
      #  - `ROL` - Romanian Leu (1952–2006)
      #  - `RUB` - Russian Ruble
      #  - `RUR` - Russian Ruble (1991–1998)
      #  - `RWF` - Rwandan Franc
      #  - `SVC` - Salvadoran Colón
      #  - `WST` - Samoan Tala
      #  - `SAR` - Saudi Riyal
      #  - `RSD` - Serbian Dinar
      #  - `CSD` - Serbian Dinar (2002–2006)
      #  - `SCR` - Seychellois Rupee
      #  - `SLL` - Sierra Leonean Leone
      #  - `XAG` - Silver
      #  - `SGD` - Singapore Dollar
      #  - `SKK` - Slovak Koruna
      #  - `SIT` - Slovenian Tolar
      #  - `SBD` - Solomon Islands Dollar
      #  - `SOS` - Somali Shilling
      #  - `ZAR` - South African Rand
      #  - `ZAL` - South African Rand (financial)
      #  - `KRH` - South Korean Hwan (1953–1962)
      #  - `KRW` - South Korean Won
      #  - `KRO` - South Korean Won (1945–1953)
      #  - `SSP` - South Sudanese Pound
      #  - `SUR` - Soviet Rouble
      #  - `ESP` - Spanish Peseta
      #  - `ESA` - Spanish Peseta (A account)
      #  - `ESB` - Spanish Peseta (convertible account)
      #  - `XDR` - Special Drawing Rights
      #  - `LKR` - Sri Lankan Rupee
      #  - `SHP` - St. Helena Pound
      #  - `XSU` - Sucre
      #  - `SDD` - Sudanese Dinar (1992–2007)
      #  - `SDG` - Sudanese Pound
      #  - `SDP` - Sudanese Pound (1957–1998)
      #  - `SRD` - Surinamese Dollar
      #  - `SRG` - Surinamese Guilder
      #  - `SZL` - Swazi Lilangeni
      #  - `SEK` - Swedish Krona
      #  - `CHF` - Swiss Franc
      #  - `SYP` - Syrian Pound
      #  - `STN` - São Tomé & Príncipe Dobra
      #  - `STD` - São Tomé & Príncipe Dobra (1977–2017)
      #  - `TVD` - TVD
      #  - `TJR` - Tajikistani Ruble
      #  - `TJS` - Tajikistani Somoni
      #  - `TZS` - Tanzanian Shilling
      #  - `XTS` - Testing Currency Code
      #  - `THB` - Thai Baht
      #  - `XXX` - The codes assigned for transactions where no currency is involved
      #  - `TPE` - Timorese Escudo
      #  - `TOP` - Tongan Paʻanga
      #  - `TTD` - Trinidad & Tobago Dollar
      #  - `TND` - Tunisian Dinar
      #  - `TRY` - Turkish Lira
      #  - `TRL` - Turkish Lira (1922–2005)
      #  - `TMT` - Turkmenistani Manat
      #  - `TMM` - Turkmenistani Manat (1993–2009)
      #  - `USD` - US Dollar
      #  - `USN` - US Dollar (Next day)
      #  - `USS` - US Dollar (Same day)
      #  - `UGX` - Ugandan Shilling
      #  - `UGS` - Ugandan Shilling (1966–1987)
      #  - `UAH` - Ukrainian Hryvnia
      #  - `UAK` - Ukrainian Karbovanets
      #  - `AED` - United Arab Emirates Dirham
      #  - `UYW` - Uruguayan Nominal Wage Index Unit
      #  - `UYU` - Uruguayan Peso
      #  - `UYP` - Uruguayan Peso (1975–1993)
      #  - `UYI` - Uruguayan Peso (Indexed Units)
      #  - `UZS` - Uzbekistani Som
      #  - `VUV` - Vanuatu Vatu
      #  - `VES` - Venezuelan Bolívar
      #  - `VEB` - Venezuelan Bolívar (1871–2008)
      #  - `VEF` - Venezuelan Bolívar (2008–2018)
      #  - `VND` - Vietnamese Dong
      #  - `VNN` - Vietnamese Dong (1978–1985)
      #  - `CHE` - WIR Euro
      #  - `CHW` - WIR Franc
      #  - `XOF` - West African CFA Franc
      #  - `YDD` - Yemeni Dinar
      #  - `YER` - Yemeni Rial
      #  - `YUN` - Yugoslavian Convertible Dinar (1990–1992)
      #  - `YUD` - Yugoslavian Hard Dinar (1966–1990)
      #  - `YUM` - Yugoslavian New Dinar (1994–2002)
      #  - `YUR` - Yugoslavian Reformed Dinar (1992–1993)
      #  - `ZWN` - ZWN
      #  - `ZRN` - Zairean New Zaire (1993–1998)
      #  - `ZRZ` - Zairean Zaire (1971–1993)
      #  - `ZMW` - Zambian Kwacha
      #  - `ZMK` - Zambian Kwacha (1968–2012)
      #  - `ZWD` - Zimbabwean Dollar (1980–2008)
      #  - `ZWR` - Zimbabwean Dollar (2008)
      #  - `ZWL` - Zimbabwean Dollar (2009)
      # @param exchange_rate [String] The purchase order line item's exchange rate.
      # @param company [String] The company the purchase order line item belongs to.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::PurchaseOrderLineItem]
      def initialize(tracking_categories:, id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, description: OMIT,
                     unit_price: OMIT, quantity: OMIT, item: OMIT, account: OMIT, tracking_category: OMIT, tax_amount: OMIT, total_line_amount: OMIT, currency: OMIT, exchange_rate: OMIT, company: OMIT, remote_was_deleted: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @description = description if description != OMIT
        @unit_price = unit_price if unit_price != OMIT
        @quantity = quantity if quantity != OMIT
        @item = item if item != OMIT
        @account = account if account != OMIT
        @tracking_category = tracking_category if tracking_category != OMIT
        @tracking_categories = tracking_categories
        @tax_amount = tax_amount if tax_amount != OMIT
        @total_line_amount = total_line_amount if total_line_amount != OMIT
        @currency = currency if currency != OMIT
        @exchange_rate = exchange_rate if exchange_rate != OMIT
        @company = company if company != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "description": description,
          "unit_price": unit_price,
          "quantity": quantity,
          "item": item,
          "account": account,
          "tracking_category": tracking_category,
          "tracking_categories": tracking_categories,
          "tax_amount": tax_amount,
          "total_line_amount": total_line_amount,
          "currency": currency,
          "exchange_rate": exchange_rate,
          "company": company,
          "remote_was_deleted": remote_was_deleted
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of PurchaseOrderLineItem
      #
      # @param json_object [String]
      # @return [Merge::Accounting::PurchaseOrderLineItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        remote_id = struct["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        description = struct["description"]
        unit_price = struct["unit_price"]
        quantity = struct["quantity"]
        if parsed_json["item"].nil?
          item = nil
        else
          item = parsed_json["item"].to_json
          item = Merge::Accounting::PurchaseOrderLineItemItem.from_json(json_object: item)
        end
        account = struct["account"]
        tracking_category = struct["tracking_category"]
        tracking_categories = struct["tracking_categories"]
        tax_amount = struct["tax_amount"]
        total_line_amount = struct["total_line_amount"]
        currency = struct["currency"]
        exchange_rate = struct["exchange_rate"]
        company = struct["company"]
        remote_was_deleted = struct["remote_was_deleted"]
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          description: description,
          unit_price: unit_price,
          quantity: quantity,
          item: item,
          account: account,
          tracking_category: tracking_category,
          tracking_categories: tracking_categories,
          tax_amount: tax_amount,
          total_line_amount: total_line_amount,
          currency: currency,
          exchange_rate: exchange_rate,
          company: company,
          remote_was_deleted: remote_was_deleted,
          additional_properties: struct
        )
      end

      # Serialize an instance of PurchaseOrderLineItem to a JSON object
      #
      # @return [String]
      def to_json(*_args)
        @_field_set&.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.unit_price&.is_a?(Float) != false || raise("Passed value for field obj.unit_price is not the expected type, validation failed.")
        obj.quantity&.is_a?(Float) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
        obj.item.nil? || Merge::Accounting::PurchaseOrderLineItemItem.validate_raw(obj: obj.item)
        obj.account&.is_a?(String) != false || raise("Passed value for field obj.account is not the expected type, validation failed.")
        obj.tracking_category&.is_a?(String) != false || raise("Passed value for field obj.tracking_category is not the expected type, validation failed.")
        obj.tracking_categories.is_a?(Array) != false || raise("Passed value for field obj.tracking_categories is not the expected type, validation failed.")
        obj.tax_amount&.is_a?(String) != false || raise("Passed value for field obj.tax_amount is not the expected type, validation failed.")
        obj.total_line_amount&.is_a?(String) != false || raise("Passed value for field obj.total_line_amount is not the expected type, validation failed.")
        obj.currency&.is_a?(Merge::Accounting::CurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
        obj.exchange_rate&.is_a?(String) != false || raise("Passed value for field obj.exchange_rate is not the expected type, validation failed.")
        obj.company&.is_a?(String) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
      end
    end
  end
end
