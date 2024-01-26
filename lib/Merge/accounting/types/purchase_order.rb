# frozen_string_literal: true
require_relative "purchase_order_status"
require "date"
require "date"
require_relative "purchase_order_delivery_address"
require_relative "purchase_order_vendor"
require_relative "purchase_order_company"
require_relative "purchase_order_currency"
require_relative "purchase_order_line_item"
require_relative "purchase_order_tracking_categories_item"
require "date"
require "date"
require_relative "purchase_order_accounting_period"
require "date"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Accounting
    # # The PurchaseOrder Object 
### Description

A `PurchaseOrder` represents a request to purchase goods or services from a vendor. It outlines the details of the purchase, such as the items or services requested, quantities, prices, and delivery details.

A `PurchaseOrder` is a crucial component of the procurement process, but does not typically result in any impact on the company’s general ledger. The general ledger is typically only affected when the `PurchaseOrder` is fulfilled as an _Accounts Payable_ Invoice object.

### Usage Example

Fetch from the `LIST PurchaseOrders` endpoint and view a company's purchase orders.
    class PurchaseOrder
      attr_reader :status, :issue_date, :purchase_order_number, :delivery_date, :delivery_address, :customer, :vendor, :memo, :company, :total_amount, :currency, :exchange_rate, :line_items, :tracking_categories, :remote_created_at, :remote_updated_at, :remote_was_deleted, :accounting_period, :id, :remote_id, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties
      # @param status [Accounting::PurchaseOrderStatus] The purchase order's status.  - `DRAFT` - DRAFT
- `SUBMITTED` - SUBMITTED
- `AUTHORIZED` - AUTHORIZED
- `BILLED` - BILLED
- `DELETED` - DELETED
      # @param issue_date [DateTime] The purchase order's issue date.
      # @param purchase_order_number [String] The human-readable number of the purchase order.
      # @param delivery_date [DateTime] The purchase order's delivery date.
      # @param delivery_address [Accounting::PurchaseOrderDeliveryAddress] The purchase order's delivery address.
      # @param customer [String] The contact making the purchase order.
      # @param vendor [Accounting::PurchaseOrderVendor] The party fulfilling the purchase order.
      # @param memo [String] A memo attached to the purchase order.
      # @param company [Accounting::PurchaseOrderCompany] The company the purchase order belongs to.
      # @param total_amount [Float] The purchase order's total amount.
      # @param currency [Accounting::PurchaseOrderCurrency] The purchase order's currency.  - `XUA` - ADB Unit of Account
