# frozen_string_literal: true

require "date"
require_relative "invoice_type_enum"
require_relative "invoice_contact"
require_relative "invoice_company"
require_relative "invoice_employee"
require_relative "transaction_currency_enum"
require_relative "invoice_payment_term"
require_relative "invoice_status_enum"
require_relative "invoice_tracking_categories_item"
require_relative "invoice_accounting_period"
require_relative "invoice_purchase_orders_item"
require_relative "invoice_payments_item"
require_relative "invoice_applied_payments_item"
require_relative "invoice_line_item"
require_relative "invoice_applied_credit_notes_item"
require_relative "invoice_applied_vendor_credits_item"
require_relative "remote_data"
require_relative "remote_field"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The Invoice Object
    #  ### Description
    #  The `Invoice` object represents an itemized record of goods and/or services sold
    #  to a customer or bought from a vendor.
    #  Represents a Bill when the `Invoice` type is `ACCOUNTS_PAYABLE`. References an
    #  Invoice when the `Invoice` type is `ACCOUNTS_RECEIVABLE`.
    #  ### Usage Example
    #  Fetch from the `LIST Invoices` endpoint and view a company's invoices.
    class Invoice
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Accounting::InvoiceTypeEnum] Whether the invoice is an accounts receivable or accounts payable. If `type` is
      #  `ACCOUNTS_PAYABLE`, the invoice is a bill. If `type` is `ACCOUNTS_RECEIVABLE`,
      #  it is an invoice.
      #  * `ACCOUNTS_RECEIVABLE` - ACCOUNTS_RECEIVABLE
      #  * `ACCOUNTS_PAYABLE` - ACCOUNTS_PAYABLE
      attr_reader :type
      # @return [Merge::Accounting::InvoiceContact] The invoice's contact.
      attr_reader :contact
      # @return [String] The invoice's number.
      attr_reader :number
      # @return [DateTime] The invoice's issue date.
      attr_reader :issue_date
      # @return [DateTime] The invoice's due date.
      attr_reader :due_date
      # @return [DateTime] The invoice's paid date.
      attr_reader :paid_on_date
      # @return [String] The invoice's private note.
      attr_reader :memo
      # @return [Merge::Accounting::InvoiceCompany] The company the invoice belongs to.
      attr_reader :company
      # @return [Merge::Accounting::InvoiceEmployee] The employee this overall transaction relates to.
      attr_reader :employee
      # @return [Merge::Accounting::TransactionCurrencyEnum] The invoice's currency.
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
      # @return [String] The invoice's exchange rate.
      attr_reader :exchange_rate
      # @return [Merge::Accounting::InvoicePaymentTerm] The payment term that applies to this transaction.
      attr_reader :payment_term
      # @return [Float] The total discounts applied to the total cost.
      attr_reader :total_discount
      # @return [Float] The total amount being paid before taxes.
      attr_reader :sub_total
      # @return [Merge::Accounting::InvoiceStatusEnum] The status of the invoice.
      #  * `PAID` - PAID
      #  * `DRAFT` - DRAFT
      #  * `SUBMITTED` - SUBMITTED
      #  * `PARTIALLY_PAID` - PARTIALLY_PAID
      #  * `OPEN` - OPEN
      #  * `VOID` - VOID
      attr_reader :status
      # @return [Float] The total amount being paid in taxes.
      attr_reader :total_tax_amount
      # @return [Float] The invoice's total amount.
      attr_reader :total_amount
      # @return [Float] The invoice's remaining balance.
      attr_reader :balance
      # @return [DateTime] When the third party's invoice entry was updated.
      attr_reader :remote_updated_at
      # @return [Array<Merge::Accounting::InvoiceTrackingCategoriesItem>]
      attr_reader :tracking_categories
      # @return [Merge::Accounting::InvoiceAccountingPeriod] The accounting period that the Invoice was generated in.
      attr_reader :accounting_period
      # @return [Array<Merge::Accounting::InvoicePurchaseOrdersItem>]
      attr_reader :purchase_orders
      # @return [Array<Merge::Accounting::InvoicePaymentsItem>] Array of `Payment` object IDs.
      attr_reader :payments
      # @return [Array<Merge::Accounting::InvoiceAppliedPaymentsItem>] A list of the Payment Applied to Lines common models related to a given Invoice,
      #  Credit Note, or Journal Entry.
      attr_reader :applied_payments
      # @return [Array<Merge::Accounting::InvoiceLineItem>]
      attr_reader :line_items
      # @return [Array<Merge::Accounting::InvoiceAppliedCreditNotesItem>] `CreditNoteApplyLines` applied to the Invoice.
      attr_reader :applied_credit_notes
      # @return [Array<Merge::Accounting::InvoiceAppliedVendorCreditsItem>] `VendorCreditApplyLines` applied to the Invoice.
      attr_reader :applied_vendor_credits
      # @return [Boolean] If the transaction is inclusive or exclusive of tax. `True` if inclusive,
      #  `False` if exclusive.
      attr_reader :inclusive_of_tax
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Accounting::RemoteData>]
      attr_reader :remote_data
      # @return [Array<Merge::Accounting::RemoteField>]
      attr_reader :remote_fields
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
      # @param type [Merge::Accounting::InvoiceTypeEnum] Whether the invoice is an accounts receivable or accounts payable. If `type` is
      #  `ACCOUNTS_PAYABLE`, the invoice is a bill. If `type` is `ACCOUNTS_RECEIVABLE`,
      #  it is an invoice.
      #  * `ACCOUNTS_RECEIVABLE` - ACCOUNTS_RECEIVABLE
      #  * `ACCOUNTS_PAYABLE` - ACCOUNTS_PAYABLE
      # @param contact [Merge::Accounting::InvoiceContact] The invoice's contact.
      # @param number [String] The invoice's number.
      # @param issue_date [DateTime] The invoice's issue date.
      # @param due_date [DateTime] The invoice's due date.
      # @param paid_on_date [DateTime] The invoice's paid date.
      # @param memo [String] The invoice's private note.
      # @param company [Merge::Accounting::InvoiceCompany] The company the invoice belongs to.
      # @param employee [Merge::Accounting::InvoiceEmployee] The employee this overall transaction relates to.
      # @param currency [Merge::Accounting::TransactionCurrencyEnum] The invoice's currency.
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
      # @param exchange_rate [String] The invoice's exchange rate.
      # @param payment_term [Merge::Accounting::InvoicePaymentTerm] The payment term that applies to this transaction.
      # @param total_discount [Float] The total discounts applied to the total cost.
      # @param sub_total [Float] The total amount being paid before taxes.
      # @param status [Merge::Accounting::InvoiceStatusEnum] The status of the invoice.
      #  * `PAID` - PAID
      #  * `DRAFT` - DRAFT
      #  * `SUBMITTED` - SUBMITTED
      #  * `PARTIALLY_PAID` - PARTIALLY_PAID
      #  * `OPEN` - OPEN
      #  * `VOID` - VOID
      # @param total_tax_amount [Float] The total amount being paid in taxes.
      # @param total_amount [Float] The invoice's total amount.
      # @param balance [Float] The invoice's remaining balance.
      # @param remote_updated_at [DateTime] When the third party's invoice entry was updated.
      # @param tracking_categories [Array<Merge::Accounting::InvoiceTrackingCategoriesItem>]
      # @param accounting_period [Merge::Accounting::InvoiceAccountingPeriod] The accounting period that the Invoice was generated in.
      # @param purchase_orders [Array<Merge::Accounting::InvoicePurchaseOrdersItem>]
      # @param payments [Array<Merge::Accounting::InvoicePaymentsItem>] Array of `Payment` object IDs.
      # @param applied_payments [Array<Merge::Accounting::InvoiceAppliedPaymentsItem>] A list of the Payment Applied to Lines common models related to a given Invoice,
      #  Credit Note, or Journal Entry.
      # @param line_items [Array<Merge::Accounting::InvoiceLineItem>]
      # @param applied_credit_notes [Array<Merge::Accounting::InvoiceAppliedCreditNotesItem>] `CreditNoteApplyLines` applied to the Invoice.
      # @param applied_vendor_credits [Array<Merge::Accounting::InvoiceAppliedVendorCreditsItem>] `VendorCreditApplyLines` applied to the Invoice.
      # @param inclusive_of_tax [Boolean] If the transaction is inclusive or exclusive of tax. `True` if inclusive,
      #  `False` if exclusive.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Accounting::RemoteData>]
      # @param remote_fields [Array<Merge::Accounting::RemoteField>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::Invoice]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, type: OMIT, contact: OMIT,
                     number: OMIT, issue_date: OMIT, due_date: OMIT, paid_on_date: OMIT, memo: OMIT, company: OMIT, employee: OMIT, currency: OMIT, exchange_rate: OMIT, payment_term: OMIT, total_discount: OMIT, sub_total: OMIT, status: OMIT, total_tax_amount: OMIT, total_amount: OMIT, balance: OMIT, remote_updated_at: OMIT, tracking_categories: OMIT, accounting_period: OMIT, purchase_orders: OMIT, payments: OMIT, applied_payments: OMIT, line_items: OMIT, applied_credit_notes: OMIT, applied_vendor_credits: OMIT, inclusive_of_tax: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, remote_fields: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @type = type if type != OMIT
        @contact = contact if contact != OMIT
        @number = number if number != OMIT
        @issue_date = issue_date if issue_date != OMIT
        @due_date = due_date if due_date != OMIT
        @paid_on_date = paid_on_date if paid_on_date != OMIT
        @memo = memo if memo != OMIT
        @company = company if company != OMIT
        @employee = employee if employee != OMIT
        @currency = currency if currency != OMIT
        @exchange_rate = exchange_rate if exchange_rate != OMIT
        @payment_term = payment_term if payment_term != OMIT
        @total_discount = total_discount if total_discount != OMIT
        @sub_total = sub_total if sub_total != OMIT
        @status = status if status != OMIT
        @total_tax_amount = total_tax_amount if total_tax_amount != OMIT
        @total_amount = total_amount if total_amount != OMIT
        @balance = balance if balance != OMIT
        @remote_updated_at = remote_updated_at if remote_updated_at != OMIT
        @tracking_categories = tracking_categories if tracking_categories != OMIT
        @accounting_period = accounting_period if accounting_period != OMIT
        @purchase_orders = purchase_orders if purchase_orders != OMIT
        @payments = payments if payments != OMIT
        @applied_payments = applied_payments if applied_payments != OMIT
        @line_items = line_items if line_items != OMIT
        @applied_credit_notes = applied_credit_notes if applied_credit_notes != OMIT
        @applied_vendor_credits = applied_vendor_credits if applied_vendor_credits != OMIT
        @inclusive_of_tax = inclusive_of_tax if inclusive_of_tax != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @remote_fields = remote_fields if remote_fields != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "type": type,
          "contact": contact,
          "number": number,
          "issue_date": issue_date,
          "due_date": due_date,
          "paid_on_date": paid_on_date,
          "memo": memo,
          "company": company,
          "employee": employee,
          "currency": currency,
          "exchange_rate": exchange_rate,
          "payment_term": payment_term,
          "total_discount": total_discount,
          "sub_total": sub_total,
          "status": status,
          "total_tax_amount": total_tax_amount,
          "total_amount": total_amount,
          "balance": balance,
          "remote_updated_at": remote_updated_at,
          "tracking_categories": tracking_categories,
          "accounting_period": accounting_period,
          "purchase_orders": purchase_orders,
          "payments": payments,
          "applied_payments": applied_payments,
          "line_items": line_items,
          "applied_credit_notes": applied_credit_notes,
          "applied_vendor_credits": applied_vendor_credits,
          "inclusive_of_tax": inclusive_of_tax,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Invoice
      #
      # @param json_object [String]
      # @return [Merge::Accounting::Invoice]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        type = parsed_json["type"]
        if parsed_json["contact"].nil?
          contact = nil
        else
          contact = parsed_json["contact"].to_json
          contact = Merge::Accounting::InvoiceContact.from_json(json_object: contact)
        end
        number = parsed_json["number"]
        issue_date = (DateTime.parse(parsed_json["issue_date"]) unless parsed_json["issue_date"].nil?)
        due_date = (DateTime.parse(parsed_json["due_date"]) unless parsed_json["due_date"].nil?)
        paid_on_date = (DateTime.parse(parsed_json["paid_on_date"]) unless parsed_json["paid_on_date"].nil?)
        memo = parsed_json["memo"]
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Merge::Accounting::InvoiceCompany.from_json(json_object: company)
        end
        if parsed_json["employee"].nil?
          employee = nil
        else
          employee = parsed_json["employee"].to_json
          employee = Merge::Accounting::InvoiceEmployee.from_json(json_object: employee)
        end
        currency = parsed_json["currency"]
        exchange_rate = parsed_json["exchange_rate"]
        if parsed_json["payment_term"].nil?
          payment_term = nil
        else
          payment_term = parsed_json["payment_term"].to_json
          payment_term = Merge::Accounting::InvoicePaymentTerm.from_json(json_object: payment_term)
        end
        total_discount = parsed_json["total_discount"]
        sub_total = parsed_json["sub_total"]
        status = parsed_json["status"]
        total_tax_amount = parsed_json["total_tax_amount"]
        total_amount = parsed_json["total_amount"]
        balance = parsed_json["balance"]
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        tracking_categories = parsed_json["tracking_categories"]&.map do |item|
          item = item.to_json
          Merge::Accounting::InvoiceTrackingCategoriesItem.from_json(json_object: item)
        end
        if parsed_json["accounting_period"].nil?
          accounting_period = nil
        else
          accounting_period = parsed_json["accounting_period"].to_json
          accounting_period = Merge::Accounting::InvoiceAccountingPeriod.from_json(json_object: accounting_period)
        end
        purchase_orders = parsed_json["purchase_orders"]&.map do |item|
          item = item.to_json
          Merge::Accounting::InvoicePurchaseOrdersItem.from_json(json_object: item)
        end
        payments = parsed_json["payments"]&.map do |item|
          item = item.to_json
          Merge::Accounting::InvoicePaymentsItem.from_json(json_object: item)
        end
        applied_payments = parsed_json["applied_payments"]&.map do |item|
          item = item.to_json
          Merge::Accounting::InvoiceAppliedPaymentsItem.from_json(json_object: item)
        end
        line_items = parsed_json["line_items"]&.map do |item|
          item = item.to_json
          Merge::Accounting::InvoiceLineItem.from_json(json_object: item)
        end
        applied_credit_notes = parsed_json["applied_credit_notes"]&.map do |item|
          item = item.to_json
          Merge::Accounting::InvoiceAppliedCreditNotesItem.from_json(json_object: item)
        end
        applied_vendor_credits = parsed_json["applied_vendor_credits"]&.map do |item|
          item = item.to_json
          Merge::Accounting::InvoiceAppliedVendorCreditsItem.from_json(json_object: item)
        end
        inclusive_of_tax = parsed_json["inclusive_of_tax"]
        remote_was_deleted = parsed_json["remote_was_deleted"]
        field_mappings = parsed_json["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteData.from_json(json_object: item)
        end
        remote_fields = parsed_json["remote_fields"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteField.from_json(json_object: item)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          type: type,
          contact: contact,
          number: number,
          issue_date: issue_date,
          due_date: due_date,
          paid_on_date: paid_on_date,
          memo: memo,
          company: company,
          employee: employee,
          currency: currency,
          exchange_rate: exchange_rate,
          payment_term: payment_term,
          total_discount: total_discount,
          sub_total: sub_total,
          status: status,
          total_tax_amount: total_tax_amount,
          total_amount: total_amount,
          balance: balance,
          remote_updated_at: remote_updated_at,
          tracking_categories: tracking_categories,
          accounting_period: accounting_period,
          purchase_orders: purchase_orders,
          payments: payments,
          applied_payments: applied_payments,
          line_items: line_items,
          applied_credit_notes: applied_credit_notes,
          applied_vendor_credits: applied_vendor_credits,
          inclusive_of_tax: inclusive_of_tax,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of Invoice to a JSON object
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
        obj.type&.is_a?(Merge::Accounting::InvoiceTypeEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.contact.nil? || Merge::Accounting::InvoiceContact.validate_raw(obj: obj.contact)
        obj.number&.is_a?(String) != false || raise("Passed value for field obj.number is not the expected type, validation failed.")
        obj.issue_date&.is_a?(DateTime) != false || raise("Passed value for field obj.issue_date is not the expected type, validation failed.")
        obj.due_date&.is_a?(DateTime) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
        obj.paid_on_date&.is_a?(DateTime) != false || raise("Passed value for field obj.paid_on_date is not the expected type, validation failed.")
        obj.memo&.is_a?(String) != false || raise("Passed value for field obj.memo is not the expected type, validation failed.")
        obj.company.nil? || Merge::Accounting::InvoiceCompany.validate_raw(obj: obj.company)
        obj.employee.nil? || Merge::Accounting::InvoiceEmployee.validate_raw(obj: obj.employee)
        obj.currency&.is_a?(Merge::Accounting::TransactionCurrencyEnum) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
        obj.exchange_rate&.is_a?(String) != false || raise("Passed value for field obj.exchange_rate is not the expected type, validation failed.")
        obj.payment_term.nil? || Merge::Accounting::InvoicePaymentTerm.validate_raw(obj: obj.payment_term)
        obj.total_discount&.is_a?(Float) != false || raise("Passed value for field obj.total_discount is not the expected type, validation failed.")
        obj.sub_total&.is_a?(Float) != false || raise("Passed value for field obj.sub_total is not the expected type, validation failed.")
        obj.status&.is_a?(Merge::Accounting::InvoiceStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.total_tax_amount&.is_a?(Float) != false || raise("Passed value for field obj.total_tax_amount is not the expected type, validation failed.")
        obj.total_amount&.is_a?(Float) != false || raise("Passed value for field obj.total_amount is not the expected type, validation failed.")
        obj.balance&.is_a?(Float) != false || raise("Passed value for field obj.balance is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.tracking_categories&.is_a?(Array) != false || raise("Passed value for field obj.tracking_categories is not the expected type, validation failed.")
        obj.accounting_period.nil? || Merge::Accounting::InvoiceAccountingPeriod.validate_raw(obj: obj.accounting_period)
        obj.purchase_orders&.is_a?(Array) != false || raise("Passed value for field obj.purchase_orders is not the expected type, validation failed.")
        obj.payments&.is_a?(Array) != false || raise("Passed value for field obj.payments is not the expected type, validation failed.")
        obj.applied_payments&.is_a?(Array) != false || raise("Passed value for field obj.applied_payments is not the expected type, validation failed.")
        obj.line_items&.is_a?(Array) != false || raise("Passed value for field obj.line_items is not the expected type, validation failed.")
        obj.applied_credit_notes&.is_a?(Array) != false || raise("Passed value for field obj.applied_credit_notes is not the expected type, validation failed.")
        obj.applied_vendor_credits&.is_a?(Array) != false || raise("Passed value for field obj.applied_vendor_credits is not the expected type, validation failed.")
        obj.inclusive_of_tax&.is_a?(Boolean) != false || raise("Passed value for field obj.inclusive_of_tax is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
