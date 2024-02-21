# Merge Ruby Library

[![Gem Version](https://img.shields.io/badge/merge_ruby_client-v0.0.3-red?logo=ruby)](https://rubygems.org/gems/merge_ruby_client)


The Merge Ruby library provides access to the Merge API from Ruby.


## Documentation

API reference documentation is available [here](https://docs.merge.dev/).

## Installation

Install the gem and add to the application's Gemfile by executing:

```sh
bundle add merge_ruby_client
```

If bundler is not being used to manage dependencies, install the gem by executing:

```sh
gem install merge_ruby_client
```

## Instantiation

```ruby
require "merge_ruby_client"

merge = Merge::Client.new(
  api_key: 'YOUR_API_KEY',
  account_token: 'YOUR_ACCOUNT_TOKEN'
)
```

## Categories

This SDK contains the ATS, HRIS, CRM, Ticketing, Accounting, and File Storage categories. Even if you do not plan on using more than one Merge API category right now, the SDK provides upgrade-flexibility in case you find new Merge API categories useful in the future.

Each category is namespaced:

```ruby
merge = Merge::Client.new(
  api_key: 'YOUR_API_KEY',
  account_token: 'YOUR_ACCOUNT_TOKEN'
)

merge.ats. # APIs specific to the ATS Category

merge.hris. # APIs specific to the HRIS Category
```

## Usage

Below are code snippets of how you can use the Ruby SDK.

### Create Link Token

```ruby
require "merge_ruby_client"

merge = Merge::Client.new(
  api_key: 'YOUR_API_KEY'
)

link_token_response = merge.ats.link_token.create(
    end_user_email_address: "john.smith@gmail.com",
    end_user_organization_name: "acme",
    end_user_origin_id: "1234",
    categories: [Merge::Ats::CATEGORIES_ENUM[:ats]],
    link_expiry_mins: 30,
)

puts link_token_response.link_token
```

### Retrieve Account Token Using Public Token

```ruby
require "merge_ruby_client"

merge = Merge::Client.new(
  api_key: 'YOUR_API_KEY'
)
account_token_response = merge.ats.account_token.retrieve(public_token: PUBLIC_TOKEN)

puts account_token_response.account_token
```

### Get Employee

```ruby
require "merge_ruby_client"

merge = Merge::Client.new(
  api_key: 'YOUR_API_KEY',
  account_token: 'YOUR_ACCOUNT_TOKEN'
)

employee = merge.hris.employees.retrieve(id: EMPLOYEE_ID)
```

### Get Candidate

```ruby
require "merge_ruby_client"

merge = Merge::Client.new(
  api_key: 'YOUR_API_KEY',
  account_token: 'YOUR_ACCOUNT_TOKEN'
)


candidate = merge.ats.candidates.retrieve(id: CANDIDATE_ID)
```

### Filter Candidate

```ruby
require "merge_ruby_client"

merge = Merge::Client.new(
  api_key: 'YOUR_API_KEY',
  account_token: 'YOUR_ACCOUNT_TOKEN'
)

candidates_response = merge.ats.candidates.list(created_after: "2030-01-01")

puts candidates_response.results
```

### Get Contact

```ruby
require "merge_ruby_client"

merge = Merge::Client.new(
  api_key: 'YOUR_API_KEY',
  account_token: 'YOUR_ACCOUNT_TOKEN'
)

merge.accounting.contacts.retrieve(id: CONTACT_ID)
```

### Create Ticket

```ruby
require "merge_ruby_client"

merge = Merge::Client.new(
  api_key: 'YOUR_API_KEY',
  account_token: 'YOUR_ACCOUNT_TOKEN'
)

merge.ticketing.tickets.create(
  model: {
    name: "Please add more integrations",
    assignees: ["17a54124-287f-494d-965e-3c5b330c9a68"],
    creator: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    due_date: "2022-10-11T00:00:00Z",
    status: Merge::Ticketing::TICKET_STATUS_ENUM[:open]
  },
)
```

## Beta status

This SDK is in beta, and there may be breaking changes between versions without a major version update. Therefore, we recommend pinning the package version to a specific version in your package.json file. This way, you can install the same version each time without breaking changes unless you are intentionally looking for the latest version.


## Contributing

While we value open-source contributions to this SDK, this library is generated programmatically. Additions made directly
to this library would have to be moved over to our generation code, otherwise they would be overwritten upon the next
generated release. Feel free to open a PR as a proof of concept, but know that we will not be able to merge it as-is. 
We suggest opening an issue first to discuss with us!

On the other hand, contributions to the README are always very welcome!
