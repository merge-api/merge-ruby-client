# frozen_string_literal: true

require "date"
require_relative "purchase_order_status_enum"
require_relative "purchase_order_delivery_address"
require_relative "purchase_order_vendor"
require_relative "purchase_order_company"
require_relative "currency_enum"
require_relative "purchase_order_line_item"
require_relative "purchase_order_tracking_categories_item"
require_relative "purchase_order_accounting_period"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The PurchaseOrder Object
    #  ### Description
    #  A `PurchaseOrder` represents a request to purchase goods or services from a
    #  vendor. It outlines the details of the purchase, such as the items or services
    #  requested, quantities, prices, and delivery details.
    #  A `PurchaseOrder` is a crucial component of the procurement process, but does
    #  not typically result in any impact on the company’s general ledger. The general
    #  ledger is typically only affected when the `PurchaseOrder` is fulfilled as an
    #  _Accounts Payable_ Invoice object.
    #  ### Usage Example
    #  Fetch from the `LIST PurchaseOrders` endpoint and view a company's purchase
    #  orders.
    class PurchaseOrder
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Accounting::PurchaseOrderStatusEnum] The purchase order's status.
      #  - `DRAFT` - DRAFT
      #  - `SUBMITTED` - SUBMITTED
      #  - `AUTHORIZED` - AUTHORIZED
      #  - `BILLED` - BILLED
      #  - `DELETED` - DELETED
      attr_reader :status
      # @return [DateTime] The purchase order's issue date.
      attr_reader :issue_date
      # @return [String] The human-readable number of the purchase order.
      attr_reader :purchase_order_number
      # @return [DateTime] The purchase order's delivery date.
      attr_reader :delivery_date
      # @return [Merge::Accounting::PurchaseOrderDeliveryAddress] The purchase order's delivery address.
      attr_reader :delivery_address
      # @return [String] The contact making the purchase order.
      attr_reader :customer
      # @return [Merge::Accounting::PurchaseOrderVendor] The party fulfilling the purchase order.
      attr_reader :vendor
      # @return [String] A memo attached to the purchase order.
      attr_reader :memo
      # @return [Merge::Accounting::PurchaseOrderCompany] The company the purchase order belongs to.
      attr_reader :company
      # @return [Float] The purchase order's total amount.
      attr_reader :total_amount
      # @return [Merge::Accounting::CurrencyEnum] The purchase order's currency.
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
      # @return [String] The purchase order's exchange rate.
      attr_reader :exchange_rate
      # @return [Array<Merge::Accounting::PurchaseOrderLineItem>]
      attr_reader :line_items
      # @return [Array<Merge::Accounting::PurchaseOrderTrackingCategoriesItem>]
      attr_reader :tracking_categories
      # @return [DateTime] When the third party's purchase order note was created.
      attr_reader :remote_created_at
      # @return [DateTime] When the third party's purchase order note was updated.
      attr_reader :remote_updated_at
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      attr_reader :remote_was_deleted
      # @return [Merge::Accounting::PurchaseOrderAccountingPeriod] The accounting period that the PurchaseOrder was generated in.
      attr_reader :accounting_period
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Accounting::RemoteData>]
      attr_reader :remote_data
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
      # @param status [Merge::Accounting::PurchaseOrderStatusEnum] The purchase order's status.
      #  - `DRAFT` - DRAFT
      #  - `SUBMITTED` - SUBMITTED
      #  - `AUTHORIZED` - AUTHORIZED
      #  - `BILLED` - BILLED
      #  - `DELETED` - DELETED
      # @param issue_date [DateTime] The purchase order's issue date.
      # @param purchase_order_number [String] The human-readable number of the purchase order.
      # @param delivery_date [DateTime] The purchase order's delivery date.
      # @param delivery_address [Merge::Accounting::PurchaseOrderDeliveryAddress] The purchase order's delivery address.
      # @param customer [String] The contact making the purchase order.
      # @param vendor [Merge::Accounting::PurchaseOrderVendor] The party fulfilling the purchase order.
      # @param memo [String] A memo attached to the purchase order.
      # @param company [Merge::Accounting::PurchaseOrderCompany] The company the purchase order belongs to.
      # @param total_amount [Float] The purchase order's total amount.
      # @param currency [Merge::Accounting::CurrencyEnum] The purchase order's currency.
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
      # @param exchange_rate [String] The purchase order's exchange rate.
      # @param line_items [Array<Merge::Accounting::PurchaseOrderLineItem>]
      # @param tracking_categories [Array<Merge::Accounting::PurchaseOrderTrackingCategoriesItem>]
      # @param remote_created_at [DateTime] When the third party's purchase order note was created.
      # @param remote_updated_at [DateTime] When the third party's purchase order note was updated.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      # @param accounting_period [Merge::Accounting::PurchaseOrderAccountingPeriod] The accounting period that the PurchaseOrder was generated in.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Accounting::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::PurchaseOrder]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, status: OMIT, issue_date: OMIT,
                     purchase_order_number: OMIT, delivery_date: OMIT, delivery_address: OMIT, customer: OMIT, vendor: OMIT, memo: OMIT, company: OMIT, total_amount: OMIT, currency: OMIT, exchange_rate: OMIT, line_items: OMIT, tracking_categories: OMIT, remote_created_at: OMIT, remote_updated_at: OMIT, remote_was_deleted: OMIT, accounting_period: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @status = status if status != OMIT
        @issue_date = issue_date if issue_date != OMIT
        @purchase_order_number = purchase_order_number if purchase_order_number != OMIT
        @delivery_date = delivery_date if delivery_date != OMIT
        @delivery_address = delivery_address if delivery_address != OMIT
        @customer = customer if customer != OMIT
        @vendor = vendor if vendor != OMIT
        @memo = memo if memo != OMIT
        @company = company if company != OMIT
        @total_amount = total_amount if total_amount != OMIT
        @currency = currency if currency != OMIT
        @exchange_rate = exchange_rate if exchange_rate != OMIT
        @line_items = line_items if line_items != OMIT
        @tracking_categories = tracking_categories if tracking_categories != OMIT
        @remote_created_at = remote_created_at if remote_created_at != OMIT
        @remote_updated_at = remote_updated_at if remote_updated_at != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @accounting_period = accounting_period if accounting_period != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "status": status,
          "issue_date": issue_date,
          "purchase_order_number": purchase_order_number,
          "delivery_date": delivery_date,
          "delivery_address": delivery_address,
          "customer": customer,
          "vendor": vendor,
          "memo": memo,
          "company": company,
          "total_amount": total_amount,
          "currency": currency,
          "exchange_rate": exchange_rate,
          "line_items": line_items,
          "tracking_categories": tracking_categories,
          "remote_created_at": remote_created_at,
          "remote_updated_at": remote_updated_at,
          "remote_was_deleted": remote_was_deleted,
          "accounting_period": accounting_period,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of PurchaseOrder
      #
      # @param json_object [String]
      # @return [Merge::Accounting::PurchaseOrder]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        remote_id = struct["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        status = struct["status"]
        issue_date = (DateTime.parse(parsed_json["issue_date"]) unless parsed_json["issue_date"].nil?)
        purchase_order_number = struct["purchase_order_number"]
        delivery_date = (DateTime.parse(parsed_json["delivery_date"]) unless parsed_json["delivery_date"].nil?)
        if parsed_json["delivery_address"].nil?
          delivery_address = nil
        else
          delivery_address = parsed_json["delivery_address"].to_json
          delivery_address = Merge::Accounting::PurchaseOrderDeliveryAddress.from_json(json_object: delivery_address)
        end
        customer = struct["customer"]
        if parsed_json["vendor"].nil?
          vendor = nil
        else
          vendor = parsed_json["vendor"].to_json
          vendor = Merge::Accounting::PurchaseOrderVendor.from_json(json_object: vendor)
        end
        memo = struct["memo"]
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Merge::Accounting::PurchaseOrderCompany.from_json(json_object: company)
        end
        total_amount = struct["total_amount"]
        currency = struct["currency"]
        exchange_rate = struct["exchange_rate"]
        line_items = parsed_json["line_items"]&.map do |v|
          v = v.to_json
          Merge::Accounting::PurchaseOrderLineItem.from_json(json_object: v)
        end
        tracking_categories = parsed_json["tracking_categories"]&.map do |v|
          v = v.to_json
          Merge::Accounting::PurchaseOrderTrackingCategoriesItem.from_json(json_object: v)
        end
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        remote_was_deleted = struct["remote_was_deleted"]
        if parsed_json["accounting_period"].nil?
          accounting_period = nil
        else
          accounting_period = parsed_json["accounting_period"].to_json
          accounting_period = Merge::Accounting::PurchaseOrderAccountingPeriod.from_json(json_object: accounting_period)
        end
        field_mappings = struct["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Merge::Accounting::RemoteData.from_json(json_object: v)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          status: status,
          issue_date: issue_date,
          purchase_order_number: purchase_order_number,
          delivery_date: delivery_date,
          delivery_address: delivery_address,
          customer: customer,
          vendor: vendor,
          memo: memo,
          company: company,
          total_amount: total_amount,
          currency: currency,
          exchange_rate: exchange_rate,
          line_items: line_items,
          tracking_categories: tracking_categories,
          remote_created_at: remote_created_at,
          remote_updated_at: remote_updated_at,
          remote_was_deleted: remote_was_deleted,
          accounting_period: accounting_period,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of PurchaseOrder to a JSON object
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
        obj.status&.is_a?(Merge::Accounting::PurchaseOrderStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.issue_date&.is_a?(DateTime) != false || raise("Passed value for field obj.issue_date is not the expected type, validation failed.")
        obj.purchase_order_number&.is_a?(String) != false || raise("Passed value for field obj.purchase_order_number is not the expected type, validation failed.")
        obj.delivery_date&.is_a?(DateTime) != false || raise("Passed value for field obj.delivery_date is not the expected type, validation failed.")
        obj.delivery_address.nil? || Merge::Accounting::PurchaseOrderDeliveryAddress.validate_raw(obj: obj.delivery_address)
        obj.customer&.is_a?(String) != false || raise("Passed value for field obj.customer is not the expected type, validation failed.")
        obj.vendor.nil? || Merge::Accounting::PurchaseOrderVendor.validate_raw(obj: obj.vendor)
        obj.memo&.is_a?(String) != false || raise("Passed value for field obj.memo is not the expected type, validation failed.")
        obj.company.nil? || Merge::Accounting::PurchaseOrderCompany.validate_raw(obj: obj.company)
        obj.total_amount&.is_a?(Float) != false || raise("Passed value for field obj.total_amount is not the expected type, validation failed.")
        obj.currency&.is_a?(Merge::Accounting::CurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
        obj.exchange_rate&.is_a?(String) != false || raise("Passed value for field obj.exchange_rate is not the expected type, validation failed.")
        obj.line_items&.is_a?(Array) != false || raise("Passed value for field obj.line_items is not the expected type, validation failed.")
        obj.tracking_categories&.is_a?(Array) != false || raise("Passed value for field obj.tracking_categories is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.accounting_period.nil? || Merge::Accounting::PurchaseOrderAccountingPeriod.validate_raw(obj: obj.accounting_period)
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