- `AFN` - Afghan Afghani
- `AFA` - Afghan Afghani (1927–2002)
- `ALL` - Albanian Lek
- `ALK` - Albanian Lek (1946–1965)
- `DZD` - Algerian Dinar
- `ADP` - Andorran Peseta
- `AOA` - Angolan Kwanza
- `AOK` - Angolan Kwanza (1977–1991)
- `AON` - Angolan New Kwanza (1990–2000)
- `AOR` - Angolan Readjusted Kwanza (1995–1999)
- `ARA` - Argentine Austral
- `ARS` - Argentine Peso
- `ARM` - Argentine Peso (1881–1970)
- `ARP` - Argentine Peso (1983–1985)
- `ARL` - Argentine Peso Ley (1970–1983)
- `AMD` - Armenian Dram
- `AWG` - Aruban Florin
- `AUD` - Australian Dollar
- `ATS` - Austrian Schilling
- `AZN` - Azerbaijani Manat
- `AZM` - Azerbaijani Manat (1993–2006)
- `BSD` - Bahamian Dollar
- `BHD` - Bahraini Dinar
- `BDT` - Bangladeshi Taka
- `BBD` - Barbadian Dollar
- `BYN` - Belarusian Ruble
- `BYB` - Belarusian Ruble (1994–1999)
- `BYR` - Belarusian Ruble (2000–2016)
- `BEF` - Belgian Franc
- `BEC` - Belgian Franc (convertible)
- `BEL` - Belgian Franc (financial)
- `BZD` - Belize Dollar
- `BMD` - Bermudan Dollar
- `BTN` - Bhutanese Ngultrum
- `BOB` - Bolivian Boliviano
- `BOL` - Bolivian Boliviano (1863–1963)
- `BOV` - Bolivian Mvdol
- `BOP` - Bolivian Peso
- `BAM` - Bosnia-Herzegovina Convertible Mark
- `BAD` - Bosnia-Herzegovina Dinar (1992–1994)
- `BAN` - Bosnia-Herzegovina New Dinar (1994–1997)
- `BWP` - Botswanan Pula
- `BRC` - Brazilian Cruzado (1986–1989)
- `BRZ` - Brazilian Cruzeiro (1942–1967)
- `BRE` - Brazilian Cruzeiro (1990–1993)
- `BRR` - Brazilian Cruzeiro (1993–1994)
- `BRN` - Brazilian New Cruzado (1989–1990)
- `BRB` - Brazilian New Cruzeiro (1967–1986)
- `BRL` - Brazilian Real
- `GBP` - British Pound
- `BND` - Brunei Dollar
- `BGL` - Bulgarian Hard Lev
- `BGN` - Bulgarian Lev
- `BGO` - Bulgarian Lev (1879–1952)
- `BGM` - Bulgarian Socialist Lev
- `BUK` - Burmese Kyat
- `BIF` - Burundian Franc
- `XPF` - CFP Franc
- `KHR` - Cambodian Riel
- `CAD` - Canadian Dollar
- `CVE` - Cape Verdean Escudo
- `KYD` - Cayman Islands Dollar
- `XAF` - Central African CFA Franc
- `CLE` - Chilean Escudo
- `CLP` - Chilean Peso
- `CLF` - Chilean Unit of Account (UF)
- `CNX` - Chinese People’s Bank Dollar
- `CNY` - Chinese Yuan
- `CNH` - Chinese Yuan (offshore)
- `COP` - Colombian Peso
- `COU` - Colombian Real Value Unit
- `KMF` - Comorian Franc
- `CDF` - Congolese Franc
- `CRC` - Costa Rican Colón
- `HRD` - Croatian Dinar
- `HRK` - Croatian Kuna
- `CUC` - Cuban Convertible Peso
- `CUP` - Cuban Peso
- `CYP` - Cypriot Pound
- `CZK` - Czech Koruna
- `CSK` - Czechoslovak Hard Koruna
- `DKK` - Danish Krone
- `DJF` - Djiboutian Franc
- `DOP` - Dominican Peso
- `NLG` - Dutch Guilder
- `XCD` - East Caribbean Dollar
- `DDM` - East German Mark
- `ECS` - Ecuadorian Sucre
- `ECV` - Ecuadorian Unit of Constant Value
- `EGP` - Egyptian Pound
- `GQE` - Equatorial Guinean Ekwele
- `ERN` - Eritrean Nakfa
- `EEK` - Estonian Kroon
- `ETB` - Ethiopian Birr
- `EUR` - Euro
- `XBA` - European Composite Unit
- `XEU` - European Currency Unit
- `XBB` - European Monetary Unit
- `XBC` - European Unit of Account (XBC)
- `XBD` - European Unit of Account (XBD)
- `FKP` - Falkland Islands Pound
- `FJD` - Fijian Dollar
- `FIM` - Finnish Markka
- `FRF` - French Franc
- `XFO` - French Gold Franc
- `XFU` - French UIC-Franc
- `GMD` - Gambian Dalasi
- `GEK` - Georgian Kupon Larit
- `GEL` - Georgian Lari
- `DEM` - German Mark
- `GHS` - Ghanaian Cedi
- `GHC` - Ghanaian Cedi (1979–2007)
- `GIP` - Gibraltar Pound
- `XAU` - Gold
- `GRD` - Greek Drachma
- `GTQ` - Guatemalan Quetzal
- `GWP` - Guinea-Bissau Peso
- `GNF` - Guinean Franc
- `GNS` - Guinean Syli
- `GYD` - Guyanaese Dollar
- `HTG` - Haitian Gourde
- `HNL` - Honduran Lempira
- `HKD` - Hong Kong Dollar
- `HUF` - Hungarian Forint
- `IMP` - IMP
- `ISK` - Icelandic Króna
- `ISJ` - Icelandic Króna (1918–1981)
- `INR` - Indian Rupee
- `IDR` - Indonesian Rupiah
- `IRR` - Iranian Rial
- `IQD` - Iraqi Dinar
- `IEP` - Irish Pound
- `ILS` - Israeli New Shekel
- `ILP` - Israeli Pound
- `ILR` - Israeli Shekel (1980–1985)
- `ITL` - Italian Lira
- `JMD` - Jamaican Dollar
- `JPY` - Japanese Yen
- `JOD` - Jordanian Dinar
- `KZT` - Kazakhstani Tenge
- `KES` - Kenyan Shilling
- `KWD` - Kuwaiti Dinar
- `KGS` - Kyrgystani Som
- `LAK` - Laotian Kip
- `LVL` - Latvian Lats
- `LVR` - Latvian Ruble
- `LBP` - Lebanese Pound
- `LSL` - Lesotho Loti
- `LRD` - Liberian Dollar
- `LYD` - Libyan Dinar
- `LTL` - Lithuanian Litas
- `LTT` - Lithuanian Talonas
- `LUL` - Luxembourg Financial Franc
- `LUC` - Luxembourgian Convertible Franc
- `LUF` - Luxembourgian Franc
- `MOP` - Macanese Pataca
- `MKD` - Macedonian Denar
- `MKN` - Macedonian Denar (1992–1993)
- `MGA` - Malagasy Ariary
- `MGF` - Malagasy Franc
- `MWK` - Malawian Kwacha
- `MYR` - Malaysian Ringgit
- `MVR` - Maldivian Rufiyaa
- `MVP` - Maldivian Rupee (1947–1981)
- `MLF` - Malian Franc
- `MTL` - Maltese Lira
- `MTP` - Maltese Pound
- `MRU` - Mauritanian Ouguiya
- `MRO` - Mauritanian Ouguiya (1973–2017)
- `MUR` - Mauritian Rupee
- `MXV` - Mexican Investment Unit
- `MXN` - Mexican Peso
- `MXP` - Mexican Silver Peso (1861–1992)
- `MDC` - Moldovan Cupon
- `MDL` - Moldovan Leu
- `MCF` - Monegasque Franc
- `MNT` - Mongolian Tugrik
- `MAD` - Moroccan Dirham
- `MAF` - Moroccan Franc
- `MZE` - Mozambican Escudo
- `MZN` - Mozambican Metical
- `MZM` - Mozambican Metical (1980–2006)
- `MMK` - Myanmar Kyat
- `NAD` - Namibian Dollar
- `NPR` - Nepalese Rupee
- `ANG` - Netherlands Antillean Guilder
- `TWD` - New Taiwan Dollar
- `NZD` - New Zealand Dollar
- `NIO` - Nicaraguan Córdoba
- `NIC` - Nicaraguan Córdoba (1988–1991)
- `NGN` - Nigerian Naira
- `KPW` - North Korean Won
- `NOK` - Norwegian Krone
- `OMR` - Omani Rial
- `PKR` - Pakistani Rupee
- `XPD` - Palladium
- `PAB` - Panamanian Balboa
- `PGK` - Papua New Guinean Kina
- `PYG` - Paraguayan Guarani
- `PEI` - Peruvian Inti
- `PEN` - Peruvian Sol
- `PES` - Peruvian Sol (1863–1965)
- `PHP` - Philippine Peso
- `XPT` - Platinum
- `PLN` - Polish Zloty
- `PLZ` - Polish Zloty (1950–1995)
- `PTE` - Portuguese Escudo
- `GWE` - Portuguese Guinea Escudo
- `QAR` - Qatari Rial
- `XRE` - RINET Funds
- `RHD` - Rhodesian Dollar
- `RON` - Romanian Leu
- `ROL` - Romanian Leu (1952–2006)
- `RUB` - Russian Ruble
- `RUR` - Russian Ruble (1991–1998)
- `RWF` - Rwandan Franc
- `SVC` - Salvadoran Colón
- `WST` - Samoan Tala
- `SAR` - Saudi Riyal
- `RSD` - Serbian Dinar
- `CSD` - Serbian Dinar (2002–2006)
- `SCR` - Seychellois Rupee
- `SLL` - Sierra Leonean Leone
- `XAG` - Silver
- `SGD` - Singapore Dollar
- `SKK` - Slovak Koruna
- `SIT` - Slovenian Tolar
- `SBD` - Solomon Islands Dollar
- `SOS` - Somali Shilling
- `ZAR` - South African Rand
- `ZAL` - South African Rand (financial)
- `KRH` - South Korean Hwan (1953–1962)
- `KRW` - South Korean Won
- `KRO` - South Korean Won (1945–1953)
- `SSP` - South Sudanese Pound
- `SUR` - Soviet Rouble
- `ESP` - Spanish Peseta
- `ESA` - Spanish Peseta (A account)
- `ESB` - Spanish Peseta (convertible account)
- `XDR` - Special Drawing Rights
- `LKR` - Sri Lankan Rupee
- `SHP` - St. Helena Pound
- `XSU` - Sucre
- `SDD` - Sudanese Dinar (1992–2007)
- `SDG` - Sudanese Pound
- `SDP` - Sudanese Pound (1957–1998)
- `SRD` - Surinamese Dollar
- `SRG` - Surinamese Guilder
- `SZL` - Swazi Lilangeni
- `SEK` - Swedish Krona
- `CHF` - Swiss Franc
- `SYP` - Syrian Pound
- `STN` - São Tomé & Príncipe Dobra
- `STD` - São Tomé & Príncipe Dobra (1977–2017)
- `TVD` - TVD
- `TJR` - Tajikistani Ruble
- `TJS` - Tajikistani Somoni
- `TZS` - Tanzanian Shilling
- `XTS` - Testing Currency Code
- `THB` - Thai Baht
- `XXX` - The codes assigned for transactions where no currency is involved
- `TPE` - Timorese Escudo
- `TOP` - Tongan Paʻanga
- `TTD` - Trinidad & Tobago Dollar
- `TND` - Tunisian Dinar
- `TRY` - Turkish Lira
- `TRL` - Turkish Lira (1922–2005)
- `TMT` - Turkmenistani Manat
- `TMM` - Turkmenistani Manat (1993–2009)
- `USD` - US Dollar
- `USN` - US Dollar (Next day)
- `USS` - US Dollar (Same day)
- `UGX` - Ugandan Shilling
- `UGS` - Ugandan Shilling (1966–1987)
- `UAH` - Ukrainian Hryvnia
- `UAK` - Ukrainian Karbovanets
- `AED` - United Arab Emirates Dirham
- `UYW` - Uruguayan Nominal Wage Index Unit
- `UYU` - Uruguayan Peso
- `UYP` - Uruguayan Peso (1975–1993)
- `UYI` - Uruguayan Peso (Indexed Units)
- `UZS` - Uzbekistani Som
- `VUV` - Vanuatu Vatu
- `VES` - Venezuelan Bolívar
- `VEB` - Venezuelan Bolívar (1871–2008)
- `VEF` - Venezuelan Bolívar (2008–2018)
- `VND` - Vietnamese Dong
- `VNN` - Vietnamese Dong (1978–1985)
- `CHE` - WIR Euro
- `CHW` - WIR Franc
- `XOF` - West African CFA Franc
- `YDD` - Yemeni Dinar
- `YER` - Yemeni Rial
- `YUN` - Yugoslavian Convertible Dinar (1990–1992)
- `YUD` - Yugoslavian Hard Dinar (1966–1990)
- `YUM` - Yugoslavian New Dinar (1994–2002)
- `YUR` - Yugoslavian Reformed Dinar (1992–1993)
- `ZWN` - ZWN
- `ZRN` - Zairean New Zaire (1993–1998)
- `ZRZ` - Zairean Zaire (1971–1993)
- `ZMW` - Zambian Kwacha
- `ZMK` - Zambian Kwacha (1968–2012)
- `ZWD` - Zimbabwean Dollar (1980–2008)
- `ZWR` - Zimbabwean Dollar (2008)
- `ZWL` - Zimbabwean Dollar (2009)
      # @param exchange_rate [String] The purchase order's exchange rate.
      # @param line_items [Array<Accounting::PurchaseOrderLineItem>] 
      # @param tracking_categories [Array<Accounting::PurchaseOrderTrackingCategoriesItem>] 
      # @param remote_created_at [DateTime] When the third party's purchase order note was created.
      # @param remote_updated_at [DateTime] When the third party's purchase order note was updated.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param accounting_period [Accounting::PurchaseOrderAccountingPeriod] The accounting period that the PurchaseOrder was generated in.
      # @param id [String] 
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}] 
      # @param remote_data [Array<Accounting::RemoteData>] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Accounting::PurchaseOrder]
      def initialize(status: nil, issue_date: nil, purchase_order_number: nil, delivery_date: nil, delivery_address: nil, customer: nil, vendor: nil, memo: nil, company: nil, total_amount: nil, currency: nil, exchange_rate: nil, line_items: nil, tracking_categories: nil, remote_created_at: nil, remote_updated_at: nil, remote_was_deleted: nil, accounting_period: nil, id: nil, remote_id: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [Accounting::PurchaseOrderStatus] The purchase order's status. 
- `DRAFT` - DRAFT
- `SUBMITTED` - SUBMITTED
- `AUTHORIZED` - AUTHORIZED
- `BILLED` - BILLED
- `DELETED` - DELETED
        @status = status
        # @type [DateTime] The purchase order's issue date.
        @issue_date = issue_date
        # @type [String] The human-readable number of the purchase order.
        @purchase_order_number = purchase_order_number
        # @type [DateTime] The purchase order's delivery date.
        @delivery_date = delivery_date
        # @type [Accounting::PurchaseOrderDeliveryAddress] The purchase order's delivery address.
        @delivery_address = delivery_address
        # @type [String] The contact making the purchase order.
        @customer = customer
        # @type [Accounting::PurchaseOrderVendor] The party fulfilling the purchase order.
        @vendor = vendor
        # @type [String] A memo attached to the purchase order.
        @memo = memo
        # @type [Accounting::PurchaseOrderCompany] The company the purchase order belongs to.
        @company = company
        # @type [Float] The purchase order's total amount.
        @total_amount = total_amount
        # @type [Accounting::PurchaseOrderCurrency] The purchase order's currency. 
- `XUA` - ADB Unit of Account
- `AFN` - Afghan Afghani
- `AFA` - Afghan Afghani (1927–2002)
- `ALL` - Albanian Lek
- `ALK` - Albanian Lek (1946–1965)
- `DZD` - Algerian Dinar
- `ADP` - Andorran Peseta
- `AOA` - Angolan Kwanza
- `AOK` - Angolan Kwanza (1977–1991)
- `AON` - Angolan New Kwanza (1990–2000)
- `AOR` - Angolan Readjusted Kwanza (1995–1999)
- `ARA` - Argentine Austral
- `ARS` - Argentine Peso
- `ARM` - Argentine Peso (1881–1970)
- `ARP` - Argentine Peso (1983–1985)
- `ARL` - Argentine Peso Ley (1970–1983)
- `AMD` - Armenian Dram
- `AWG` - Aruban Florin
- `AUD` - Australian Dollar
- `ATS` - Austrian Schilling
- `AZN` - Azerbaijani Manat
- `AZM` - Azerbaijani Manat (1993–2006)
- `BSD` - Bahamian Dollar
- `BHD` - Bahraini Dinar
- `BDT` - Bangladeshi Taka
- `BBD` - Barbadian Dollar
- `BYN` - Belarusian Ruble
- `BYB` - Belarusian Ruble (1994–1999)
- `BYR` - Belarusian Ruble (2000–2016)
- `BEF` - Belgian Franc
- `BEC` - Belgian Franc (convertible)
- `BEL` - Belgian Franc (financial)
- `BZD` - Belize Dollar
- `BMD` - Bermudan Dollar
- `BTN` - Bhutanese Ngultrum
- `BOB` - Bolivian Boliviano
- `BOL` - Bolivian Boliviano (1863–1963)
- `BOV` - Bolivian Mvdol
- `BOP` - Bolivian Peso
- `BAM` - Bosnia-Herzegovina Convertible Mark
- `BAD` - Bosnia-Herzegovina Dinar (1992–1994)
- `BAN` - Bosnia-Herzegovina New Dinar (1994–1997)
- `BWP` - Botswanan Pula
- `BRC` - Brazilian Cruzado (1986–1989)
- `BRZ` - Brazilian Cruzeiro (1942–1967)
- `BRE` - Brazilian Cruzeiro (1990–1993)
- `BRR` - Brazilian Cruzeiro (1993–1994)
- `BRN` - Brazilian New Cruzado (1989–1990)
- `BRB` - Brazilian New Cruzeiro (1967–1986)
- `BRL` - Brazilian Real
- `GBP` - British Pound
- `BND` - Brunei Dollar
- `BGL` - Bulgarian Hard Lev
- `BGN` - Bulgarian Lev
- `BGO` - Bulgarian Lev (1879–1952)
- `BGM` - Bulgarian Socialist Lev
- `BUK` - Burmese Kyat
- `BIF` - Burundian Franc
- `XPF` - CFP Franc
- `KHR` - Cambodian Riel
- `CAD` - Canadian Dollar
- `CVE` - Cape Verdean Escudo
- `KYD` - Cayman Islands Dollar
- `XAF` - Central African CFA Franc
- `CLE` - Chilean Escudo
- `CLP` - Chilean Peso
- `CLF` - Chilean Unit of Account (UF)
- `CNX` - Chinese People’s Bank Dollar
- `CNY` - Chinese Yuan
- `CNH` - Chinese Yuan (offshore)
- `COP` - Colombian Peso
- `COU` - Colombian Real Value Unit
- `KMF` - Comorian Franc
- `CDF` - Congolese Franc
- `CRC` - Costa Rican Colón
- `HRD` - Croatian Dinar
- `HRK` - Croatian Kuna
- `CUC` - Cuban Convertible Peso
- `CUP` - Cuban Peso
- `CYP` - Cypriot Pound
- `CZK` - Czech Koruna
- `CSK` - Czechoslovak Hard Koruna
- `DKK` - Danish Krone
- `DJF` - Djiboutian Franc
- `DOP` - Dominican Peso
- `NLG` - Dutch Guilder
- `XCD` - East Caribbean Dollar
- `DDM` - East German Mark
- `ECS` - Ecuadorian Sucre
- `ECV` - Ecuadorian Unit of Constant Value
- `EGP` - Egyptian Pound
- `GQE` - Equatorial Guinean Ekwele
- `ERN` - Eritrean Nakfa
- `EEK` - Estonian Kroon
- `ETB` - Ethiopian Birr
- `EUR` - Euro
- `XBA` - European Composite Unit
- `XEU` - European Currency Unit
- `XBB` - European Monetary Unit
- `XBC` - European Unit of Account (XBC)
- `XBD` - European Unit of Account (XBD)
- `FKP` - Falkland Islands Pound
- `FJD` - Fijian Dollar
- `FIM` - Finnish Markka
- `FRF` - French Franc
- `XFO` - French Gold Franc
- `XFU` - French UIC-Franc
- `GMD` - Gambian Dalasi
- `GEK` - Georgian Kupon Larit
- `GEL` - Georgian Lari
- `DEM` - German Mark
- `GHS` - Ghanaian Cedi
- `GHC` - Ghanaian Cedi (1979–2007)
- `GIP` - Gibraltar Pound
- `XAU` - Gold
- `GRD` - Greek Drachma
- `GTQ` - Guatemalan Quetzal
- `GWP` - Guinea-Bissau Peso
- `GNF` - Guinean Franc
- `GNS` - Guinean Syli
- `GYD` - Guyanaese Dollar
- `HTG` - Haitian Gourde
- `HNL` - Honduran Lempira
- `HKD` - Hong Kong Dollar
- `HUF` - Hungarian Forint
- `IMP` - IMP
- `ISK` - Icelandic Króna
- `ISJ` - Icelandic Króna (1918–1981)
- `INR` - Indian Rupee
- `IDR` - Indonesian Rupiah
- `IRR` - Iranian Rial
- `IQD` - Iraqi Dinar
- `IEP` - Irish Pound
- `ILS` - Israeli New Shekel
- `ILP` - Israeli Pound
- `ILR` - Israeli Shekel (1980–1985)
- `ITL` - Italian Lira
- `JMD` - Jamaican Dollar
- `JPY` - Japanese Yen
- `JOD` - Jordanian Dinar
- `KZT` - Kazakhstani Tenge
- `KES` - Kenyan Shilling
- `KWD` - Kuwaiti Dinar
- `KGS` - Kyrgystani Som
- `LAK` - Laotian Kip
- `LVL` - Latvian Lats
- `LVR` - Latvian Ruble
- `LBP` - Lebanese Pound
- `LSL` - Lesotho Loti
- `LRD` - Liberian Dollar
- `LYD` - Libyan Dinar
- `LTL` - Lithuanian Litas
- `LTT` - Lithuanian Talonas
- `LUL` - Luxembourg Financial Franc
- `LUC` - Luxembourgian Convertible Franc
- `LUF` - Luxembourgian Franc
- `MOP` - Macanese Pataca
- `MKD` - Macedonian Denar
- `MKN` - Macedonian Denar (1992–1993)
- `MGA` - Malagasy Ariary
- `MGF` - Malagasy Franc
- `MWK` - Malawian Kwacha
- `MYR` - Malaysian Ringgit
- `MVR` - Maldivian Rufiyaa
- `MVP` - Maldivian Rupee (1947–1981)
- `MLF` - Malian Franc
- `MTL` - Maltese Lira
- `MTP` - Maltese Pound
- `MRU` - Mauritanian Ouguiya
- `MRO` - Mauritanian Ouguiya (1973–2017)
- `MUR` - Mauritian Rupee
- `MXV` - Mexican Investment Unit
- `MXN` - Mexican Peso
- `MXP` - Mexican Silver Peso (1861–1992)
- `MDC` - Moldovan Cupon
- `MDL` - Moldovan Leu
- `MCF` - Monegasque Franc
- `MNT` - Mongolian Tugrik
- `MAD` - Moroccan Dirham
- `MAF` - Moroccan Franc
- `MZE` - Mozambican Escudo
- `MZN` - Mozambican Metical
- `MZM` - Mozambican Metical (1980–2006)
- `MMK` - Myanmar Kyat
- `NAD` - Namibian Dollar
- `NPR` - Nepalese Rupee
- `ANG` - Netherlands Antillean Guilder
- `TWD` - New Taiwan Dollar
- `NZD` - New Zealand Dollar
- `NIO` - Nicaraguan Córdoba
- `NIC` - Nicaraguan Córdoba (1988–1991)
- `NGN` - Nigerian Naira
- `KPW` - North Korean Won
- `NOK` - Norwegian Krone
- `OMR` - Omani Rial
- `PKR` - Pakistani Rupee
- `XPD` - Palladium
- `PAB` - Panamanian Balboa
- `PGK` - Papua New Guinean Kina
- `PYG` - Paraguayan Guarani
- `PEI` - Peruvian Inti
- `PEN` - Peruvian Sol
- `PES` - Peruvian Sol (1863–1965)
- `PHP` - Philippine Peso
- `XPT` - Platinum
- `PLN` - Polish Zloty
- `PLZ` - Polish Zloty (1950–1995)
- `PTE` - Portuguese Escudo
- `GWE` - Portuguese Guinea Escudo
- `QAR` - Qatari Rial
- `XRE` - RINET Funds
- `RHD` - Rhodesian Dollar
- `RON` - Romanian Leu
- `ROL` - Romanian Leu (1952–2006)
- `RUB` - Russian Ruble
- `RUR` - Russian Ruble (1991–1998)
- `RWF` - Rwandan Franc
- `SVC` - Salvadoran Colón
- `WST` - Samoan Tala
- `SAR` - Saudi Riyal
- `RSD` - Serbian Dinar
- `CSD` - Serbian Dinar (2002–2006)
- `SCR` - Seychellois Rupee
- `SLL` - Sierra Leonean Leone
- `XAG` - Silver
- `SGD` - Singapore Dollar
- `SKK` - Slovak Koruna
- `SIT` - Slovenian Tolar
- `SBD` - Solomon Islands Dollar
- `SOS` - Somali Shilling
- `ZAR` - South African Rand
- `ZAL` - South African Rand (financial)
- `KRH` - South Korean Hwan (1953–1962)
- `KRW` - South Korean Won
- `KRO` - South Korean Won (1945–1953)
- `SSP` - South Sudanese Pound
- `SUR` - Soviet Rouble
- `ESP` - Spanish Peseta
- `ESA` - Spanish Peseta (A account)
- `ESB` - Spanish Peseta (convertible account)
- `XDR` - Special Drawing Rights
- `LKR` - Sri Lankan Rupee
- `SHP` - St. Helena Pound
- `XSU` - Sucre
- `SDD` - Sudanese Dinar (1992–2007)
- `SDG` - Sudanese Pound
- `SDP` - Sudanese Pound (1957–1998)
- `SRD` - Surinamese Dollar
- `SRG` - Surinamese Guilder
- `SZL` - Swazi Lilangeni
- `SEK` - Swedish Krona
- `CHF` - Swiss Franc
- `SYP` - Syrian Pound
- `STN` - São Tomé & Príncipe Dobra
- `STD` - São Tomé & Príncipe Dobra (1977–2017)
- `TVD` - TVD
- `TJR` - Tajikistani Ruble
- `TJS` - Tajikistani Somoni
- `TZS` - Tanzanian Shilling
- `XTS` - Testing Currency Code
- `THB` - Thai Baht
- `XXX` - The codes assigned for transactions where no currency is involved
- `TPE` - Timorese Escudo
- `TOP` - Tongan Paʻanga
- `TTD` - Trinidad & Tobago Dollar
- `TND` - Tunisian Dinar
- `TRY` - Turkish Lira
- `TRL` - Turkish Lira (1922–2005)
- `TMT` - Turkmenistani Manat
- `TMM` - Turkmenistani Manat (1993–2009)
- `USD` - US Dollar
- `USN` - US Dollar (Next day)
- `USS` - US Dollar (Same day)
- `UGX` - Ugandan Shilling
- `UGS` - Ugandan Shilling (1966–1987)
- `UAH` - Ukrainian Hryvnia
- `UAK` - Ukrainian Karbovanets
- `AED` - United Arab Emirates Dirham
- `UYW` - Uruguayan Nominal Wage Index Unit
- `UYU` - Uruguayan Peso
- `UYP` - Uruguayan Peso (1975–1993)
- `UYI` - Uruguayan Peso (Indexed Units)
- `UZS` - Uzbekistani Som
- `VUV` - Vanuatu Vatu
- `VES` - Venezuelan Bolívar
- `VEB` - Venezuelan Bolívar (1871–2008)
- `VEF` - Venezuelan Bolívar (2008–2018)
- `VND` - Vietnamese Dong
- `VNN` - Vietnamese Dong (1978–1985)
- `CHE` - WIR Euro
- `CHW` - WIR Franc
- `XOF` - West African CFA Franc
- `YDD` - Yemeni Dinar
- `YER` - Yemeni Rial
- `YUN` - Yugoslavian Convertible Dinar (1990–1992)
- `YUD` - Yugoslavian Hard Dinar (1966–1990)
- `YUM` - Yugoslavian New Dinar (1994–2002)
- `YUR` - Yugoslavian Reformed Dinar (1992–1993)
- `ZWN` - ZWN
- `ZRN` - Zairean New Zaire (1993–1998)
- `ZRZ` - Zairean Zaire (1971–1993)
- `ZMW` - Zambian Kwacha
- `ZMK` - Zambian Kwacha (1968–2012)
- `ZWD` - Zimbabwean Dollar (1980–2008)
- `ZWR` - Zimbabwean Dollar (2008)
- `ZWL` - Zimbabwean Dollar (2009)
        @currency = currency
        # @type [String] The purchase order's exchange rate.
        @exchange_rate = exchange_rate
        # @type [Array<Accounting::PurchaseOrderLineItem>] 
        @line_items = line_items
        # @type [Array<Accounting::PurchaseOrderTrackingCategoriesItem>] 
        @tracking_categories = tracking_categories
        # @type [DateTime] When the third party's purchase order note was created.
        @remote_created_at = remote_created_at
        # @type [DateTime] When the third party's purchase order note was updated.
        @remote_updated_at = remote_updated_at
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
        @remote_was_deleted = remote_was_deleted
        # @type [Accounting::PurchaseOrderAccountingPeriod] The accounting period that the PurchaseOrder was generated in.
        @accounting_period = accounting_period
        # @type [String] 
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [DateTime] 
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}] 
        @field_mappings = field_mappings
        # @type [Array<Accounting::RemoteData>] 
        @remote_data = remote_data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of PurchaseOrder
      #
      # @param json_object [JSON] 
      # @return [Accounting::PurchaseOrder]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        status = struct.status.to_h.to_json()
        status = Accounting::PurchaseOrderStatus.from_json(json_object: status)
        issue_date = DateTime.parse(struct.issue_date)
        purchase_order_number = struct.purchase_order_number
        delivery_date = DateTime.parse(struct.delivery_date)
        delivery_address = struct.delivery_address.to_h.to_json()
        delivery_address = Accounting::PurchaseOrderDeliveryAddress.from_json(json_object: delivery_address)
        customer = struct.customer
        vendor = struct.vendor.to_h.to_json()
        vendor = Accounting::PurchaseOrderVendor.from_json(json_object: vendor)
        memo = struct.memo
        company = struct.company.to_h.to_json()
        company = Accounting::PurchaseOrderCompany.from_json(json_object: company)
        total_amount = struct.total_amount
        currency = struct.currency.to_h.to_json()
        currency = Accounting::PurchaseOrderCurrency.from_json(json_object: currency)
        exchange_rate = struct.exchange_rate
        line_items = struct.line_items.map() do | v |
  v = v.to_h.to_json()
  Accounting::PurchaseOrderLineItem.from_json(json_object: v)
