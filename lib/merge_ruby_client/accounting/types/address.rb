# frozen_string_literal: true

require "date"
require_relative "address_type_enum"
require_relative "country_enum"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The Address Object
    #  ### Description
    #  The `Address` object is used to represent a contact's or company's address.
    #  ### Usage Example
    #  Fetch from the `GET CompanyInfo` endpoint and view the company's addresses.
    class Address
      # @return [DateTime]
      attr_reader :created_at
      # @return [DateTime] This is the datetime that this object was last updated by Merge
      attr_reader :modified_at
      # @return [Merge::Accounting::AddressTypeEnum] The address type.
      #  - `BILLING` - BILLING
      #  - `SHIPPING` - SHIPPING
      attr_reader :type
      # @return [String] Line 1 of the address's street.
      attr_reader :street_1
      # @return [String] Line 2 of the address's street.
      attr_reader :street_2
      # @return [String] The address's city.
      attr_reader :city
      # @return [Object]
      attr_reader :state
      # @return [String] The address's state or region.
      attr_reader :country_subdivision
      # @return [Merge::Accounting::CountryEnum] The address's country.
      #  - `AF` - Afghanistan
      #  - `AX` - Åland Islands
      #  - `AL` - Albania
      #  - `DZ` - Algeria
      #  - `AS` - American Samoa
      #  - `AD` - Andorra
      #  - `AO` - Angola
      #  - `AI` - Anguilla
      #  - `AQ` - Antarctica
      #  - `AG` - Antigua and Barbuda
      #  - `AR` - Argentina
      #  - `AM` - Armenia
      #  - `AW` - Aruba
      #  - `AU` - Australia
      #  - `AT` - Austria
      #  - `AZ` - Azerbaijan
      #  - `BS` - Bahamas
      #  - `BH` - Bahrain
      #  - `BD` - Bangladesh
      #  - `BB` - Barbados
      #  - `BY` - Belarus
      #  - `BE` - Belgium
      #  - `BZ` - Belize
      #  - `BJ` - Benin
      #  - `BM` - Bermuda
      #  - `BT` - Bhutan
      #  - `BO` - Bolivia
      #  - `BQ` - Bonaire, Sint Eustatius and Saba
      #  - `BA` - Bosnia and Herzegovina
      #  - `BW` - Botswana
      #  - `BV` - Bouvet Island
      #  - `BR` - Brazil
      #  - `IO` - British Indian Ocean Territory
      #  - `BN` - Brunei
      #  - `BG` - Bulgaria
      #  - `BF` - Burkina Faso
      #  - `BI` - Burundi
      #  - `CV` - Cabo Verde
      #  - `KH` - Cambodia
      #  - `CM` - Cameroon
      #  - `CA` - Canada
      #  - `KY` - Cayman Islands
      #  - `CF` - Central African Republic
      #  - `TD` - Chad
      #  - `CL` - Chile
      #  - `CN` - China
      #  - `CX` - Christmas Island
      #  - `CC` - Cocos (Keeling) Islands
      #  - `CO` - Colombia
      #  - `KM` - Comoros
      #  - `CG` - Congo
      #  - `CD` - Congo (the Democratic Republic of the)
      #  - `CK` - Cook Islands
      #  - `CR` - Costa Rica
      #  - `CI` - Côte d'Ivoire
      #  - `HR` - Croatia
      #  - `CU` - Cuba
      #  - `CW` - Curaçao
      #  - `CY` - Cyprus
      #  - `CZ` - Czechia
      #  - `DK` - Denmark
      #  - `DJ` - Djibouti
      #  - `DM` - Dominica
      #  - `DO` - Dominican Republic
      #  - `EC` - Ecuador
      #  - `EG` - Egypt
      #  - `SV` - El Salvador
      #  - `GQ` - Equatorial Guinea
      #  - `ER` - Eritrea
      #  - `EE` - Estonia
      #  - `SZ` - Eswatini
      #  - `ET` - Ethiopia
      #  - `FK` - Falkland Islands (Malvinas)
      #  - `FO` - Faroe Islands
      #  - `FJ` - Fiji
      #  - `FI` - Finland
      #  - `FR` - France
      #  - `GF` - French Guiana
      #  - `PF` - French Polynesia
      #  - `TF` - French Southern Territories
      #  - `GA` - Gabon
      #  - `GM` - Gambia
      #  - `GE` - Georgia
      #  - `DE` - Germany
      #  - `GH` - Ghana
      #  - `GI` - Gibraltar
      #  - `GR` - Greece
      #  - `GL` - Greenland
      #  - `GD` - Grenada
      #  - `GP` - Guadeloupe
      #  - `GU` - Guam
      #  - `GT` - Guatemala
      #  - `GG` - Guernsey
      #  - `GN` - Guinea
      #  - `GW` - Guinea-Bissau
      #  - `GY` - Guyana
      #  - `HT` - Haiti
      #  - `HM` - Heard Island and McDonald Islands
      #  - `VA` - Holy See
      #  - `HN` - Honduras
      #  - `HK` - Hong Kong
      #  - `HU` - Hungary
      #  - `IS` - Iceland
      #  - `IN` - India
      #  - `ID` - Indonesia
      #  - `IR` - Iran
      #  - `IQ` - Iraq
      #  - `IE` - Ireland
      #  - `IM` - Isle of Man
      #  - `IL` - Israel
      #  - `IT` - Italy
      #  - `JM` - Jamaica
      #  - `JP` - Japan
      #  - `JE` - Jersey
      #  - `JO` - Jordan
      #  - `KZ` - Kazakhstan
      #  - `KE` - Kenya
      #  - `KI` - Kiribati
      #  - `KW` - Kuwait
      #  - `KG` - Kyrgyzstan
      #  - `LA` - Laos
      #  - `LV` - Latvia
      #  - `LB` - Lebanon
      #  - `LS` - Lesotho
      #  - `LR` - Liberia
      #  - `LY` - Libya
      #  - `LI` - Liechtenstein
      #  - `LT` - Lithuania
      #  - `LU` - Luxembourg
      #  - `MO` - Macao
      #  - `MG` - Madagascar
      #  - `MW` - Malawi
      #  - `MY` - Malaysia
      #  - `MV` - Maldives
      #  - `ML` - Mali
      #  - `MT` - Malta
      #  - `MH` - Marshall Islands
      #  - `MQ` - Martinique
      #  - `MR` - Mauritania
      #  - `MU` - Mauritius
      #  - `YT` - Mayotte
      #  - `MX` - Mexico
      #  - `FM` - Micronesia (Federated States of)
      #  - `MD` - Moldova
      #  - `MC` - Monaco
      #  - `MN` - Mongolia
      #  - `ME` - Montenegro
      #  - `MS` - Montserrat
      #  - `MA` - Morocco
      #  - `MZ` - Mozambique
      #  - `MM` - Myanmar
      #  - `NA` - Namibia
      #  - `NR` - Nauru
      #  - `NP` - Nepal
      #  - `NL` - Netherlands
      #  - `NC` - New Caledonia
      #  - `NZ` - New Zealand
      #  - `NI` - Nicaragua
      #  - `NE` - Niger
      #  - `NG` - Nigeria
      #  - `NU` - Niue
      #  - `NF` - Norfolk Island
      #  - `KP` - North Korea
      #  - `MK` - North Macedonia
      #  - `MP` - Northern Mariana Islands
      #  - `NO` - Norway
      #  - `OM` - Oman
      #  - `PK` - Pakistan
      #  - `PW` - Palau
      #  - `PS` - Palestine, State of
      #  - `PA` - Panama
      #  - `PG` - Papua New Guinea
      #  - `PY` - Paraguay
      #  - `PE` - Peru
      #  - `PH` - Philippines
      #  - `PN` - Pitcairn
      #  - `PL` - Poland
      #  - `PT` - Portugal
      #  - `PR` - Puerto Rico
      #  - `QA` - Qatar
      #  - `RE` - Réunion
      #  - `RO` - Romania
      #  - `RU` - Russia
      #  - `RW` - Rwanda
      #  - `BL` - Saint Barthélemy
      #  - `SH` - Saint Helena, Ascension and Tristan da Cunha
      #  - `KN` - Saint Kitts and Nevis
      #  - `LC` - Saint Lucia
      #  - `MF` - Saint Martin (French part)
      #  - `PM` - Saint Pierre and Miquelon
      #  - `VC` - Saint Vincent and the Grenadines
      #  - `WS` - Samoa
      #  - `SM` - San Marino
      #  - `ST` - Sao Tome and Principe
      #  - `SA` - Saudi Arabia
      #  - `SN` - Senegal
      #  - `RS` - Serbia
      #  - `SC` - Seychelles
      #  - `SL` - Sierra Leone
      #  - `SG` - Singapore
      #  - `SX` - Sint Maarten (Dutch part)
      #  - `SK` - Slovakia
      #  - `SI` - Slovenia
      #  - `SB` - Solomon Islands
      #  - `SO` - Somalia
      #  - `ZA` - South Africa
      #  - `GS` - South Georgia and the South Sandwich Islands
      #  - `KR` - South Korea
      #  - `SS` - South Sudan
      #  - `ES` - Spain
      #  - `LK` - Sri Lanka
      #  - `SD` - Sudan
      #  - `SR` - Suriname
      #  - `SJ` - Svalbard and Jan Mayen
      #  - `SE` - Sweden
      #  - `CH` - Switzerland
      #  - `SY` - Syria
      #  - `TW` - Taiwan
      #  - `TJ` - Tajikistan
      #  - `TZ` - Tanzania
      #  - `TH` - Thailand
      #  - `TL` - Timor-Leste
      #  - `TG` - Togo
      #  - `TK` - Tokelau
      #  - `TO` - Tonga
      #  - `TT` - Trinidad and Tobago
      #  - `TN` - Tunisia
      #  - `TR` - Turkey
      #  - `TM` - Turkmenistan
      #  - `TC` - Turks and Caicos Islands
      #  - `TV` - Tuvalu
      #  - `UG` - Uganda
      #  - `UA` - Ukraine
      #  - `AE` - United Arab Emirates
      #  - `GB` - United Kingdom
      #  - `UM` - United States Minor Outlying Islands
      #  - `US` - United States of America
      #  - `UY` - Uruguay
      #  - `UZ` - Uzbekistan
      #  - `VU` - Vanuatu
      #  - `VE` - Venezuela
      #  - `VN` - Vietnam
      #  - `VG` - Virgin Islands (British)
      #  - `VI` - Virgin Islands (U.S.)
      #  - `WF` - Wallis and Futuna
      #  - `EH` - Western Sahara
      #  - `YE` - Yemen
      #  - `ZM` - Zambia
      #  - `ZW` - Zimbabwe
      attr_reader :country
      # @return [String] The address's zip code.
      attr_reader :zip_code
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param type [Merge::Accounting::AddressTypeEnum] The address type.
      #  - `BILLING` - BILLING
      #  - `SHIPPING` - SHIPPING
      # @param street_1 [String] Line 1 of the address's street.
      # @param street_2 [String] Line 2 of the address's street.
      # @param city [String] The address's city.
      # @param state [Object]
      # @param country_subdivision [String] The address's state or region.
      # @param country [Merge::Accounting::CountryEnum] The address's country.
      #  - `AF` - Afghanistan
      #  - `AX` - Åland Islands
      #  - `AL` - Albania
      #  - `DZ` - Algeria
      #  - `AS` - American Samoa
      #  - `AD` - Andorra
      #  - `AO` - Angola
      #  - `AI` - Anguilla
      #  - `AQ` - Antarctica
      #  - `AG` - Antigua and Barbuda
      #  - `AR` - Argentina
      #  - `AM` - Armenia
      #  - `AW` - Aruba
      #  - `AU` - Australia
      #  - `AT` - Austria
      #  - `AZ` - Azerbaijan
      #  - `BS` - Bahamas
      #  - `BH` - Bahrain
      #  - `BD` - Bangladesh
      #  - `BB` - Barbados
      #  - `BY` - Belarus
      #  - `BE` - Belgium
      #  - `BZ` - Belize
      #  - `BJ` - Benin
      #  - `BM` - Bermuda
      #  - `BT` - Bhutan
      #  - `BO` - Bolivia
      #  - `BQ` - Bonaire, Sint Eustatius and Saba
      #  - `BA` - Bosnia and Herzegovina
      #  - `BW` - Botswana
      #  - `BV` - Bouvet Island
      #  - `BR` - Brazil
      #  - `IO` - British Indian Ocean Territory
      #  - `BN` - Brunei
      #  - `BG` - Bulgaria
      #  - `BF` - Burkina Faso
      #  - `BI` - Burundi
      #  - `CV` - Cabo Verde
      #  - `KH` - Cambodia
      #  - `CM` - Cameroon
      #  - `CA` - Canada
      #  - `KY` - Cayman Islands
      #  - `CF` - Central African Republic
      #  - `TD` - Chad
      #  - `CL` - Chile
      #  - `CN` - China
      #  - `CX` - Christmas Island
      #  - `CC` - Cocos (Keeling) Islands
      #  - `CO` - Colombia
      #  - `KM` - Comoros
      #  - `CG` - Congo
      #  - `CD` - Congo (the Democratic Republic of the)
      #  - `CK` - Cook Islands
      #  - `CR` - Costa Rica
      #  - `CI` - Côte d'Ivoire
      #  - `HR` - Croatia
      #  - `CU` - Cuba
      #  - `CW` - Curaçao
      #  - `CY` - Cyprus
      #  - `CZ` - Czechia
      #  - `DK` - Denmark
      #  - `DJ` - Djibouti
      #  - `DM` - Dominica
      #  - `DO` - Dominican Republic
      #  - `EC` - Ecuador
      #  - `EG` - Egypt
      #  - `SV` - El Salvador
      #  - `GQ` - Equatorial Guinea
      #  - `ER` - Eritrea
      #  - `EE` - Estonia
      #  - `SZ` - Eswatini
      #  - `ET` - Ethiopia
      #  - `FK` - Falkland Islands (Malvinas)
      #  - `FO` - Faroe Islands
      #  - `FJ` - Fiji
      #  - `FI` - Finland
      #  - `FR` - France
      #  - `GF` - French Guiana
      #  - `PF` - French Polynesia
      #  - `TF` - French Southern Territories
      #  - `GA` - Gabon
      #  - `GM` - Gambia
      #  - `GE` - Georgia
      #  - `DE` - Germany
      #  - `GH` - Ghana
      #  - `GI` - Gibraltar
      #  - `GR` - Greece
      #  - `GL` - Greenland
      #  - `GD` - Grenada
      #  - `GP` - Guadeloupe
      #  - `GU` - Guam
      #  - `GT` - Guatemala
      #  - `GG` - Guernsey
      #  - `GN` - Guinea
      #  - `GW` - Guinea-Bissau
      #  - `GY` - Guyana
      #  - `HT` - Haiti
      #  - `HM` - Heard Island and McDonald Islands
      #  - `VA` - Holy See
      #  - `HN` - Honduras
      #  - `HK` - Hong Kong
      #  - `HU` - Hungary
      #  - `IS` - Iceland
      #  - `IN` - India
      #  - `ID` - Indonesia
      #  - `IR` - Iran
      #  - `IQ` - Iraq
      #  - `IE` - Ireland
      #  - `IM` - Isle of Man
      #  - `IL` - Israel
      #  - `IT` - Italy
      #  - `JM` - Jamaica
      #  - `JP` - Japan
      #  - `JE` - Jersey
      #  - `JO` - Jordan
      #  - `KZ` - Kazakhstan
      #  - `KE` - Kenya
      #  - `KI` - Kiribati
      #  - `KW` - Kuwait
      #  - `KG` - Kyrgyzstan
      #  - `LA` - Laos
      #  - `LV` - Latvia
      #  - `LB` - Lebanon
      #  - `LS` - Lesotho
      #  - `LR` - Liberia
      #  - `LY` - Libya
      #  - `LI` - Liechtenstein
      #  - `LT` - Lithuania
      #  - `LU` - Luxembourg
      #  - `MO` - Macao
      #  - `MG` - Madagascar
      #  - `MW` - Malawi
      #  - `MY` - Malaysia
      #  - `MV` - Maldives
      #  - `ML` - Mali
      #  - `MT` - Malta
      #  - `MH` - Marshall Islands
      #  - `MQ` - Martinique
      #  - `MR` - Mauritania
      #  - `MU` - Mauritius
      #  - `YT` - Mayotte
      #  - `MX` - Mexico
      #  - `FM` - Micronesia (Federated States of)
      #  - `MD` - Moldova
      #  - `MC` - Monaco
      #  - `MN` - Mongolia
      #  - `ME` - Montenegro
      #  - `MS` - Montserrat
      #  - `MA` - Morocco
      #  - `MZ` - Mozambique
      #  - `MM` - Myanmar
      #  - `NA` - Namibia
      #  - `NR` - Nauru
      #  - `NP` - Nepal
      #  - `NL` - Netherlands
      #  - `NC` - New Caledonia
      #  - `NZ` - New Zealand
      #  - `NI` - Nicaragua
      #  - `NE` - Niger
      #  - `NG` - Nigeria
      #  - `NU` - Niue
      #  - `NF` - Norfolk Island
      #  - `KP` - North Korea
      #  - `MK` - North Macedonia
      #  - `MP` - Northern Mariana Islands
      #  - `NO` - Norway
      #  - `OM` - Oman
      #  - `PK` - Pakistan
      #  - `PW` - Palau
      #  - `PS` - Palestine, State of
      #  - `PA` - Panama
      #  - `PG` - Papua New Guinea
      #  - `PY` - Paraguay
      #  - `PE` - Peru
      #  - `PH` - Philippines
      #  - `PN` - Pitcairn
      #  - `PL` - Poland
      #  - `PT` - Portugal
      #  - `PR` - Puerto Rico
      #  - `QA` - Qatar
      #  - `RE` - Réunion
      #  - `RO` - Romania
      #  - `RU` - Russia
      #  - `RW` - Rwanda
      #  - `BL` - Saint Barthélemy
      #  - `SH` - Saint Helena, Ascension and Tristan da Cunha
      #  - `KN` - Saint Kitts and Nevis
      #  - `LC` - Saint Lucia
      #  - `MF` - Saint Martin (French part)
      #  - `PM` - Saint Pierre and Miquelon
      #  - `VC` - Saint Vincent and the Grenadines
      #  - `WS` - Samoa
      #  - `SM` - San Marino
      #  - `ST` - Sao Tome and Principe
      #  - `SA` - Saudi Arabia
      #  - `SN` - Senegal
      #  - `RS` - Serbia
      #  - `SC` - Seychelles
      #  - `SL` - Sierra Leone
      #  - `SG` - Singapore
      #  - `SX` - Sint Maarten (Dutch part)
      #  - `SK` - Slovakia
      #  - `SI` - Slovenia
      #  - `SB` - Solomon Islands
      #  - `SO` - Somalia
      #  - `ZA` - South Africa
      #  - `GS` - South Georgia and the South Sandwich Islands
      #  - `KR` - South Korea
      #  - `SS` - South Sudan
      #  - `ES` - Spain
      #  - `LK` - Sri Lanka
      #  - `SD` - Sudan
      #  - `SR` - Suriname
      #  - `SJ` - Svalbard and Jan Mayen
      #  - `SE` - Sweden
      #  - `CH` - Switzerland
      #  - `SY` - Syria
      #  - `TW` - Taiwan
      #  - `TJ` - Tajikistan
      #  - `TZ` - Tanzania
      #  - `TH` - Thailand
      #  - `TL` - Timor-Leste
      #  - `TG` - Togo
      #  - `TK` - Tokelau
      #  - `TO` - Tonga
      #  - `TT` - Trinidad and Tobago
      #  - `TN` - Tunisia
      #  - `TR` - Turkey
      #  - `TM` - Turkmenistan
      #  - `TC` - Turks and Caicos Islands
      #  - `TV` - Tuvalu
      #  - `UG` - Uganda
      #  - `UA` - Ukraine
      #  - `AE` - United Arab Emirates
      #  - `GB` - United Kingdom
      #  - `UM` - United States Minor Outlying Islands
      #  - `US` - United States of America
      #  - `UY` - Uruguay
      #  - `UZ` - Uzbekistan
      #  - `VU` - Vanuatu
      #  - `VE` - Venezuela
      #  - `VN` - Vietnam
      #  - `VG` - Virgin Islands (British)
      #  - `VI` - Virgin Islands (U.S.)
      #  - `WF` - Wallis and Futuna
      #  - `EH` - Western Sahara
      #  - `YE` - Yemen
      #  - `ZM` - Zambia
      #  - `ZW` - Zimbabwe
      # @param zip_code [String] The address's zip code.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::Address]
      def initialize(created_at: OMIT, modified_at: OMIT, type: OMIT, street_1: OMIT, street_2: OMIT, city: OMIT,
                     state: OMIT, country_subdivision: OMIT, country: OMIT, zip_code: OMIT, additional_properties: nil)
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @type = type if type != OMIT
        @street_1 = street_1 if street_1 != OMIT
        @street_2 = street_2 if street_2 != OMIT
        @city = city if city != OMIT
        @state = state if state != OMIT
        @country_subdivision = country_subdivision if country_subdivision != OMIT
        @country = country if country != OMIT
        @zip_code = zip_code if zip_code != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "created_at": created_at,
          "modified_at": modified_at,
          "type": type,
          "street_1": street_1,
          "street_2": street_2,
          "city": city,
          "state": state,
          "country_subdivision": country_subdivision,
          "country": country,
          "zip_code": zip_code
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Address
      #
      # @param json_object [String]
      # @return [Merge::Accounting::Address]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        type = struct["type"]
        street_1 = struct["street_1"]
        street_2 = struct["street_2"]
        city = struct["city"]
        state = struct["state"]
        country_subdivision = struct["country_subdivision"]
        country = struct["country"]
        zip_code = struct["zip_code"]
        new(
          created_at: created_at,
          modified_at: modified_at,
          type: type,
          street_1: street_1,
          street_2: street_2,
          city: city,
          state: state,
          country_subdivision: country_subdivision,
          country: country,
          zip_code: zip_code,
          additional_properties: struct
        )
      end

      # Serialize an instance of Address to a JSON object
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
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.type&.is_a?(Merge::Accounting::AddressTypeEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.street_1&.is_a?(String) != false || raise("Passed value for field obj.street_1 is not the expected type, validation failed.")
        obj.street_2&.is_a?(String) != false || raise("Passed value for field obj.street_2 is not the expected type, validation failed.")
        obj.city&.is_a?(String) != false || raise("Passed value for field obj.city is not the expected type, validation failed.")
        obj.state&.is_a?(Object) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
        obj.country_subdivision&.is_a?(String) != false || raise("Passed value for field obj.country_subdivision is not the expected type, validation failed.")
        obj.country&.is_a?(Merge::Accounting::CountryEnum) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
        obj.zip_code&.is_a?(String) != false || raise("Passed value for field obj.zip_code is not the expected type, validation failed.")
      end
    end
  end
end
