# frozen_string_literal: true

require "date"
require_relative "general_ledger_transaction_line_account"
require_relative "general_ledger_transaction_line_company"
require_relative "general_ledger_transaction_line_employee"
require_relative "general_ledger_transaction_line_contact"
require_relative "transaction_currency_enum"
require_relative "general_ledger_transaction_line_tracking_categories_item"
require_relative "general_ledger_transaction_line_item"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The GeneralLedgerTransactionLineSerializer Object
    #  ### Description
    #  The `GeneralLedgerTransactionLineSerializer` object represents general ledger
    #  transaction line item.
    #  ### Usage Example Fetch from the `GET GeneralLedgerTransactionLineSerializer`
    #  endpoint and view an
    #  `GeneralLedgerTransaction` line item.
    class GeneralLedgerTransactionLine
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Accounting::GeneralLedgerTransactionLineAccount]
      attr_reader :account
      # @return [Merge::Accounting::GeneralLedgerTransactionLineCompany] The company the GeneralLedgerTransaction belongs to.
      attr_reader :company
      # @return [Merge::Accounting::GeneralLedgerTransactionLineEmployee]
      attr_reader :employee
      # @return [Merge::Accounting::GeneralLedgerTransactionLineContact]
      attr_reader :contact
      # @return [Merge::Accounting::TransactionCurrencyEnum] The base currency of the transaction
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
      attr_reader :base_currency
      # @return [Merge::Accounting::TransactionCurrencyEnum] The transaction currency that the transaction is made in.
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
      attr_reader :transaction_currency
      # @return [String] The exchange rate between the base currency and the transaction currency.
      attr_reader :exchange_rate
      # @return [String] A description of the line item.
      attr_reader :description
      # @return [Array<Merge::Accounting::GeneralLedgerTransactionLineTrackingCategoriesItem>]
      attr_reader :tracking_categories
      # @return [String]
      attr_reader :debit_amount
      # @return [String]
      attr_reader :credit_amount
      # @return [Merge::Accounting::GeneralLedgerTransactionLineItem]
      attr_reader :item
      # @return [String]
      attr_reader :foreign_debit_amount
      # @return [String]
      attr_reader :foreign_credit_amount
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime] The datetime that this object was created by Merge.
      # @param modified_at [DateTime] The datetime that this object was modified by Merge.
      # @param account [Merge::Accounting::GeneralLedgerTransactionLineAccount]
      # @param company [Merge::Accounting::GeneralLedgerTransactionLineCompany] The company the GeneralLedgerTransaction belongs to.
      # @param employee [Merge::Accounting::GeneralLedgerTransactionLineEmployee]
      # @param contact [Merge::Accounting::GeneralLedgerTransactionLineContact]
      # @param base_currency [Merge::Accounting::TransactionCurrencyEnum] The base currency of the transaction
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
      # @param transaction_currency [Merge::Accounting::TransactionCurrencyEnum] The transaction currency that the transaction is made in.
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
      # @param exchange_rate [String] The exchange rate between the base currency and the transaction currency.
      # @param description [String] A description of the line item.
      # @param tracking_categories [Array<Merge::Accounting::GeneralLedgerTransactionLineTrackingCategoriesItem>]
      # @param debit_amount [String]
      # @param credit_amount [String]
      # @param item [Merge::Accounting::GeneralLedgerTransactionLineItem]
      # @param foreign_debit_amount [String]
      # @param foreign_credit_amount [String]
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::GeneralLedgerTransactionLine]
      def initialize(debit_amount:, credit_amount:, foreign_debit_amount:, foreign_credit_amount:, id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, account: OMIT, company: OMIT,
                     employee: OMIT, contact: OMIT, base_currency: OMIT, transaction_currency: OMIT, exchange_rate: OMIT, description: OMIT, tracking_categories: OMIT, item: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @account = account if account != OMIT
        @company = company if company != OMIT
        @employee = employee if employee != OMIT
        @contact = contact if contact != OMIT
        @base_currency = base_currency if base_currency != OMIT
        @transaction_currency = transaction_currency if transaction_currency != OMIT
        @exchange_rate = exchange_rate if exchange_rate != OMIT
        @description = description if description != OMIT
        @tracking_categories = tracking_categories if tracking_categories != OMIT
        @debit_amount = debit_amount
        @credit_amount = credit_amount
        @item = item if item != OMIT
        @foreign_debit_amount = foreign_debit_amount
        @foreign_credit_amount = foreign_credit_amount
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "account": account,
          "company": company,
          "employee": employee,
          "contact": contact,
          "base_currency": base_currency,
          "transaction_currency": transaction_currency,
          "exchange_rate": exchange_rate,
          "description": description,
          "tracking_categories": tracking_categories,
          "debit_amount": debit_amount,
          "credit_amount": credit_amount,
          "item": item,
          "foreign_debit_amount": foreign_debit_amount,
          "foreign_credit_amount": foreign_credit_amount,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of GeneralLedgerTransactionLine
      #
      # @param json_object [String]
      # @return [Merge::Accounting::GeneralLedgerTransactionLine]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Merge::Accounting::GeneralLedgerTransactionLineAccount.from_json(json_object: account)
        end
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Merge::Accounting::GeneralLedgerTransactionLineCompany.from_json(json_object: company)
        end
        if parsed_json["employee"].nil?
          employee = nil
        else
          employee = parsed_json["employee"].to_json
          employee = Merge::Accounting::GeneralLedgerTransactionLineEmployee.from_json(json_object: employee)
        end
        if parsed_json["contact"].nil?
          contact = nil
        else
          contact = parsed_json["contact"].to_json
          contact = Merge::Accounting::GeneralLedgerTransactionLineContact.from_json(json_object: contact)
        end
        base_currency = parsed_json["base_currency"]
        transaction_currency = parsed_json["transaction_currency"]
        exchange_rate = parsed_json["exchange_rate"]
        description = parsed_json["description"]
        tracking_categories = parsed_json["tracking_categories"]&.map do |item|
          item = item.to_json
          Merge::Accounting::GeneralLedgerTransactionLineTrackingCategoriesItem.from_json(json_object: item)
        end
        debit_amount = parsed_json["debit_amount"]
        credit_amount = parsed_json["credit_amount"]
        if parsed_json["item"].nil?
          item = nil
        else
          item = parsed_json["item"].to_json
          item = Merge::Accounting::GeneralLedgerTransactionLineItem.from_json(json_object: item)
        end
        foreign_debit_amount = parsed_json["foreign_debit_amount"]
        foreign_credit_amount = parsed_json["foreign_credit_amount"]
        remote_was_deleted = parsed_json["remote_was_deleted"]
        field_mappings = parsed_json["field_mappings"]
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          account: account,
          company: company,
          employee: employee,
          contact: contact,
          base_currency: base_currency,
          transaction_currency: transaction_currency,
          exchange_rate: exchange_rate,
          description: description,
          tracking_categories: tracking_categories,
          debit_amount: debit_amount,
          credit_amount: credit_amount,
          item: item,
          foreign_debit_amount: foreign_debit_amount,
          foreign_credit_amount: foreign_credit_amount,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          additional_properties: struct
        )
      end

      # Serialize an instance of GeneralLedgerTransactionLine to a JSON object
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
        obj.account.nil? || Merge::Accounting::GeneralLedgerTransactionLineAccount.validate_raw(obj: obj.account)
        obj.company.nil? || Merge::Accounting::GeneralLedgerTransactionLineCompany.validate_raw(obj: obj.company)
        obj.employee.nil? || Merge::Accounting::GeneralLedgerTransactionLineEmployee.validate_raw(obj: obj.employee)
        obj.contact.nil? || Merge::Accounting::GeneralLedgerTransactionLineContact.validate_raw(obj: obj.contact)
        obj.base_currency&.is_a?(Merge::Accounting::TransactionCurrencyEnum) != false || raise("Passed value for field obj.base_currency is not the expected type, validation failed.")
        obj.transaction_currency&.is_a?(Merge::Accounting::TransactionCurrencyEnum) != false || raise("Passed value for field obj.transaction_currency is not the expected type, validation failed.")
        obj.exchange_rate&.is_a?(String) != false || raise("Passed value for field obj.exchange_rate is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.tracking_categories&.is_a?(Array) != false || raise("Passed value for field obj.tracking_categories is not the expected type, validation failed.")
        obj.debit_amount.is_a?(String) != false || raise("Passed value for field obj.debit_amount is not the expected type, validation failed.")
        obj.credit_amount.is_a?(String) != false || raise("Passed value for field obj.credit_amount is not the expected type, validation failed.")
        obj.item.nil? || Merge::Accounting::GeneralLedgerTransactionLineItem.validate_raw(obj: obj.item)
        obj.foreign_debit_amount.is_a?(String) != false || raise("Passed value for field obj.foreign_debit_amount is not the expected type, validation failed.")
        obj.foreign_credit_amount.is_a?(String) != false || raise("Passed value for field obj.foreign_credit_amount is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
      end
    end
  end
end
