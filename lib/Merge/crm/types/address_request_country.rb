# frozen_string_literal: true
require "json"

module Merge
  module Crm
    # The address's country. 
- `AF` - Afghanistan
- `AX` - Åland Islands
- `AL` - Albania
- `DZ` - Algeria
- `AS` - American Samoa
- `AD` - Andorra
- `AO` - Angola
- `AI` - Anguilla
- `AQ` - Antarctica
- `AG` - Antigua and Barbuda
- `AR` - Argentina
- `AM` - Armenia
- `AW` - Aruba
- `AU` - Australia
- `AT` - Austria
- `AZ` - Azerbaijan
- `BS` - Bahamas
- `BH` - Bahrain
- `BD` - Bangladesh
- `BB` - Barbados
- `BY` - Belarus
- `BE` - Belgium
- `BZ` - Belize
- `BJ` - Benin
- `BM` - Bermuda
- `BT` - Bhutan
- `BO` - Bolivia
- `BQ` - Bonaire, Sint Eustatius and Saba
- `BA` - Bosnia and Herzegovina
- `BW` - Botswana
- `BV` - Bouvet Island
- `BR` - Brazil
- `IO` - British Indian Ocean Territory
- `BN` - Brunei
- `BG` - Bulgaria
- `BF` - Burkina Faso
- `BI` - Burundi
- `CV` - Cabo Verde
- `KH` - Cambodia
- `CM` - Cameroon
- `CA` - Canada
- `KY` - Cayman Islands
- `CF` - Central African Republic
- `TD` - Chad
- `CL` - Chile
- `CN` - China
- `CX` - Christmas Island
- `CC` - Cocos (Keeling) Islands
- `CO` - Colombia
- `KM` - Comoros
- `CG` - Congo
- `CD` - Congo (the Democratic Republic of the)
- `CK` - Cook Islands
- `CR` - Costa Rica
- `CI` - Côte d'Ivoire
- `HR` - Croatia
- `CU` - Cuba
- `CW` - Curaçao
- `CY` - Cyprus
- `CZ` - Czechia
- `DK` - Denmark
- `DJ` - Djibouti
- `DM` - Dominica
- `DO` - Dominican Republic
- `EC` - Ecuador
- `EG` - Egypt
- `SV` - El Salvador
- `GQ` - Equatorial Guinea
- `ER` - Eritrea
- `EE` - Estonia
- `SZ` - Eswatini
- `ET` - Ethiopia
- `FK` - Falkland Islands (Malvinas)
- `FO` - Faroe Islands
- `FJ` - Fiji
- `FI` - Finland
- `FR` - France
- `GF` - French Guiana
- `PF` - French Polynesia
- `TF` - French Southern Territories
- `GA` - Gabon
- `GM` - Gambia
- `GE` - Georgia
- `DE` - Germany
- `GH` - Ghana
- `GI` - Gibraltar
- `GR` - Greece
- `GL` - Greenland
- `GD` - Grenada
- `GP` - Guadeloupe
- `GU` - Guam
- `GT` - Guatemala
- `GG` - Guernsey
- `GN` - Guinea
- `GW` - Guinea-Bissau
- `GY` - Guyana
- `HT` - Haiti
- `HM` - Heard Island and McDonald Islands
- `VA` - Holy See
- `HN` - Honduras
- `HK` - Hong Kong
- `HU` - Hungary
- `IS` - Iceland
- `IN` - India
- `ID` - Indonesia
- `IR` - Iran
- `IQ` - Iraq
- `IE` - Ireland
- `IM` - Isle of Man
- `IL` - Israel
- `IT` - Italy
- `JM` - Jamaica
- `JP` - Japan
- `JE` - Jersey
- `JO` - Jordan
- `KZ` - Kazakhstan
- `KE` - Kenya
- `KI` - Kiribati
- `KW` - Kuwait
- `KG` - Kyrgyzstan
- `LA` - Laos
- `LV` - Latvia
- `LB` - Lebanon
- `LS` - Lesotho
- `LR` - Liberia
- `LY` - Libya
- `LI` - Liechtenstein
- `LT` - Lithuania
- `LU` - Luxembourg
- `MO` - Macao
- `MG` - Madagascar
- `MW` - Malawi
- `MY` - Malaysia
- `MV` - Maldives
- `ML` - Mali
- `MT` - Malta
- `MH` - Marshall Islands
- `MQ` - Martinique
- `MR` - Mauritania
- `MU` - Mauritius
- `YT` - Mayotte
- `MX` - Mexico
- `FM` - Micronesia (Federated States of)
- `MD` - Moldova
- `MC` - Monaco
- `MN` - Mongolia
- `ME` - Montenegro
- `MS` - Montserrat
- `MA` - Morocco
- `MZ` - Mozambique
- `MM` - Myanmar
- `NA` - Namibia
- `NR` - Nauru
- `NP` - Nepal
- `NL` - Netherlands
- `NC` - New Caledonia
- `NZ` - New Zealand
- `NI` - Nicaragua
- `NE` - Niger
- `NG` - Nigeria
- `NU` - Niue
- `NF` - Norfolk Island
- `KP` - North Korea
- `MK` - North Macedonia
- `MP` - Northern Mariana Islands
- `NO` - Norway
- `OM` - Oman
- `PK` - Pakistan
- `PW` - Palau
- `PS` - Palestine, State of
- `PA` - Panama
- `PG` - Papua New Guinea
- `PY` - Paraguay
- `PE` - Peru
- `PH` - Philippines
- `PN` - Pitcairn
- `PL` - Poland
- `PT` - Portugal
- `PR` - Puerto Rico
- `QA` - Qatar
- `RE` - Réunion
- `RO` - Romania
- `RU` - Russia
- `RW` - Rwanda
- `BL` - Saint Barthélemy
- `SH` - Saint Helena, Ascension and Tristan da Cunha
- `KN` - Saint Kitts and Nevis
- `LC` - Saint Lucia
- `MF` - Saint Martin (French part)
- `PM` - Saint Pierre and Miquelon
- `VC` - Saint Vincent and the Grenadines
- `WS` - Samoa
- `SM` - San Marino
- `ST` - Sao Tome and Principe
- `SA` - Saudi Arabia
- `SN` - Senegal
- `RS` - Serbia
- `SC` - Seychelles
- `SL` - Sierra Leone
- `SG` - Singapore
- `SX` - Sint Maarten (Dutch part)
- `SK` - Slovakia
- `SI` - Slovenia
- `SB` - Solomon Islands
- `SO` - Somalia
- `ZA` - South Africa
- `GS` - South Georgia and the South Sandwich Islands
- `KR` - South Korea
- `SS` - South Sudan
- `ES` - Spain
- `LK` - Sri Lanka
- `SD` - Sudan
- `SR` - Suriname
- `SJ` - Svalbard and Jan Mayen
- `SE` - Sweden
- `CH` - Switzerland
- `SY` - Syria
- `TW` - Taiwan
- `TJ` - Tajikistan
- `TZ` - Tanzania
- `TH` - Thailand
- `TL` - Timor-Leste
- `TG` - Togo
- `TK` - Tokelau
- `TO` - Tonga
- `TT` - Trinidad and Tobago
- `TN` - Tunisia
- `TR` - Turkey
- `TM` - Turkmenistan
- `TC` - Turks and Caicos Islands
- `TV` - Tuvalu
- `UG` - Uganda
- `UA` - Ukraine
- `AE` - United Arab Emirates
- `GB` - United Kingdom
- `UM` - United States Minor Outlying Islands
- `US` - United States of America
- `UY` - Uruguay
- `UZ` - Uzbekistan
- `VU` - Vanuatu
- `VE` - Venezuela
- `VN` - Vietnam
- `VG` - Virgin Islands (British)
- `VI` - Virgin Islands (U.S.)
- `WF` - Wallis and Futuna
- `EH` - Western Sahara
- `YE` - Yemen
- `ZM` - Zambia
- `ZW` - Zimbabwe
    class AddressRequestCountry
      attr_reader :member
      alias kind_of? is_a?
      # @param member [Object] 
      # @return [Crm::AddressRequestCountry]
      def initialize(member:)
        # @type [Object] 
        @member = member
      end
      # Deserialize a JSON object to an instance of AddressRequestCountry
      #
      # @param json_object [JSON] 
      # @return [Crm::AddressRequestCountry]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          struct.is_a?(COUNTRY_ENUM) != false || raise("Passed value for field struct is not the expected type, validation failed.")
          member = COUNTRY_ENUM.key(json_object)
          return new(member: member)
        rescue StandardError
          # noop
        end
        begin
          struct.is_a?(String) != false || raise("Passed value for field struct is not the expected type, validation failed.")
          member = json_object
          return new(member: member)
        rescue StandardError
          # noop
        end
        return new(member: struct)
      end
      # For Union Types, to_json functionality is delegated to the wrapped member.
      #
      # @return [JSON]
      def to_json
        @member.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        begin
          return obj.is_a?(COUNTRY_ENUM) != false || raise("Passed value for field obj is not the expected type, validation failed.")
        rescue StandardError
          # noop
        end
        begin
          return obj.is_a?(String) != false || raise("Passed value for field obj is not the expected type, validation failed.")
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
      # For Union Types, is_a? functionality is delegated to the wrapped member.
      #
      # @param obj [Object] 
      # @return [Boolean]
      def is_a?(obj)
        @member.is_a?(obj)
      end
    end
  end
end