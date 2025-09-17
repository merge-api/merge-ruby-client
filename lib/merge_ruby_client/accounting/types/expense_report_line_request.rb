# frozen_string_literal: true

require_relative "expense_report_line_request_account"
require "date"
require_relative "transaction_currency_enum"
require_relative "expense_report_line_request_employee"
require_relative "expense_report_line_request_project"
require_relative "expense_report_line_request_company"
require_relative "expense_report_line_request_contact"
require_relative "expense_report_line_request_tax_rate"
require_relative "remote_field_request"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The ExpenseReportLine Object
    #  ### Description
    #  The `ExpenseReportLine` object represents an individual line item within an
    #  expense report, containing details about
    #  a specific expense such as amount, description, and associated metadata.
    #  ### Usage Example
    #  Fetch from the `GET ExpenseReport` endpoint and expand the lines field to view
    #  all line items in the expense report.
    class ExpenseReportLineRequest
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [Merge::Accounting::ExpenseReportLineRequestAccount]
      attr_reader :account
      # @return [String] Description of the individual expense.
      attr_reader :description
      # @return [DateTime] The date the individual expense was incurred.
      attr_reader :expense_date
      # @return [Float] The amount of the expense for the line item.
      attr_reader :amount
      # @return [Merge::Accounting::TransactionCurrencyEnum] Currency of the expense line (if different from the report currency).
      #  * `XUA` - ADB Unit of Account
      #  * `AFN` - Afghan Afghani
      #  * `AFA` - Afghan Afghani (1927–2002)
      #  * `ALL` - Albanian Lek
      #  * `ALK` - Albanian Lek (1946–1965)
      #  * `DZD` - Algerian Dinar
      #  * `ADP` - Andorran Peseta
      #  * `AOA` - Angolan Kwanza
      #  * `AOK` - Angolan Kwanza (1977–1991)
      #  * `AON` - Angolan New Kwanza (1990–2000)
      #  * `AOR` - Angolan Readjusted Kwanza (1995–1999)
      #  * `ARA` - Argentine Austral
      #  * `ARS` - Argentine Peso
      #  * `ARM` - Argentine Peso (1881–1970)
      #  * `ARP` - Argentine Peso (1983–1985)
      #  * `ARL` - Argentine Peso Ley (1970–1983)
      #  * `AMD` - Armenian Dram
      #  * `AWG` - Aruban Florin
      #  * `AUD` - Australian Dollar
      #  * `ATS` - Austrian Schilling
      #  * `AZN` - Azerbaijani Manat
      #  * `AZM` - Azerbaijani Manat (1993–2006)
      #  * `BSD` - Bahamian Dollar
      #  * `BHD` - Bahraini Dinar
      #  * `BDT` - Bangladeshi Taka
      #  * `BBD` - Barbadian Dollar
      #  * `BYN` - Belarusian Ruble
      #  * `BYB` - Belarusian Ruble (1994–1999)
      #  * `BYR` - Belarusian Ruble (2000–2016)
      #  * `BEF` - Belgian Franc
      #  * `BEC` - Belgian Franc (convertible)
      #  * `BEL` - Belgian Franc (financial)
      #  * `BZD` - Belize Dollar
      #  * `BMD` - Bermudan Dollar
      #  * `BTN` - Bhutanese Ngultrum
      #  * `BOB` - Bolivian Boliviano
      #  * `BOL` - Bolivian Boliviano (1863–1963)
      #  * `BOV` - Bolivian Mvdol
      #  * `BOP` - Bolivian Peso
      #  * `BAM` - Bosnia-Herzegovina Convertible Mark
      #  * `BAD` - Bosnia-Herzegovina Dinar (1992–1994)
      #  * `BAN` - Bosnia-Herzegovina New Dinar (1994–1997)
      #  * `BWP` - Botswanan Pula
      #  * `BRC` - Brazilian Cruzado (1986–1989)
      #  * `BRZ` - Brazilian Cruzeiro (1942–1967)
      #  * `BRE` - Brazilian Cruzeiro (1990–1993)
      #  * `BRR` - Brazilian Cruzeiro (1993–1994)
      #  * `BRN` - Brazilian New Cruzado (1989–1990)
      #  * `BRB` - Brazilian New Cruzeiro (1967–1986)
      #  * `BRL` - Brazilian Real
      #  * `GBP` - British Pound
      #  * `BND` - Brunei Dollar
      #  * `BGL` - Bulgarian Hard Lev
      #  * `BGN` - Bulgarian Lev
      #  * `BGO` - Bulgarian Lev (1879–1952)
      #  * `BGM` - Bulgarian Socialist Lev
      #  * `BUK` - Burmese Kyat
      #  * `BIF` - Burundian Franc
      #  * `XPF` - CFP Franc
      #  * `KHR` - Cambodian Riel
      #  * `CAD` - Canadian Dollar
      #  * `CVE` - Cape Verdean Escudo
      #  * `KYD` - Cayman Islands Dollar
      #  * `XAF` - Central African CFA Franc
      #  * `CLE` - Chilean Escudo
      #  * `CLP` - Chilean Peso
      #  * `CLF` - Chilean Unit of Account (UF)
      #  * `CNX` - Chinese People’s Bank Dollar
      #  * `CNY` - Chinese Yuan
      #  * `CNH` - Chinese Yuan (offshore)
      #  * `COP` - Colombian Peso
      #  * `COU` - Colombian Real Value Unit
      #  * `KMF` - Comorian Franc
      #  * `CDF` - Congolese Franc
      #  * `CRC` - Costa Rican Colón
      #  * `HRD` - Croatian Dinar
      #  * `HRK` - Croatian Kuna
      #  * `CUC` - Cuban Convertible Peso
      #  * `CUP` - Cuban Peso
      #  * `CYP` - Cypriot Pound
      #  * `CZK` - Czech Koruna
      #  * `CSK` - Czechoslovak Hard Koruna
      #  * `DKK` - Danish Krone
      #  * `DJF` - Djiboutian Franc
      #  * `DOP` - Dominican Peso
      #  * `NLG` - Dutch Guilder
      #  * `XCD` - East Caribbean Dollar
      #  * `DDM` - East German Mark
      #  * `ECS` - Ecuadorian Sucre
      #  * `ECV` - Ecuadorian Unit of Constant Value
      #  * `EGP` - Egyptian Pound
      #  * `GQE` - Equatorial Guinean Ekwele
      #  * `ERN` - Eritrean Nakfa
      #  * `EEK` - Estonian Kroon
      #  * `ETB` - Ethiopian Birr
      #  * `EUR` - Euro
      #  * `XBA` - European Composite Unit
      #  * `XEU` - European Currency Unit
      #  * `XBB` - European Monetary Unit
      #  * `XBC` - European Unit of Account (XBC)
      #  * `XBD` - European Unit of Account (XBD)
      #  * `FKP` - Falkland Islands Pound
      #  * `FJD` - Fijian Dollar
      #  * `FIM` - Finnish Markka
      #  * `FRF` - French Franc
      #  * `XFO` - French Gold Franc
      #  * `XFU` - French UIC-Franc
      #  * `GMD` - Gambian Dalasi
      #  * `GEK` - Georgian Kupon Larit
      #  * `GEL` - Georgian Lari
      #  * `DEM` - German Mark
      #  * `GHS` - Ghanaian Cedi
      #  * `GHC` - Ghanaian Cedi (1979–2007)
      #  * `GIP` - Gibraltar Pound
      #  * `XAU` - Gold
      #  * `GRD` - Greek Drachma
      #  * `GTQ` - Guatemalan Quetzal
      #  * `GWP` - Guinea-Bissau Peso
      #  * `GNF` - Guinean Franc
      #  * `GNS` - Guinean Syli
      #  * `GYD` - Guyanaese Dollar
      #  * `HTG` - Haitian Gourde
      #  * `HNL` - Honduran Lempira
      #  * `HKD` - Hong Kong Dollar
      #  * `HUF` - Hungarian Forint
      #  * `IMP` - IMP
      #  * `ISK` - Icelandic Króna
      #  * `ISJ` - Icelandic Króna (1918–1981)
      #  * `INR` - Indian Rupee
      #  * `IDR` - Indonesian Rupiah
      #  * `IRR` - Iranian Rial
      #  * `IQD` - Iraqi Dinar
      #  * `IEP` - Irish Pound
      #  * `ILS` - Israeli New Shekel
      #  * `ILP` - Israeli Pound
      #  * `ILR` - Israeli Shekel (1980–1985)
      #  * `ITL` - Italian Lira
      #  * `JMD` - Jamaican Dollar
      #  * `JPY` - Japanese Yen
      #  * `JOD` - Jordanian Dinar
      #  * `KZT` - Kazakhstani Tenge
      #  * `KES` - Kenyan Shilling
      #  * `KWD` - Kuwaiti Dinar
      #  * `KGS` - Kyrgystani Som
      #  * `LAK` - Laotian Kip
      #  * `LVL` - Latvian Lats
      #  * `LVR` - Latvian Ruble
      #  * `LBP` - Lebanese Pound
      #  * `LSL` - Lesotho Loti
      #  * `LRD` - Liberian Dollar
      #  * `LYD` - Libyan Dinar
      #  * `LTL` - Lithuanian Litas
      #  * `LTT` - Lithuanian Talonas
      #  * `LUL` - Luxembourg Financial Franc
      #  * `LUC` - Luxembourgian Convertible Franc
      #  * `LUF` - Luxembourgian Franc
      #  * `MOP` - Macanese Pataca
      #  * `MKD` - Macedonian Denar
      #  * `MKN` - Macedonian Denar (1992–1993)
      #  * `MGA` - Malagasy Ariary
      #  * `MGF` - Malagasy Franc
      #  * `MWK` - Malawian Kwacha
      #  * `MYR` - Malaysian Ringgit
      #  * `MVR` - Maldivian Rufiyaa
      #  * `MVP` - Maldivian Rupee (1947–1981)
      #  * `MLF` - Malian Franc
      #  * `MTL` - Maltese Lira
      #  * `MTP` - Maltese Pound
      #  * `MRU` - Mauritanian Ouguiya
      #  * `MRO` - Mauritanian Ouguiya (1973–2017)
      #  * `MUR` - Mauritian Rupee
      #  * `MXV` - Mexican Investment Unit
      #  * `MXN` - Mexican Peso
      #  * `MXP` - Mexican Silver Peso (1861–1992)
      #  * `MDC` - Moldovan Cupon
      #  * `MDL` - Moldovan Leu
      #  * `MCF` - Monegasque Franc
      #  * `MNT` - Mongolian Tugrik
      #  * `MAD` - Moroccan Dirham
      #  * `MAF` - Moroccan Franc
      #  * `MZE` - Mozambican Escudo
      #  * `MZN` - Mozambican Metical
      #  * `MZM` - Mozambican Metical (1980–2006)
      #  * `MMK` - Myanmar Kyat
      #  * `NAD` - Namibian Dollar
      #  * `NPR` - Nepalese Rupee
      #  * `ANG` - Netherlands Antillean Guilder
      #  * `TWD` - New Taiwan Dollar
      #  * `NZD` - New Zealand Dollar
      #  * `NIO` - Nicaraguan Córdoba
      #  * `NIC` - Nicaraguan Córdoba (1988–1991)
      #  * `NGN` - Nigerian Naira
      #  * `KPW` - North Korean Won
      #  * `NOK` - Norwegian Krone
      #  * `OMR` - Omani Rial
      #  * `PKR` - Pakistani Rupee
      #  * `XPD` - Palladium
      #  * `PAB` - Panamanian Balboa
      #  * `PGK` - Papua New Guinean Kina
      #  * `PYG` - Paraguayan Guarani
      #  * `PEI` - Peruvian Inti
      #  * `PEN` - Peruvian Sol
      #  * `PES` - Peruvian Sol (1863–1965)
      #  * `PHP` - Philippine Peso
      #  * `XPT` - Platinum
      #  * `PLN` - Polish Zloty
      #  * `PLZ` - Polish Zloty (1950–1995)
      #  * `PTE` - Portuguese Escudo
      #  * `GWE` - Portuguese Guinea Escudo
      #  * `QAR` - Qatari Rial
      #  * `XRE` - RINET Funds
      #  * `RHD` - Rhodesian Dollar
      #  * `RON` - Romanian Leu
      #  * `ROL` - Romanian Leu (1952–2006)
      #  * `RUB` - Russian Ruble
      #  * `RUR` - Russian Ruble (1991–1998)
      #  * `RWF` - Rwandan Franc
      #  * `SVC` - Salvadoran Colón
      #  * `WST` - Samoan Tala
      #  * `SAR` - Saudi Riyal
      #  * `RSD` - Serbian Dinar
      #  * `CSD` - Serbian Dinar (2002–2006)
      #  * `SCR` - Seychellois Rupee
      #  * `SLL` - Sierra Leonean Leone
      #  * `XAG` - Silver
      #  * `SGD` - Singapore Dollar
      #  * `SKK` - Slovak Koruna
      #  * `SIT` - Slovenian Tolar
      #  * `SBD` - Solomon Islands Dollar
      #  * `SOS` - Somali Shilling
      #  * `ZAR` - South African Rand
      #  * `ZAL` - South African Rand (financial)
      #  * `KRH` - South Korean Hwan (1953–1962)
      #  * `KRW` - South Korean Won
      #  * `KRO` - South Korean Won (1945–1953)
      #  * `SSP` - South Sudanese Pound
      #  * `SUR` - Soviet Rouble
      #  * `ESP` - Spanish Peseta
      #  * `ESA` - Spanish Peseta (A account)
      #  * `ESB` - Spanish Peseta (convertible account)
      #  * `XDR` - Special Drawing Rights
      #  * `LKR` - Sri Lankan Rupee
      #  * `SHP` - St. Helena Pound
      #  * `XSU` - Sucre
      #  * `SDD` - Sudanese Dinar (1992–2007)
      #  * `SDG` - Sudanese Pound
      #  * `SDP` - Sudanese Pound (1957–1998)
      #  * `SRD` - Surinamese Dollar
      #  * `SRG` - Surinamese Guilder
      #  * `SZL` - Swazi Lilangeni
      #  * `SEK` - Swedish Krona
      #  * `CHF` - Swiss Franc
      #  * `SYP` - Syrian Pound
      #  * `STN` - São Tomé & Príncipe Dobra
      #  * `STD` - São Tomé & Príncipe Dobra (1977–2017)
      #  * `TVD` - TVD
      #  * `TJR` - Tajikistani Ruble
      #  * `TJS` - Tajikistani Somoni
      #  * `TZS` - Tanzanian Shilling
      #  * `XTS` - Testing Currency Code
      #  * `THB` - Thai Baht
      #  * `XXX` - The codes assigned for transactions where no currency is involved
      #  * `TPE` - Timorese Escudo
      #  * `TOP` - Tongan Paʻanga
      #  * `TTD` - Trinidad & Tobago Dollar
      #  * `TND` - Tunisian Dinar
      #  * `TRY` - Turkish Lira
      #  * `TRL` - Turkish Lira (1922–2005)
      #  * `TMT` - Turkmenistani Manat
      #  * `TMM` - Turkmenistani Manat (1993–2009)
      #  * `USD` - US Dollar
      #  * `USN` - US Dollar (Next day)
      #  * `USS` - US Dollar (Same day)
      #  * `UGX` - Ugandan Shilling
      #  * `UGS` - Ugandan Shilling (1966–1987)
      #  * `UAH` - Ukrainian Hryvnia
      #  * `UAK` - Ukrainian Karbovanets
      #  * `AED` - United Arab Emirates Dirham
      #  * `UYW` - Uruguayan Nominal Wage Index Unit
      #  * `UYU` - Uruguayan Peso
      #  * `UYP` - Uruguayan Peso (1975–1993)
      #  * `UYI` - Uruguayan Peso (Indexed Units)
      #  * `UZS` - Uzbekistani Som
      #  * `VUV` - Vanuatu Vatu
      #  * `VES` - Venezuelan Bolívar
      #  * `VEB` - Venezuelan Bolívar (1871–2008)
      #  * `VEF` - Venezuelan Bolívar (2008–2018)
      #  * `VND` - Vietnamese Dong
      #  * `VNN` - Vietnamese Dong (1978–1985)
      #  * `CHE` - WIR Euro
      #  * `CHW` - WIR Franc
      #  * `XOF` - West African CFA Franc
      #  * `YDD` - Yemeni Dinar
      #  * `YER` - Yemeni Rial
      #  * `YUN` - Yugoslavian Convertible Dinar (1990–1992)
      #  * `YUD` - Yugoslavian Hard Dinar (1966–1990)
      #  * `YUM` - Yugoslavian New Dinar (1994–2002)
      #  * `YUR` - Yugoslavian Reformed Dinar (1992–1993)
      #  * `ZWN` - ZWN
      #  * `ZRN` - Zairean New Zaire (1993–1998)
      #  * `ZRZ` - Zairean Zaire (1971–1993)
      #  * `ZMW` - Zambian Kwacha
      #  * `ZMK` - Zambian Kwacha (1968–2012)
      #  * `ZWD` - Zimbabwean Dollar (1980–2008)
      #  * `ZWR` - Zimbabwean Dollar (2008)
      #  * `ZWL` - Zimbabwean Dollar (2009)
      attr_reader :currency
      # @return [String] Exchange rate used if the line item is in a foreign currency.
      attr_reader :exchange_rate
      # @return [Boolean] Whether the expense line is billable to a client or project.
      attr_reader :is_billable
      # @return [Array<String>] The related tracking categories associated with the expense report (Department,
      #  Location, Class, Expense Category)
      attr_reader :tracking_categories
      # @return [Merge::Accounting::ExpenseReportLineRequestEmployee] Identifier for the employee who submitted or is associated with the expense
      #  report
      attr_reader :employee
      # @return [Merge::Accounting::ExpenseReportLineRequestProject]
      attr_reader :project
      # @return [Merge::Accounting::ExpenseReportLineRequestCompany] The subsidiary that the expense report is created in
      attr_reader :company
      # @return [Merge::Accounting::ExpenseReportLineRequestContact]
      attr_reader :contact
      # @return [Float] Quantity for the expense line (e.g., miles driven, items purchased).
      attr_reader :quantity
      # @return [Float] Price per unit for the expense line (if applicable).
      attr_reader :unit_price
      # @return [Boolean] Whether the expense line is non-reimbursable (e.g., paid via company card).
      attr_reader :non_reimbursable
      # @return [Float] Tax amount applicable for the line item.
      attr_reader :tax_amount
      # @return [Boolean] Whether the amount is inclusive of tax.
      attr_reader :inclusive_of_tax
      # @return [Merge::Accounting::ExpenseReportLineRequestTaxRate]
      attr_reader :tax_rate
      # @return [Hash{String => Object}]
      attr_reader :integration_params
      # @return [Hash{String => Object}]
      attr_reader :linked_account_params
      # @return [Array<Merge::Accounting::RemoteFieldRequest>]
      attr_reader :remote_fields
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param remote_id [String] The third-party API ID of the matching object.
      # @param account [Merge::Accounting::ExpenseReportLineRequestAccount]
      # @param description [String] Description of the individual expense.
      # @param expense_date [DateTime] The date the individual expense was incurred.
      # @param amount [Float] The amount of the expense for the line item.
      # @param currency [Merge::Accounting::TransactionCurrencyEnum] Currency of the expense line (if different from the report currency).
      #  * `XUA` - ADB Unit of Account
      #  * `AFN` - Afghan Afghani
      #  * `AFA` - Afghan Afghani (1927–2002)
      #  * `ALL` - Albanian Lek
      #  * `ALK` - Albanian Lek (1946–1965)
      #  * `DZD` - Algerian Dinar
      #  * `ADP` - Andorran Peseta
      #  * `AOA` - Angolan Kwanza
      #  * `AOK` - Angolan Kwanza (1977–1991)
      #  * `AON` - Angolan New Kwanza (1990–2000)
      #  * `AOR` - Angolan Readjusted Kwanza (1995–1999)
      #  * `ARA` - Argentine Austral
      #  * `ARS` - Argentine Peso
      #  * `ARM` - Argentine Peso (1881–1970)
      #  * `ARP` - Argentine Peso (1983–1985)
      #  * `ARL` - Argentine Peso Ley (1970–1983)
      #  * `AMD` - Armenian Dram
      #  * `AWG` - Aruban Florin
      #  * `AUD` - Australian Dollar
      #  * `ATS` - Austrian Schilling
      #  * `AZN` - Azerbaijani Manat
      #  * `AZM` - Azerbaijani Manat (1993–2006)
      #  * `BSD` - Bahamian Dollar
      #  * `BHD` - Bahraini Dinar
      #  * `BDT` - Bangladeshi Taka
      #  * `BBD` - Barbadian Dollar
      #  * `BYN` - Belarusian Ruble
      #  * `BYB` - Belarusian Ruble (1994–1999)
      #  * `BYR` - Belarusian Ruble (2000–2016)
      #  * `BEF` - Belgian Franc
      #  * `BEC` - Belgian Franc (convertible)
      #  * `BEL` - Belgian Franc (financial)
      #  * `BZD` - Belize Dollar
      #  * `BMD` - Bermudan Dollar
      #  * `BTN` - Bhutanese Ngultrum
      #  * `BOB` - Bolivian Boliviano
      #  * `BOL` - Bolivian Boliviano (1863–1963)
      #  * `BOV` - Bolivian Mvdol
      #  * `BOP` - Bolivian Peso
      #  * `BAM` - Bosnia-Herzegovina Convertible Mark
      #  * `BAD` - Bosnia-Herzegovina Dinar (1992–1994)
      #  * `BAN` - Bosnia-Herzegovina New Dinar (1994–1997)
      #  * `BWP` - Botswanan Pula
      #  * `BRC` - Brazilian Cruzado (1986–1989)
      #  * `BRZ` - Brazilian Cruzeiro (1942–1967)
      #  * `BRE` - Brazilian Cruzeiro (1990–1993)
      #  * `BRR` - Brazilian Cruzeiro (1993–1994)
      #  * `BRN` - Brazilian New Cruzado (1989–1990)
      #  * `BRB` - Brazilian New Cruzeiro (1967–1986)
      #  * `BRL` - Brazilian Real
      #  * `GBP` - British Pound
      #  * `BND` - Brunei Dollar
      #  * `BGL` - Bulgarian Hard Lev
      #  * `BGN` - Bulgarian Lev
      #  * `BGO` - Bulgarian Lev (1879–1952)
      #  * `BGM` - Bulgarian Socialist Lev
      #  * `BUK` - Burmese Kyat
      #  * `BIF` - Burundian Franc
      #  * `XPF` - CFP Franc
      #  * `KHR` - Cambodian Riel
      #  * `CAD` - Canadian Dollar
      #  * `CVE` - Cape Verdean Escudo
      #  * `KYD` - Cayman Islands Dollar
      #  * `XAF` - Central African CFA Franc
      #  * `CLE` - Chilean Escudo
      #  * `CLP` - Chilean Peso
      #  * `CLF` - Chilean Unit of Account (UF)
      #  * `CNX` - Chinese People’s Bank Dollar
      #  * `CNY` - Chinese Yuan
      #  * `CNH` - Chinese Yuan (offshore)
      #  * `COP` - Colombian Peso
      #  * `COU` - Colombian Real Value Unit
      #  * `KMF` - Comorian Franc
      #  * `CDF` - Congolese Franc
      #  * `CRC` - Costa Rican Colón
      #  * `HRD` - Croatian Dinar
      #  * `HRK` - Croatian Kuna
      #  * `CUC` - Cuban Convertible Peso
      #  * `CUP` - Cuban Peso
      #  * `CYP` - Cypriot Pound
      #  * `CZK` - Czech Koruna
      #  * `CSK` - Czechoslovak Hard Koruna
      #  * `DKK` - Danish Krone
      #  * `DJF` - Djiboutian Franc
      #  * `DOP` - Dominican Peso
      #  * `NLG` - Dutch Guilder
      #  * `XCD` - East Caribbean Dollar
      #  * `DDM` - East German Mark
      #  * `ECS` - Ecuadorian Sucre
      #  * `ECV` - Ecuadorian Unit of Constant Value
      #  * `EGP` - Egyptian Pound
      #  * `GQE` - Equatorial Guinean Ekwele
      #  * `ERN` - Eritrean Nakfa
      #  * `EEK` - Estonian Kroon
      #  * `ETB` - Ethiopian Birr
      #  * `EUR` - Euro
      #  * `XBA` - European Composite Unit
      #  * `XEU` - European Currency Unit
      #  * `XBB` - European Monetary Unit
      #  * `XBC` - European Unit of Account (XBC)
      #  * `XBD` - European Unit of Account (XBD)
      #  * `FKP` - Falkland Islands Pound
      #  * `FJD` - Fijian Dollar
      #  * `FIM` - Finnish Markka
      #  * `FRF` - French Franc
      #  * `XFO` - French Gold Franc
      #  * `XFU` - French UIC-Franc
      #  * `GMD` - Gambian Dalasi
      #  * `GEK` - Georgian Kupon Larit
      #  * `GEL` - Georgian Lari
      #  * `DEM` - German Mark
      #  * `GHS` - Ghanaian Cedi
      #  * `GHC` - Ghanaian Cedi (1979–2007)
      #  * `GIP` - Gibraltar Pound
      #  * `XAU` - Gold
      #  * `GRD` - Greek Drachma
      #  * `GTQ` - Guatemalan Quetzal
      #  * `GWP` - Guinea-Bissau Peso
      #  * `GNF` - Guinean Franc
      #  * `GNS` - Guinean Syli
      #  * `GYD` - Guyanaese Dollar
      #  * `HTG` - Haitian Gourde
      #  * `HNL` - Honduran Lempira
      #  * `HKD` - Hong Kong Dollar
      #  * `HUF` - Hungarian Forint
      #  * `IMP` - IMP
      #  * `ISK` - Icelandic Króna
      #  * `ISJ` - Icelandic Króna (1918–1981)
      #  * `INR` - Indian Rupee
      #  * `IDR` - Indonesian Rupiah
      #  * `IRR` - Iranian Rial
      #  * `IQD` - Iraqi Dinar
      #  * `IEP` - Irish Pound
      #  * `ILS` - Israeli New Shekel
      #  * `ILP` - Israeli Pound
      #  * `ILR` - Israeli Shekel (1980–1985)
      #  * `ITL` - Italian Lira
      #  * `JMD` - Jamaican Dollar
      #  * `JPY` - Japanese Yen
      #  * `JOD` - Jordanian Dinar
      #  * `KZT` - Kazakhstani Tenge
      #  * `KES` - Kenyan Shilling
      #  * `KWD` - Kuwaiti Dinar
      #  * `KGS` - Kyrgystani Som
      #  * `LAK` - Laotian Kip
      #  * `LVL` - Latvian Lats
      #  * `LVR` - Latvian Ruble
      #  * `LBP` - Lebanese Pound
      #  * `LSL` - Lesotho Loti
      #  * `LRD` - Liberian Dollar
      #  * `LYD` - Libyan Dinar
      #  * `LTL` - Lithuanian Litas
      #  * `LTT` - Lithuanian Talonas
      #  * `LUL` - Luxembourg Financial Franc
      #  * `LUC` - Luxembourgian Convertible Franc
      #  * `LUF` - Luxembourgian Franc
      #  * `MOP` - Macanese Pataca
      #  * `MKD` - Macedonian Denar
      #  * `MKN` - Macedonian Denar (1992–1993)
      #  * `MGA` - Malagasy Ariary
      #  * `MGF` - Malagasy Franc
      #  * `MWK` - Malawian Kwacha
      #  * `MYR` - Malaysian Ringgit
      #  * `MVR` - Maldivian Rufiyaa
      #  * `MVP` - Maldivian Rupee (1947–1981)
      #  * `MLF` - Malian Franc
      #  * `MTL` - Maltese Lira
      #  * `MTP` - Maltese Pound
      #  * `MRU` - Mauritanian Ouguiya
      #  * `MRO` - Mauritanian Ouguiya (1973–2017)
      #  * `MUR` - Mauritian Rupee
      #  * `MXV` - Mexican Investment Unit
      #  * `MXN` - Mexican Peso
      #  * `MXP` - Mexican Silver Peso (1861–1992)
      #  * `MDC` - Moldovan Cupon
      #  * `MDL` - Moldovan Leu
      #  * `MCF` - Monegasque Franc
      #  * `MNT` - Mongolian Tugrik
      #  * `MAD` - Moroccan Dirham
      #  * `MAF` - Moroccan Franc
      #  * `MZE` - Mozambican Escudo
      #  * `MZN` - Mozambican Metical
      #  * `MZM` - Mozambican Metical (1980–2006)
      #  * `MMK` - Myanmar Kyat
      #  * `NAD` - Namibian Dollar
      #  * `NPR` - Nepalese Rupee
      #  * `ANG` - Netherlands Antillean Guilder
      #  * `TWD` - New Taiwan Dollar
      #  * `NZD` - New Zealand Dollar
      #  * `NIO` - Nicaraguan Córdoba
      #  * `NIC` - Nicaraguan Córdoba (1988–1991)
      #  * `NGN` - Nigerian Naira
      #  * `KPW` - North Korean Won
      #  * `NOK` - Norwegian Krone
      #  * `OMR` - Omani Rial
      #  * `PKR` - Pakistani Rupee
      #  * `XPD` - Palladium
      #  * `PAB` - Panamanian Balboa
      #  * `PGK` - Papua New Guinean Kina
      #  * `PYG` - Paraguayan Guarani
      #  * `PEI` - Peruvian Inti
      #  * `PEN` - Peruvian Sol
      #  * `PES` - Peruvian Sol (1863–1965)
      #  * `PHP` - Philippine Peso
      #  * `XPT` - Platinum
      #  * `PLN` - Polish Zloty
      #  * `PLZ` - Polish Zloty (1950–1995)
      #  * `PTE` - Portuguese Escudo
      #  * `GWE` - Portuguese Guinea Escudo
      #  * `QAR` - Qatari Rial
      #  * `XRE` - RINET Funds
      #  * `RHD` - Rhodesian Dollar
      #  * `RON` - Romanian Leu
      #  * `ROL` - Romanian Leu (1952–2006)
      #  * `RUB` - Russian Ruble
      #  * `RUR` - Russian Ruble (1991–1998)
      #  * `RWF` - Rwandan Franc
      #  * `SVC` - Salvadoran Colón
      #  * `WST` - Samoan Tala
      #  * `SAR` - Saudi Riyal
      #  * `RSD` - Serbian Dinar
      #  * `CSD` - Serbian Dinar (2002–2006)
      #  * `SCR` - Seychellois Rupee
      #  * `SLL` - Sierra Leonean Leone
      #  * `XAG` - Silver
      #  * `SGD` - Singapore Dollar
      #  * `SKK` - Slovak Koruna
      #  * `SIT` - Slovenian Tolar
      #  * `SBD` - Solomon Islands Dollar
      #  * `SOS` - Somali Shilling
      #  * `ZAR` - South African Rand
      #  * `ZAL` - South African Rand (financial)
      #  * `KRH` - South Korean Hwan (1953–1962)
      #  * `KRW` - South Korean Won
      #  * `KRO` - South Korean Won (1945–1953)
      #  * `SSP` - South Sudanese Pound
      #  * `SUR` - Soviet Rouble
      #  * `ESP` - Spanish Peseta
      #  * `ESA` - Spanish Peseta (A account)
      #  * `ESB` - Spanish Peseta (convertible account)
      #  * `XDR` - Special Drawing Rights
      #  * `LKR` - Sri Lankan Rupee
      #  * `SHP` - St. Helena Pound
      #  * `XSU` - Sucre
      #  * `SDD` - Sudanese Dinar (1992–2007)
      #  * `SDG` - Sudanese Pound
      #  * `SDP` - Sudanese Pound (1957–1998)
      #  * `SRD` - Surinamese Dollar
      #  * `SRG` - Surinamese Guilder
      #  * `SZL` - Swazi Lilangeni
      #  * `SEK` - Swedish Krona
      #  * `CHF` - Swiss Franc
      #  * `SYP` - Syrian Pound
      #  * `STN` - São Tomé & Príncipe Dobra
      #  * `STD` - São Tomé & Príncipe Dobra (1977–2017)
      #  * `TVD` - TVD
      #  * `TJR` - Tajikistani Ruble
      #  * `TJS` - Tajikistani Somoni
      #  * `TZS` - Tanzanian Shilling
      #  * `XTS` - Testing Currency Code
      #  * `THB` - Thai Baht
      #  * `XXX` - The codes assigned for transactions where no currency is involved
      #  * `TPE` - Timorese Escudo
      #  * `TOP` - Tongan Paʻanga
      #  * `TTD` - Trinidad & Tobago Dollar
      #  * `TND` - Tunisian Dinar
      #  * `TRY` - Turkish Lira
      #  * `TRL` - Turkish Lira (1922–2005)
      #  * `TMT` - Turkmenistani Manat
      #  * `TMM` - Turkmenistani Manat (1993–2009)
      #  * `USD` - US Dollar
      #  * `USN` - US Dollar (Next day)
      #  * `USS` - US Dollar (Same day)
      #  * `UGX` - Ugandan Shilling
      #  * `UGS` - Ugandan Shilling (1966–1987)
      #  * `UAH` - Ukrainian Hryvnia
      #  * `UAK` - Ukrainian Karbovanets
      #  * `AED` - United Arab Emirates Dirham
      #  * `UYW` - Uruguayan Nominal Wage Index Unit
      #  * `UYU` - Uruguayan Peso
      #  * `UYP` - Uruguayan Peso (1975–1993)
      #  * `UYI` - Uruguayan Peso (Indexed Units)
      #  * `UZS` - Uzbekistani Som
      #  * `VUV` - Vanuatu Vatu
      #  * `VES` - Venezuelan Bolívar
      #  * `VEB` - Venezuelan Bolívar (1871–2008)
      #  * `VEF` - Venezuelan Bolívar (2008–2018)
      #  * `VND` - Vietnamese Dong
      #  * `VNN` - Vietnamese Dong (1978–1985)
      #  * `CHE` - WIR Euro
      #  * `CHW` - WIR Franc
      #  * `XOF` - West African CFA Franc
      #  * `YDD` - Yemeni Dinar
      #  * `YER` - Yemeni Rial
      #  * `YUN` - Yugoslavian Convertible Dinar (1990–1992)
      #  * `YUD` - Yugoslavian Hard Dinar (1966–1990)
      #  * `YUM` - Yugoslavian New Dinar (1994–2002)
      #  * `YUR` - Yugoslavian Reformed Dinar (1992–1993)
      #  * `ZWN` - ZWN
      #  * `ZRN` - Zairean New Zaire (1993–1998)
      #  * `ZRZ` - Zairean Zaire (1971–1993)
      #  * `ZMW` - Zambian Kwacha
      #  * `ZMK` - Zambian Kwacha (1968–2012)
      #  * `ZWD` - Zimbabwean Dollar (1980–2008)
      #  * `ZWR` - Zimbabwean Dollar (2008)
      #  * `ZWL` - Zimbabwean Dollar (2009)
      # @param exchange_rate [String] Exchange rate used if the line item is in a foreign currency.
      # @param is_billable [Boolean] Whether the expense line is billable to a client or project.
      # @param tracking_categories [Array<String>] The related tracking categories associated with the expense report (Department,
      #  Location, Class, Expense Category)
      # @param employee [Merge::Accounting::ExpenseReportLineRequestEmployee] Identifier for the employee who submitted or is associated with the expense
      #  report
      # @param project [Merge::Accounting::ExpenseReportLineRequestProject]
      # @param company [Merge::Accounting::ExpenseReportLineRequestCompany] The subsidiary that the expense report is created in
      # @param contact [Merge::Accounting::ExpenseReportLineRequestContact]
      # @param quantity [Float] Quantity for the expense line (e.g., miles driven, items purchased).
      # @param unit_price [Float] Price per unit for the expense line (if applicable).
      # @param non_reimbursable [Boolean] Whether the expense line is non-reimbursable (e.g., paid via company card).
      # @param tax_amount [Float] Tax amount applicable for the line item.
      # @param inclusive_of_tax [Boolean] Whether the amount is inclusive of tax.
      # @param tax_rate [Merge::Accounting::ExpenseReportLineRequestTaxRate]
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param remote_fields [Array<Merge::Accounting::RemoteFieldRequest>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::ExpenseReportLineRequest]
      def initialize(tracking_categories:, remote_id: OMIT, account: OMIT, description: OMIT, expense_date: OMIT, amount: OMIT,
                     currency: OMIT, exchange_rate: OMIT, is_billable: OMIT, employee: OMIT, project: OMIT, company: OMIT, contact: OMIT, quantity: OMIT, unit_price: OMIT, non_reimbursable: OMIT, tax_amount: OMIT, inclusive_of_tax: OMIT, tax_rate: OMIT, integration_params: OMIT, linked_account_params: OMIT, remote_fields: OMIT, additional_properties: nil)
        @remote_id = remote_id if remote_id != OMIT
        @account = account if account != OMIT
        @description = description if description != OMIT
        @expense_date = expense_date if expense_date != OMIT
        @amount = amount if amount != OMIT
        @currency = currency if currency != OMIT
        @exchange_rate = exchange_rate if exchange_rate != OMIT
        @is_billable = is_billable if is_billable != OMIT
        @tracking_categories = tracking_categories
        @employee = employee if employee != OMIT
        @project = project if project != OMIT
        @company = company if company != OMIT
        @contact = contact if contact != OMIT
        @quantity = quantity if quantity != OMIT
        @unit_price = unit_price if unit_price != OMIT
        @non_reimbursable = non_reimbursable if non_reimbursable != OMIT
        @tax_amount = tax_amount if tax_amount != OMIT
        @inclusive_of_tax = inclusive_of_tax if inclusive_of_tax != OMIT
        @tax_rate = tax_rate if tax_rate != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @remote_fields = remote_fields if remote_fields != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "remote_id": remote_id,
          "account": account,
          "description": description,
          "expense_date": expense_date,
          "amount": amount,
          "currency": currency,
          "exchange_rate": exchange_rate,
          "is_billable": is_billable,
          "tracking_categories": tracking_categories,
          "employee": employee,
          "project": project,
          "company": company,
          "contact": contact,
          "quantity": quantity,
          "unit_price": unit_price,
          "non_reimbursable": non_reimbursable,
          "tax_amount": tax_amount,
          "inclusive_of_tax": inclusive_of_tax,
          "tax_rate": tax_rate,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ExpenseReportLineRequest
      #
      # @param json_object [String]
      # @return [Merge::Accounting::ExpenseReportLineRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        remote_id = parsed_json["remote_id"]
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Merge::Accounting::ExpenseReportLineRequestAccount.from_json(json_object: account)
        end
        description = parsed_json["description"]
        expense_date = (DateTime.parse(parsed_json["expense_date"]) unless parsed_json["expense_date"].nil?)
        amount = parsed_json["amount"]
        currency = parsed_json["currency"]
        exchange_rate = parsed_json["exchange_rate"]
        is_billable = parsed_json["is_billable"]
        tracking_categories = parsed_json["tracking_categories"]
        if parsed_json["employee"].nil?
          employee = nil
        else
          employee = parsed_json["employee"].to_json
          employee = Merge::Accounting::ExpenseReportLineRequestEmployee.from_json(json_object: employee)
        end
        if parsed_json["project"].nil?
          project = nil
        else
          project = parsed_json["project"].to_json
          project = Merge::Accounting::ExpenseReportLineRequestProject.from_json(json_object: project)
        end
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Merge::Accounting::ExpenseReportLineRequestCompany.from_json(json_object: company)
        end
        if parsed_json["contact"].nil?
          contact = nil
        else
          contact = parsed_json["contact"].to_json
          contact = Merge::Accounting::ExpenseReportLineRequestContact.from_json(json_object: contact)
        end
        quantity = parsed_json["quantity"]
        unit_price = parsed_json["unit_price"]
        non_reimbursable = parsed_json["non_reimbursable"]
        tax_amount = parsed_json["tax_amount"]
        inclusive_of_tax = parsed_json["inclusive_of_tax"]
        if parsed_json["tax_rate"].nil?
          tax_rate = nil
        else
          tax_rate = parsed_json["tax_rate"].to_json
          tax_rate = Merge::Accounting::ExpenseReportLineRequestTaxRate.from_json(json_object: tax_rate)
        end
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        remote_fields = parsed_json["remote_fields"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldRequest.from_json(json_object: item)
        end
        new(
          remote_id: remote_id,
          account: account,
          description: description,
          expense_date: expense_date,
          amount: amount,
          currency: currency,
          exchange_rate: exchange_rate,
          is_billable: is_billable,
          tracking_categories: tracking_categories,
          employee: employee,
          project: project,
          company: company,
          contact: contact,
          quantity: quantity,
          unit_price: unit_price,
          non_reimbursable: non_reimbursable,
          tax_amount: tax_amount,
          inclusive_of_tax: inclusive_of_tax,
          tax_rate: tax_rate,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of ExpenseReportLineRequest to a JSON object
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
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.account.nil? || Merge::Accounting::ExpenseReportLineRequestAccount.validate_raw(obj: obj.account)
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.expense_date&.is_a?(DateTime) != false || raise("Passed value for field obj.expense_date is not the expected type, validation failed.")
        obj.amount&.is_a?(Float) != false || raise("Passed value for field obj.amount is not the expected type, validation failed.")
        obj.currency&.is_a?(Merge::Accounting::TransactionCurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
        obj.exchange_rate&.is_a?(String) != false || raise("Passed value for field obj.exchange_rate is not the expected type, validation failed.")
        obj.is_billable&.is_a?(Boolean) != false || raise("Passed value for field obj.is_billable is not the expected type, validation failed.")
        obj.tracking_categories.is_a?(Array) != false || raise("Passed value for field obj.tracking_categories is not the expected type, validation failed.")
        obj.employee.nil? || Merge::Accounting::ExpenseReportLineRequestEmployee.validate_raw(obj: obj.employee)
        obj.project.nil? || Merge::Accounting::ExpenseReportLineRequestProject.validate_raw(obj: obj.project)
        obj.company.nil? || Merge::Accounting::ExpenseReportLineRequestCompany.validate_raw(obj: obj.company)
        obj.contact.nil? || Merge::Accounting::ExpenseReportLineRequestContact.validate_raw(obj: obj.contact)
        obj.quantity&.is_a?(Float) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
        obj.unit_price&.is_a?(Float) != false || raise("Passed value for field obj.unit_price is not the expected type, validation failed.")
        obj.non_reimbursable&.is_a?(Boolean) != false || raise("Passed value for field obj.non_reimbursable is not the expected type, validation failed.")
        obj.tax_amount&.is_a?(Float) != false || raise("Passed value for field obj.tax_amount is not the expected type, validation failed.")
        obj.inclusive_of_tax&.is_a?(Boolean) != false || raise("Passed value for field obj.inclusive_of_tax is not the expected type, validation failed.")
        obj.tax_rate.nil? || Merge::Accounting::ExpenseReportLineRequestTaxRate.validate_raw(obj: obj.tax_rate)
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
