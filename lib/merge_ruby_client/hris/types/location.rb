# frozen_string_literal: true

require_relative "country_enum"
require_relative "location_type_enum"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Hris
    # # The Location Object
    #
    # ### Description
    #
    # The `Location` object is used to represent an address that can be associated with an employee.
    #
    # ### Usage Example
    #
    # Fetch from the `LIST Locations` endpoint and filter by `ID` to show all office locations.
    class Location
      attr_reader :id, :remote_id, :name, :phone_number, :street_1, :street_2, :city, :state, :zip_code, :country,
                  :location_type, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param name [String] The location's name.
      # @param phone_number [String] The location's phone number.
      # @param street_1 [String] Line 1 of the location's street address.
      # @param street_2 [String] Line 2 of the location's street address.
      # @param city [String] The location's city.
      # @param state [String] The location's state. Represents a region if outside of the US.
      # @param zip_code [String] The location's zip code or postal code.
      # @param country [COUNTRY_ENUM] The location's country.
      #   - `AF` - Afghanistan
      #   - `AX` - Åland Islands
      #   - `AL` - Albania
      #   - `DZ` - Algeria
      #   - `AS` - American Samoa
      #   - `AD` - Andorra
      #   - `AO` - Angola
      #   - `AI` - Anguilla
      #   - `AQ` - Antarctica
      #   - `AG` - Antigua and Barbuda
      #   - `AR` - Argentina
      #   - `AM` - Armenia
      #   - `AW` - Aruba
      #   - `AU` - Australia
      #   - `AT` - Austria
      #   - `AZ` - Azerbaijan
      #   - `BS` - Bahamas
      #   - `BH` - Bahrain
      #   - `BD` - Bangladesh
      #   - `BB` - Barbados
      #   - `BY` - Belarus
      #   - `BE` - Belgium
      #   - `BZ` - Belize
      #   - `BJ` - Benin
      #   - `BM` - Bermuda
      #   - `BT` - Bhutan
      #   - `BO` - Bolivia
      #   - `BQ` - Bonaire, Sint Eustatius and Saba
      #   - `BA` - Bosnia and Herzegovina
      #   - `BW` - Botswana
      #   - `BV` - Bouvet Island
      #   - `BR` - Brazil
      #   - `IO` - British Indian Ocean Territory
      #   - `BN` - Brunei
      #   - `BG` - Bulgaria
      #   - `BF` - Burkina Faso
      #   - `BI` - Burundi
      #   - `CV` - Cabo Verde
      #   - `KH` - Cambodia
      #   - `CM` - Cameroon
      #   - `CA` - Canada
      #   - `KY` - Cayman Islands
      #   - `CF` - Central African Republic
      #   - `TD` - Chad
      #   - `CL` - Chile
      #   - `CN` - China
      #   - `CX` - Christmas Island
      #   - `CC` - Cocos (Keeling) Islands
      #   - `CO` - Colombia
      #   - `KM` - Comoros
      #   - `CG` - Congo
      #   - `CD` - Congo (the Democratic Republic of the)
      #   - `CK` - Cook Islands
      #   - `CR` - Costa Rica
      #   - `CI` - Côte d'Ivoire
      #   - `HR` - Croatia
      #   - `CU` - Cuba
      #   - `CW` - Curaçao
      #   - `CY` - Cyprus
      #   - `CZ` - Czechia
      #   - `DK` - Denmark
      #   - `DJ` - Djibouti
      #   - `DM` - Dominica
      #   - `DO` - Dominican Republic
      #   - `EC` - Ecuador
      #   - `EG` - Egypt
      #   - `SV` - El Salvador
      #   - `GQ` - Equatorial Guinea
      #   - `ER` - Eritrea
      #   - `EE` - Estonia
      #   - `SZ` - Eswatini
      #   - `ET` - Ethiopia
      #   - `FK` - Falkland Islands (Malvinas)
      #   - `FO` - Faroe Islands
      #   - `FJ` - Fiji
      #   - `FI` - Finland
      #   - `FR` - France
      #   - `GF` - French Guiana
      #   - `PF` - French Polynesia
      #   - `TF` - French Southern Territories
      #   - `GA` - Gabon
      #   - `GM` - Gambia
      #   - `GE` - Georgia
      #   - `DE` - Germany
      #   - `GH` - Ghana
      #   - `GI` - Gibraltar
      #   - `GR` - Greece
      #   - `GL` - Greenland
      #   - `GD` - Grenada
      #   - `GP` - Guadeloupe
      #   - `GU` - Guam
      #   - `GT` - Guatemala
      #   - `GG` - Guernsey
      #   - `GN` - Guinea
      #   - `GW` - Guinea-Bissau
      #   - `GY` - Guyana
      #   - `HT` - Haiti
      #   - `HM` - Heard Island and McDonald Islands
      #   - `VA` - Holy See
      #   - `HN` - Honduras
      #   - `HK` - Hong Kong
      #   - `HU` - Hungary
      #   - `IS` - Iceland
      #   - `IN` - India
      #   - `ID` - Indonesia
      #   - `IR` - Iran
      #   - `IQ` - Iraq
      #   - `IE` - Ireland
      #   - `IM` - Isle of Man
      #   - `IL` - Israel
      #   - `IT` - Italy
      #   - `JM` - Jamaica
      #   - `JP` - Japan
      #   - `JE` - Jersey
      #   - `JO` - Jordan
      #   - `KZ` - Kazakhstan
      #   - `KE` - Kenya
      #   - `KI` - Kiribati
      #   - `KW` - Kuwait
      #   - `KG` - Kyrgyzstan
      #   - `LA` - Laos
      #   - `LV` - Latvia
      #   - `LB` - Lebanon
      #   - `LS` - Lesotho
      #   - `LR` - Liberia
      #   - `LY` - Libya
      #   - `LI` - Liechtenstein
      #   - `LT` - Lithuania
      #   - `LU` - Luxembourg
      #   - `MO` - Macao
      #   - `MG` - Madagascar
      #   - `MW` - Malawi
      #   - `MY` - Malaysia
      #   - `MV` - Maldives
      #   - `ML` - Mali
      #   - `MT` - Malta
      #   - `MH` - Marshall Islands
      #   - `MQ` - Martinique
      #   - `MR` - Mauritania
      #   - `MU` - Mauritius
      #   - `YT` - Mayotte
      #   - `MX` - Mexico
      #   - `FM` - Micronesia (Federated States of)
      #   - `MD` - Moldova
      #   - `MC` - Monaco
      #   - `MN` - Mongolia
      #   - `ME` - Montenegro
      #   - `MS` - Montserrat
      #   - `MA` - Morocco
      #   - `MZ` - Mozambique
      #   - `MM` - Myanmar
      #   - `NA` - Namibia
      #   - `NR` - Nauru
      #   - `NP` - Nepal
      #   - `NL` - Netherlands
      #   - `NC` - New Caledonia
      #   - `NZ` - New Zealand
      #   - `NI` - Nicaragua
      #   - `NE` - Niger
      #   - `NG` - Nigeria
      #   - `NU` - Niue
      #   - `NF` - Norfolk Island
      #   - `KP` - North Korea
      #   - `MK` - North Macedonia
      #   - `MP` - Northern Mariana Islands
      #   - `NO` - Norway
      #   - `OM` - Oman
      #   - `PK` - Pakistan
      #   - `PW` - Palau
      #   - `PS` - Palestine, State of
      #   - `PA` - Panama
      #   - `PG` - Papua New Guinea
      #   - `PY` - Paraguay
      #   - `PE` - Peru
      #   - `PH` - Philippines
      #   - `PN` - Pitcairn
      #   - `PL` - Poland
      #   - `PT` - Portugal
      #   - `PR` - Puerto Rico
      #   - `QA` - Qatar
      #   - `RE` - Réunion
      #   - `RO` - Romania
      #   - `RU` - Russia
      #   - `RW` - Rwanda
      #   - `BL` - Saint Barthélemy
      #   - `SH` - Saint Helena, Ascension and Tristan da Cunha
      #   - `KN` - Saint Kitts and Nevis
      #   - `LC` - Saint Lucia
      #   - `MF` - Saint Martin (French part)
      #   - `PM` - Saint Pierre and Miquelon
      #   - `VC` - Saint Vincent and the Grenadines
      #   - `WS` - Samoa
      #   - `SM` - San Marino
      #   - `ST` - Sao Tome and Principe
      #   - `SA` - Saudi Arabia
      #   - `SN` - Senegal
      #   - `RS` - Serbia
      #   - `SC` - Seychelles
      #   - `SL` - Sierra Leone
      #   - `SG` - Singapore
      #   - `SX` - Sint Maarten (Dutch part)
      #   - `SK` - Slovakia
      #   - `SI` - Slovenia
      #   - `SB` - Solomon Islands
      #   - `SO` - Somalia
      #   - `ZA` - South Africa
      #   - `GS` - South Georgia and the South Sandwich Islands
      #   - `KR` - South Korea
      #   - `SS` - South Sudan
      #   - `ES` - Spain
      #   - `LK` - Sri Lanka
      #   - `SD` - Sudan
      #   - `SR` - Suriname
      #   - `SJ` - Svalbard and Jan Mayen
      #   - `SE` - Sweden
      #   - `CH` - Switzerland
      #   - `SY` - Syria
      #   - `TW` - Taiwan
      #   - `TJ` - Tajikistan
      #   - `TZ` - Tanzania
      #   - `TH` - Thailand
      #   - `TL` - Timor-Leste
      #   - `TG` - Togo
      #   - `TK` - Tokelau
      #   - `TO` - Tonga
      #   - `TT` - Trinidad and Tobago
      #   - `TN` - Tunisia
      #   - `TR` - Turkey
      #   - `TM` - Turkmenistan
      #   - `TC` - Turks and Caicos Islands
      #   - `TV` - Tuvalu
      #   - `UG` - Uganda
      #   - `UA` - Ukraine
      #   - `AE` - United Arab Emirates
      #   - `GB` - United Kingdom
      #   - `UM` - United States Minor Outlying Islands
      #   - `US` - United States of America
      #   - `UY` - Uruguay
      #   - `UZ` - Uzbekistan
      #   - `VU` - Vanuatu
      #   - `VE` - Venezuela
      #   - `VN` - Vietnam
      #   - `VG` - Virgin Islands (British)
      #   - `VI` - Virgin Islands (U.S.)
      #   - `WF` - Wallis and Futuna
      #   - `EH` - Western Sahara
      #   - `YE` - Yemen
      #   - `ZM` - Zambia
      #   - `ZW` - Zimbabwe
      # @param location_type [LOCATION_TYPE_ENUM] The location's type. Can be either WORK or HOME
      #   - `HOME` - HOME
      #   - `WORK` - WORK
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Hris::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::Location]
      def initialize(id: nil, remote_id: nil, name: nil, phone_number: nil, street_1: nil, street_2: nil, city: nil,
                     state: nil, zip_code: nil, country: nil, location_type: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The location's name.
        @name = name
        # @type [String] The location's phone number.
        @phone_number = phone_number
        # @type [String] Line 1 of the location's street address.
        @street_1 = street_1
        # @type [String] Line 2 of the location's street address.
        @street_2 = street_2
        # @type [String] The location's city.
        @city = city
        # @type [String] The location's state. Represents a region if outside of the US.
        @state = state
        # @type [String] The location's zip code or postal code.
        @zip_code = zip_code
        # @type [COUNTRY_ENUM] The location's country.
        #   - `AF` - Afghanistan
        #   - `AX` - Åland Islands
        #   - `AL` - Albania
        #   - `DZ` - Algeria
        #   - `AS` - American Samoa
        #   - `AD` - Andorra
        #   - `AO` - Angola
        #   - `AI` - Anguilla
        #   - `AQ` - Antarctica
        #   - `AG` - Antigua and Barbuda
        #   - `AR` - Argentina
        #   - `AM` - Armenia
        #   - `AW` - Aruba
        #   - `AU` - Australia
        #   - `AT` - Austria
        #   - `AZ` - Azerbaijan
        #   - `BS` - Bahamas
        #   - `BH` - Bahrain
        #   - `BD` - Bangladesh
        #   - `BB` - Barbados
        #   - `BY` - Belarus
        #   - `BE` - Belgium
        #   - `BZ` - Belize
        #   - `BJ` - Benin
        #   - `BM` - Bermuda
        #   - `BT` - Bhutan
        #   - `BO` - Bolivia
        #   - `BQ` - Bonaire, Sint Eustatius and Saba
        #   - `BA` - Bosnia and Herzegovina
        #   - `BW` - Botswana
        #   - `BV` - Bouvet Island
        #   - `BR` - Brazil
        #   - `IO` - British Indian Ocean Territory
        #   - `BN` - Brunei
        #   - `BG` - Bulgaria
        #   - `BF` - Burkina Faso
        #   - `BI` - Burundi
        #   - `CV` - Cabo Verde
        #   - `KH` - Cambodia
        #   - `CM` - Cameroon
        #   - `CA` - Canada
        #   - `KY` - Cayman Islands
        #   - `CF` - Central African Republic
        #   - `TD` - Chad
        #   - `CL` - Chile
        #   - `CN` - China
        #   - `CX` - Christmas Island
        #   - `CC` - Cocos (Keeling) Islands
        #   - `CO` - Colombia
        #   - `KM` - Comoros
        #   - `CG` - Congo
        #   - `CD` - Congo (the Democratic Republic of the)
        #   - `CK` - Cook Islands
        #   - `CR` - Costa Rica
        #   - `CI` - Côte d'Ivoire
        #   - `HR` - Croatia
        #   - `CU` - Cuba
        #   - `CW` - Curaçao
        #   - `CY` - Cyprus
        #   - `CZ` - Czechia
        #   - `DK` - Denmark
        #   - `DJ` - Djibouti
        #   - `DM` - Dominica
        #   - `DO` - Dominican Republic
        #   - `EC` - Ecuador
        #   - `EG` - Egypt
        #   - `SV` - El Salvador
        #   - `GQ` - Equatorial Guinea
        #   - `ER` - Eritrea
        #   - `EE` - Estonia
        #   - `SZ` - Eswatini
        #   - `ET` - Ethiopia
        #   - `FK` - Falkland Islands (Malvinas)
        #   - `FO` - Faroe Islands
        #   - `FJ` - Fiji
        #   - `FI` - Finland
        #   - `FR` - France
        #   - `GF` - French Guiana
        #   - `PF` - French Polynesia
        #   - `TF` - French Southern Territories
        #   - `GA` - Gabon
        #   - `GM` - Gambia
        #   - `GE` - Georgia
        #   - `DE` - Germany
        #   - `GH` - Ghana
        #   - `GI` - Gibraltar
        #   - `GR` - Greece
        #   - `GL` - Greenland
        #   - `GD` - Grenada
        #   - `GP` - Guadeloupe
        #   - `GU` - Guam
        #   - `GT` - Guatemala
        #   - `GG` - Guernsey
        #   - `GN` - Guinea
        #   - `GW` - Guinea-Bissau
        #   - `GY` - Guyana
        #   - `HT` - Haiti
        #   - `HM` - Heard Island and McDonald Islands
        #   - `VA` - Holy See
        #   - `HN` - Honduras
        #   - `HK` - Hong Kong
        #   - `HU` - Hungary
        #   - `IS` - Iceland
        #   - `IN` - India
        #   - `ID` - Indonesia
        #   - `IR` - Iran
        #   - `IQ` - Iraq
        #   - `IE` - Ireland
        #   - `IM` - Isle of Man
        #   - `IL` - Israel
        #   - `IT` - Italy
        #   - `JM` - Jamaica
        #   - `JP` - Japan
        #   - `JE` - Jersey
        #   - `JO` - Jordan
        #   - `KZ` - Kazakhstan
        #   - `KE` - Kenya
        #   - `KI` - Kiribati
        #   - `KW` - Kuwait
        #   - `KG` - Kyrgyzstan
        #   - `LA` - Laos
        #   - `LV` - Latvia
        #   - `LB` - Lebanon
        #   - `LS` - Lesotho
        #   - `LR` - Liberia
        #   - `LY` - Libya
        #   - `LI` - Liechtenstein
        #   - `LT` - Lithuania
        #   - `LU` - Luxembourg
        #   - `MO` - Macao
        #   - `MG` - Madagascar
        #   - `MW` - Malawi
        #   - `MY` - Malaysia
        #   - `MV` - Maldives
        #   - `ML` - Mali
        #   - `MT` - Malta
        #   - `MH` - Marshall Islands
        #   - `MQ` - Martinique
        #   - `MR` - Mauritania
        #   - `MU` - Mauritius
        #   - `YT` - Mayotte
        #   - `MX` - Mexico
        #   - `FM` - Micronesia (Federated States of)
        #   - `MD` - Moldova
        #   - `MC` - Monaco
        #   - `MN` - Mongolia
        #   - `ME` - Montenegro
        #   - `MS` - Montserrat
        #   - `MA` - Morocco
        #   - `MZ` - Mozambique
        #   - `MM` - Myanmar
        #   - `NA` - Namibia
        #   - `NR` - Nauru
        #   - `NP` - Nepal
        #   - `NL` - Netherlands
        #   - `NC` - New Caledonia
        #   - `NZ` - New Zealand
        #   - `NI` - Nicaragua
        #   - `NE` - Niger
        #   - `NG` - Nigeria
        #   - `NU` - Niue
        #   - `NF` - Norfolk Island
        #   - `KP` - North Korea
        #   - `MK` - North Macedonia
        #   - `MP` - Northern Mariana Islands
        #   - `NO` - Norway
        #   - `OM` - Oman
        #   - `PK` - Pakistan
        #   - `PW` - Palau
        #   - `PS` - Palestine, State of
        #   - `PA` - Panama
        #   - `PG` - Papua New Guinea
        #   - `PY` - Paraguay
        #   - `PE` - Peru
        #   - `PH` - Philippines
        #   - `PN` - Pitcairn
        #   - `PL` - Poland
        #   - `PT` - Portugal
        #   - `PR` - Puerto Rico
        #   - `QA` - Qatar
        #   - `RE` - Réunion
        #   - `RO` - Romania
        #   - `RU` - Russia
        #   - `RW` - Rwanda
        #   - `BL` - Saint Barthélemy
        #   - `SH` - Saint Helena, Ascension and Tristan da Cunha
        #   - `KN` - Saint Kitts and Nevis
        #   - `LC` - Saint Lucia
        #   - `MF` - Saint Martin (French part)
        #   - `PM` - Saint Pierre and Miquelon
        #   - `VC` - Saint Vincent and the Grenadines
        #   - `WS` - Samoa
        #   - `SM` - San Marino
        #   - `ST` - Sao Tome and Principe
        #   - `SA` - Saudi Arabia
        #   - `SN` - Senegal
        #   - `RS` - Serbia
        #   - `SC` - Seychelles
        #   - `SL` - Sierra Leone
        #   - `SG` - Singapore
        #   - `SX` - Sint Maarten (Dutch part)
        #   - `SK` - Slovakia
        #   - `SI` - Slovenia
        #   - `SB` - Solomon Islands
        #   - `SO` - Somalia
        #   - `ZA` - South Africa
        #   - `GS` - South Georgia and the South Sandwich Islands
        #   - `KR` - South Korea
        #   - `SS` - South Sudan
        #   - `ES` - Spain
        #   - `LK` - Sri Lanka
        #   - `SD` - Sudan
        #   - `SR` - Suriname
        #   - `SJ` - Svalbard and Jan Mayen
        #   - `SE` - Sweden
        #   - `CH` - Switzerland
        #   - `SY` - Syria
        #   - `TW` - Taiwan
        #   - `TJ` - Tajikistan
        #   - `TZ` - Tanzania
        #   - `TH` - Thailand
        #   - `TL` - Timor-Leste
        #   - `TG` - Togo
        #   - `TK` - Tokelau
        #   - `TO` - Tonga
        #   - `TT` - Trinidad and Tobago
        #   - `TN` - Tunisia
        #   - `TR` - Turkey
        #   - `TM` - Turkmenistan
        #   - `TC` - Turks and Caicos Islands
        #   - `TV` - Tuvalu
        #   - `UG` - Uganda
        #   - `UA` - Ukraine
        #   - `AE` - United Arab Emirates
        #   - `GB` - United Kingdom
        #   - `UM` - United States Minor Outlying Islands
        #   - `US` - United States of America
        #   - `UY` - Uruguay
        #   - `UZ` - Uzbekistan
        #   - `VU` - Vanuatu
        #   - `VE` - Venezuela
        #   - `VN` - Vietnam
        #   - `VG` - Virgin Islands (British)
        #   - `VI` - Virgin Islands (U.S.)
        #   - `WF` - Wallis and Futuna
        #   - `EH` - Western Sahara
        #   - `YE` - Yemen
        #   - `ZM` - Zambia
        #   - `ZW` - Zimbabwe
        @country = country
        # @type [LOCATION_TYPE_ENUM] The location's type. Can be either WORK or HOME
        #   - `HOME` - HOME
        #   - `WORK` - WORK
        @location_type = location_type
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
        @remote_was_deleted = remote_was_deleted
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}]
        @field_mappings = field_mappings
        # @type [Array<Hris::RemoteData>]
        @remote_data = remote_data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Location
      #
      # @param json_object [JSON]
      # @return [Hris::Location]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        name = struct.name
        phone_number = struct.phone_number
        street_1 = struct.street_1
        street_2 = struct.street_2
        city = struct.city
        state = struct.state
        zip_code = struct.zip_code
        country = Hris::COUNTRY_ENUM.key(parsed_json["country"]) || parsed_json["country"]
        location_type = Hris::LOCATION_TYPE_ENUM.key(parsed_json["location_type"]) || parsed_json["location_type"]
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Hris::RemoteData.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, name: name, phone_number: phone_number, street_1: street_1,
            street_2: street_2, city: city, state: state, zip_code: zip_code, country: country, location_type: location_type, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of Location to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "name": @name,
          "phone_number": @phone_number,
          "street_1": @street_1,
          "street_2": @street_2,
          "city": @city,
          "state": @state,
          "zip_code": @zip_code,
          "country": Hris::COUNTRY_ENUM[@country] || @country,
          "location_type": Hris::LOCATION_TYPE_ENUM[@location_type] || @location_type,
          "remote_was_deleted": @remote_was_deleted,
          "created_at": @created_at,
          "modified_at": @modified_at,
          "field_mappings": @field_mappings,
          "remote_data": @remote_data
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.phone_number&.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
        obj.street_1&.is_a?(String) != false || raise("Passed value for field obj.street_1 is not the expected type, validation failed.")
        obj.street_2&.is_a?(String) != false || raise("Passed value for field obj.street_2 is not the expected type, validation failed.")
        obj.city&.is_a?(String) != false || raise("Passed value for field obj.city is not the expected type, validation failed.")
        obj.state&.is_a?(String) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
        obj.zip_code&.is_a?(String) != false || raise("Passed value for field obj.zip_code is not the expected type, validation failed.")
        obj.country&.is_a?(Hris::COUNTRY_ENUM) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
        obj.location_type&.is_a?(Hris::LOCATION_TYPE_ENUM) != false || raise("Passed value for field obj.location_type is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
