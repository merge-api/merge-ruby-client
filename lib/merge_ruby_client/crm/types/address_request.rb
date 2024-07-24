# frozen_string_literal: true

require_relative "country_enum"
require_relative "address_type_enum"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The Address Object
    #  ### Description
    #  The `Address` object is used to represent an entity's address.
    #  ### Usage Example
    #  TODO
    class AddressRequest
      # @return [String] Line 1 of the address's street.
      attr_reader :street_1
      # @return [String] Line 2 of the address's street.
      attr_reader :street_2
      # @return [String] The address's city.
      attr_reader :city
      # @return [String] The address's state.
      attr_reader :state
      # @return [String] The address's postal code.
      attr_reader :postal_code
      # @return [Merge::Crm::CountryEnum] The address's country.
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
      # @return [Merge::Crm::AddressTypeEnum] The address type.
      #  - `BILLING` - BILLING
      #  - `SHIPPING` - SHIPPING
      attr_reader :address_type
      # @return [Hash{String => Object}]
      attr_reader :integration_params
      # @return [Hash{String => Object}]
      attr_reader :linked_account_params
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param street_1 [String] Line 1 of the address's street.
      # @param street_2 [String] Line 2 of the address's street.
      # @param city [String] The address's city.
      # @param state [String] The address's state.
      # @param postal_code [String] The address's postal code.
      # @param country [Merge::Crm::CountryEnum] The address's country.
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
      # @param address_type [Merge::Crm::AddressTypeEnum] The address type.
      #  - `BILLING` - BILLING
      #  - `SHIPPING` - SHIPPING
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::AddressRequest]
      def initialize(street_1: OMIT, street_2: OMIT, city: OMIT, state: OMIT, postal_code: OMIT, country: OMIT,
                     address_type: OMIT, integration_params: OMIT, linked_account_params: OMIT, additional_properties: nil)
        @street_1 = street_1 if street_1 != OMIT
        @street_2 = street_2 if street_2 != OMIT
        @city = city if city != OMIT
        @state = state if state != OMIT
        @postal_code = postal_code if postal_code != OMIT
        @country = country if country != OMIT
        @address_type = address_type if address_type != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "street_1": street_1,
          "street_2": street_2,
          "city": city,
          "state": state,
          "postal_code": postal_code,
          "country": country,
          "address_type": address_type,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AddressRequest
      #
      # @param json_object [String]
      # @return [Merge::Crm::AddressRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        street_1 = parsed_json["street_1"]
        street_2 = parsed_json["street_2"]
        city = parsed_json["city"]
        state = parsed_json["state"]
        postal_code = parsed_json["postal_code"]
        country = parsed_json["country"]
        address_type = parsed_json["address_type"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        new(
          street_1: street_1,
          street_2: street_2,
          city: city,
          state: state,
          postal_code: postal_code,
          country: country,
          address_type: address_type,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of AddressRequest to a JSON object
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
        obj.street_1&.is_a?(String) != false || raise("Passed value for field obj.street_1 is not the expected type, validation failed.")
        obj.street_2&.is_a?(String) != false || raise("Passed value for field obj.street_2 is not the expected type, validation failed.")
        obj.city&.is_a?(String) != false || raise("Passed value for field obj.city is not the expected type, validation failed.")
        obj.state&.is_a?(String) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
        obj.postal_code&.is_a?(String) != false || raise("Passed value for field obj.postal_code is not the expected type, validation failed.")
        obj.country&.is_a?(Merge::Crm::CountryEnum) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
        obj.address_type&.is_a?(Merge::Crm::AddressTypeEnum) != false || raise("Passed value for field obj.address_type is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
