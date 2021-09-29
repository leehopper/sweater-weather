# Sweater Weather API

[![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url]
[![Stargazers][stars-shield]][stars-url]
[![Forks][forks-shield]][forks-url]

### Welcome to TikiArté! - A database-driven web application

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## Table of Contents

- [Overview](#overview)
- [Tools Utilized](#framework)
- [Contributors](#contributors)


### Overview

`Sweater Weather`: Sweater Weather is an API project for the Turing School of Software and Design. Planning a roadtrip? The API endpoints will return weather and travel data for so you know what to pack and what the weather will be when you arrive!


#### Framework
<p>
  <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />
</p>

#### Languages
<p>
  <img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />
  <img src="https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white" />
</p>

#### Tools
<p>
  <img src="https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white" />  
  <img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/Postman-FF6E4F.svg?&style=flat&logo=postman&logoColor=white" />
  </br>
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1.svg?&style=flaste&logo=postgresql&logoColor=white" />
</p>

#### Gems
<p>
  <img src="https://img.shields.io/badge/rspec--rails-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/standard-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/shoulda--matchers-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  </br>
  <img src="https://img.shields.io/badge/launchy-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/capybara-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/bcrypt-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/figaro-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  </br>
  <img src="https://img.shields.io/badge/webmock-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/fast_jsonapi-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/factory_bot_rails-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  </br>
  <img src="https://img.shields.io/badge/faker-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" /> />
</p>

#### Development Principles
<p>
  <img src="https://img.shields.io/badge/OOP-b81818.svg?&style=flaste&logo=OOP&logoColor=white" />
  <img src="https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white" />
  <img src="https://img.shields.io/badge/MVC-b8b018.svg?&style=flaste&logo=MVC&logoColor=white" />
  <img src="https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white" />  
</p>


### <ins>Contributors</ins>

👤  **Lee Hopper**
- Github: [Lee Hopper](https://github.com/leehopper)
- LinkedIn: [Lee Hopper](https://www.linkedin.com/in/lee-hopper/)

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/Bhjones45/tikiarte_be.svg?style=flat
[contributors-url]: https://github.com/leehopper/sweater-weather/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Bhjones45/tikiarte_be.svg?style=flat
[forks-url]: https://github.com/leehopper/sweater-weather/network/members
[stars-shield]: https://img.shields.io/github/stars/Bhjones45/tikiarte_be.svg?style=flat
[stars-url]: https://github.com/leehopper/sweater-weather/stargazers
[issues-shield]: https://img.shields.io/github/issues/Bhjones45/tikiarte_be.svg?style=flat
[issues-url]: https://github.com/leehopper/sweater-weather/issues


### Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Set up the database: `rails db:{drop,create,migrate,seed}`
4. Set up [API Access](#project-configurations)

Find the [project spec here](https://backend.turing.edu/module3/projects/sweater_weather/)

#### Endpoints

[Endpoints](https://backend.turing.edu/module3/projects/sweater_weather/requirements)

#### <ins>Project Configurations</ins>

* Ruby Version
    ```bash
    $ ruby -v
    ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
    ```

* [System Dependencies](https://github.com/leehopper/sweater-weather/blob/main/Gemfile)
    ```bash
    $ rails -v
    Rails 5.2.6
    ```

* Database Creation
    ```bash
    $ rails db:{drop,create,migrate,seed}
    Created database 'tikiarte_be_development'
    Created database 'tikiarte_be_test'
    ```

* API Access
  - Request an API key from...
  
      ```bash
      Code Optional Here
      ```



* How to run the test suite:
    ```bash
    $ bundle exec rspec -fd
    ```

* [Local Deployment](http://localhost:3000), for testing:
    ```bash
    $ rails s
  => Booting Puma
  => Rails 5.2.6 application starting in development
  => Run `rails server -h` for more startup options
  Puma starting in single mode...
  * Version 3.12.6 (ruby 2.7.2-p137), codename: Llamas in Pajamas
  * Min threads: 5, max threads: 5
  * Environment: development
  * Listening on tcp://localhost:3000
  Use Ctrl-C to stop
    ```