end
        tracking_categories = struct.tracking_categories.map() do | v |
  v = v.to_h.to_json()
  Accounting::PurchaseOrderTrackingCategoriesItem.from_json(json_object: v)
end
        remote_created_at = DateTime.parse(struct.remote_created_at)
        remote_updated_at = DateTime.parse(struct.remote_updated_at)
        remote_was_deleted = struct.remote_was_deleted
        accounting_period = struct.accounting_period.to_h.to_json()
        accounting_period = Accounting::PurchaseOrderAccountingPeriod.from_json(json_object: accounting_period)
        id = struct.id
        remote_id = struct.remote_id
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        field_mappings = struct.field_mappings
        remote_data = struct.remote_data.map() do | v |
  v = v.to_h.to_json()
  Accounting::RemoteData.from_json(json_object: v)
end
        new(status: status, issue_date: issue_date, purchase_order_number: purchase_order_number, delivery_date: delivery_date, delivery_address: delivery_address, customer: customer, vendor: vendor, memo: memo, company: company, total_amount: total_amount, currency: currency, exchange_rate: exchange_rate, line_items: line_items, tracking_categories: tracking_categories, remote_created_at: remote_created_at, remote_updated_at: remote_updated_at, remote_was_deleted: remote_was_deleted, accounting_period: accounting_period, id: id, remote_id: remote_id, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end
      # Serialize an instance of PurchaseOrder to a JSON object
      #
      # @return [JSON]
      def to_json
        { "status": @status, "issue_date": @issue_date, "purchase_order_number": @purchase_order_number, "delivery_date": @delivery_date, "delivery_address": @delivery_address, "customer": @customer, "vendor": @vendor, "memo": @memo, "company": @company, "total_amount": @total_amount, "currency": @currency, "exchange_rate": @exchange_rate, "line_items": @line_items, "tracking_categories": @tracking_categories, "remote_created_at": @remote_created_at, "remote_updated_at": @remote_updated_at, "remote_was_deleted": @remote_was_deleted, "accounting_period": @accounting_period, "id": @id, "remote_id": @remote_id, "created_at": @created_at, "modified_at": @modified_at, "field_mappings": @field_mappings, "remote_data": @remote_data }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.status.nil?() || Accounting::PurchaseOrderStatus.validate_raw(obj: obj.status)
        obj.issue_date&.is_a?(DateTime) != false || raise("Passed value for field obj.issue_date is not the expected type, validation failed.")
        obj.purchase_order_number&.is_a?(String) != false || raise("Passed value for field obj.purchase_order_number is not the expected type, validation failed.")
        obj.delivery_date&.is_a?(DateTime) != false || raise("Passed value for field obj.delivery_date is not the expected type, validation failed.")
        obj.delivery_address.nil?() || Accounting::PurchaseOrderDeliveryAddress.validate_raw(obj: obj.delivery_address)
        obj.customer&.is_a?(String) != false || raise("Passed value for field obj.customer is not the expected type, validation failed.")
        obj.vendor.nil?() || Accounting::PurchaseOrderVendor.validate_raw(obj: obj.vendor)
        obj.memo&.is_a?(String) != false || raise("Passed value for field obj.memo is not the expected type, validation failed.")
        obj.company.nil?() || Accounting::PurchaseOrderCompany.validate_raw(obj: obj.company)
        obj.total_amount&.is_a?(Float) != false || raise("Passed value for field obj.total_amount is not the expected type, validation failed.")
        obj.currency.nil?() || Accounting::PurchaseOrderCurrency.validate_raw(obj: obj.currency)
        obj.exchange_rate&.is_a?(String) != false || raise("Passed value for field obj.exchange_rate is not the expected type, validation failed.")
        obj.line_items&.is_a?(Array) != false || raise("Passed value for field obj.line_items is not the expected type, validation failed.")
        obj.tracking_categories&.is_a?(Array) != false || raise("Passed value for field obj.tracking_categories is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.accounting_period.nil?() || Accounting::PurchaseOrderAccountingPeriod.validate_raw(obj: obj.accounting_period)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end