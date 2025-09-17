# frozen_string_literal: true

require "date"
require_relative "expense_report_request_employee"
require_relative "expense_report_status_enum"
require_relative "transaction_currency_enum"
require_relative "expense_report_request_accounting_period"
require_relative "expense_report_request_company"
require_relative "remote_field_request"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The ExpenseReport Object
    #  ### Description
    #  The `ExpenseReport` object represents a collection of expenses submitted for
    #  review and reimbursement.
    #  It includes details about the submitter, status, amounts, and associated
    #  metadata.
    #  ### Usage Example
    #  Fetch from the `GET ExpenseReport` endpoint to view details of expense reports
    #  and their line items.
    class ExpenseReportRequest
      # @return [DateTime] The date of the expense report.
      attr_reader :report_date
      # @return [String] Human-readable expense report identifier.
      attr_reader :report_identifier
      # @return [Merge::Accounting::ExpenseReportRequestEmployee] Identifier for the employee who submitted or is associated with the expense
      #  report
      attr_reader :employee
      # @return [Merge::Accounting::ExpenseReportStatusEnum] Overall status of the expense report. One of DRAFT, SUBMITTED, APPROVED,
      #  REJECTED
      #  * `DRAFT` - DRAFT
      #  * `SUBMITTED` - SUBMITTED
      #  * `APPROVED` - APPROVED
      #  * `REJECTED` - REJECTED
      attr_reader :status
      # @return [Float] Total amount of the expense report
      attr_reader :total_amount
      # @return [Merge::Accounting::TransactionCurrencyEnum] Currency code for the expense report
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
      # @return [String] A brief description or purpose for the expense report
      attr_reader :description
      # @return [Merge::Accounting::ExpenseReportRequestAccountingPeriod] The accounting period the report was posted in
      attr_reader :accounting_period
      # @return [Merge::Accounting::ExpenseReportRequestCompany] The subsidiary that the expense report is created in
      attr_reader :company
      # @return [Array<String>] The related tracking categories associated with the expense report
      attr_reader :tracking_categories
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

      # @param report_date [DateTime] The date of the expense report.
      # @param report_identifier [String] Human-readable expense report identifier.
      # @param employee [Merge::Accounting::ExpenseReportRequestEmployee] Identifier for the employee who submitted or is associated with the expense
      #  report
      # @param status [Merge::Accounting::ExpenseReportStatusEnum] Overall status of the expense report. One of DRAFT, SUBMITTED, APPROVED,
      #  REJECTED
      #  * `DRAFT` - DRAFT
      #  * `SUBMITTED` - SUBMITTED
      #  * `APPROVED` - APPROVED
      #  * `REJECTED` - REJECTED
      # @param total_amount [Float] Total amount of the expense report
      # @param currency [Merge::Accounting::TransactionCurrencyEnum] Currency code for the expense report
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
      # @param description [String] A brief description or purpose for the expense report
      # @param accounting_period [Merge::Accounting::ExpenseReportRequestAccountingPeriod] The accounting period the report was posted in
      # @param company [Merge::Accounting::ExpenseReportRequestCompany] The subsidiary that the expense report is created in
      # @param tracking_categories [Array<String>] The related tracking categories associated with the expense report
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param remote_fields [Array<Merge::Accounting::RemoteFieldRequest>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::ExpenseReportRequest]
      def initialize(tracking_categories:, report_date: OMIT, report_identifier: OMIT, employee: OMIT, status: OMIT, total_amount: OMIT,
                     currency: OMIT, description: OMIT, accounting_period: OMIT, company: OMIT, integration_params: OMIT, linked_account_params: OMIT, remote_fields: OMIT, additional_properties: nil)
        @report_date = report_date if report_date != OMIT
        @report_identifier = report_identifier if report_identifier != OMIT
        @employee = employee if employee != OMIT
        @status = status if status != OMIT
        @total_amount = total_amount if total_amount != OMIT
        @currency = currency if currency != OMIT
        @description = description if description != OMIT
        @accounting_period = accounting_period if accounting_period != OMIT
        @company = company if company != OMIT
        @tracking_categories = tracking_categories
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @remote_fields = remote_fields if remote_fields != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "report_date": report_date,
          "report_identifier": report_identifier,
          "employee": employee,
          "status": status,
          "total_amount": total_amount,
          "currency": currency,
          "description": description,
          "accounting_period": accounting_period,
          "company": company,
          "tracking_categories": tracking_categories,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ExpenseReportRequest
      #
      # @param json_object [String]
      # @return [Merge::Accounting::ExpenseReportRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        report_date = (DateTime.parse(parsed_json["report_date"]) unless parsed_json["report_date"].nil?)
        report_identifier = parsed_json["report_identifier"]
        if parsed_json["employee"].nil?
          employee = nil
        else
          employee = parsed_json["employee"].to_json
          employee = Merge::Accounting::ExpenseReportRequestEmployee.from_json(json_object: employee)
        end
        status = parsed_json["status"]
        total_amount = parsed_json["total_amount"]
        currency = parsed_json["currency"]
        description = parsed_json["description"]
        if parsed_json["accounting_period"].nil?
          accounting_period = nil
        else
          accounting_period = parsed_json["accounting_period"].to_json
          accounting_period = Merge::Accounting::ExpenseReportRequestAccountingPeriod.from_json(json_object: accounting_period)
        end
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Merge::Accounting::ExpenseReportRequestCompany.from_json(json_object: company)
        end
        tracking_categories = parsed_json["tracking_categories"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        remote_fields = parsed_json["remote_fields"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldRequest.from_json(json_object: item)
        end
        new(
          report_date: report_date,
          report_identifier: report_identifier,
          employee: employee,
          status: status,
          total_amount: total_amount,
          currency: currency,
          description: description,
          accounting_period: accounting_period,
          company: company,
          tracking_categories: tracking_categories,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of ExpenseReportRequest to a JSON object
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
        obj.report_date&.is_a?(DateTime) != false || raise("Passed value for field obj.report_date is not the expected type, validation failed.")
        obj.report_identifier&.is_a?(String) != false || raise("Passed value for field obj.report_identifier is not the expected type, validation failed.")
        obj.employee.nil? || Merge::Accounting::ExpenseReportRequestEmployee.validate_raw(obj: obj.employee)
        obj.status&.is_a?(Merge::Accounting::ExpenseReportStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.total_amount&.is_a?(Float) != false || raise("Passed value for field obj.total_amount is not the expected type, validation failed.")
        obj.currency&.is_a?(Merge::Accounting::TransactionCurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.accounting_period.nil? || Merge::Accounting::ExpenseReportRequestAccountingPeriod.validate_raw(obj: obj.accounting_period)
        obj.company.nil? || Merge::Accounting::ExpenseReportRequestCompany.validate_raw(obj: obj.company)
        obj.tracking_categories.is_a?(Array) != false || raise("Passed value for field obj.tracking_categories is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
