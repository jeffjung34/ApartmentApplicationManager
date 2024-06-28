# README


## Description
This project is a Ruby on Rails application for managing apartment applications. Users can apply to apartments that have available bedrooms, and current residents can review and approve or deny these applications. The system ensures that if an application is accepted, all other applications by the same user are marked as superseded, and the user is moved into the apartment.

## Features
- Users can apply to multiple apartments with available bedrooms.
- Residents can review and manage pending applications.
- Automatic handling of accepted applications, superseding other applications.
- Easy navigation and user-friendly interface.

## Requirements
- Ruby (version 2.7.0 or higher)
- Rails (version 6.0 or higher)
- SQLite3

## Setup
1. Clone the repository:
    ```sh
    git clone https://github.com/jeffjung34/ApartmentApplicationManager.git
    cd ApartmentApplicationManager
    ```

2. Install dependencies:
    ```sh
    bundle install
    ```

3. Set up the database:
    ```sh
    rails db:create
    rails db:migrate
    rails db:seed
    ```

4. Run the tests to ensure everything is set up correctly:
    ```sh
    rails test
    ```

5. Start the server:
    ```sh
    rails server
    ```

6. Visit `http://localhost:3000` in your browser.

## Usage
- Visit the home page to see available apartments.
- Apply to an apartment by visiting the apartment's show page and clicking the "Apply" button.
- Review and manage applications from your profile page if you are a resident of an apartment.
