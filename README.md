# Creating Multiple Spotify Playlists Using Terraform

## Project Overview
This project involves using Terraform to create multiple Spotify playlists for different occasions like morning, evening, party night, etc. Terraform will be used to automate the creation and management of these playlists on your Spotify account. This version uses AWS EC2 instances to handle the Spotify authorization instead of Docker.

## Prerequisites
Before you begin, ensure you have the following installed and set up:

- **Terraform**: Make sure Terraform is installed on your machine. You can install it from [Terraform's official site](https://www.terraform.io/downloads).
- **Docker**: Ensure Docker is installed and running on your machine. You can get it from [Docker's official site](https://www.docker.com/get-started).
- **AWS Account**: Ensure you have an AWS account and appropriate permissions to create EC2 instances.
- **Spotify Account**: You need a Spotify account (a free account will work).
- **Spotify Developer Account**: Register and create an application at [Spotify Developer Dashboard](https://developer.spotify.com/dashboard/applications) to obtain the Client ID and Client Secret.
- **Spotify Provider for Terraform**: The provider for Terraform will help you manage your Spotify resources. Make sure to configure it correctly.

## Steps to Complete the Project

### 1. Create a Terraform Project
- Create a new directory for your Terraform project and navigate to it in your terminal:
  ```bash
  mkdir SPOTIFY
  cd SPOTIFY

### 2. Define the Spotify Provider in provider.tf
Create a file named provider.tf and define the Spotify provider configuration:
  ```bash
terraform {
  required_providers {
    spotify = {
      source = "conradludgate/spotify"
      version = "0.2.7"
    }
  }
}

provider "spotify" {
  # Configuration options
  api_key = var.api_key
}


### 3. Get Spotify API Credentials
To interact with Spotify’s API, you need a Client ID and Client Secret. These are obtained when you create an application on the Spotify Developer Dashboard.

### 4. Create Spotify Application
Go to the Spotify Developer Dashboard and log in.
Click on "Create an App".
Fill in the required details such as:
App Name: Pratiksha-Playlist
App Description: Create multiple Spotify playlists using Terraform.
Redirect URI: http://localhost:27228/spotify_callback
![Screenshot (7)](https://github.com/user-attachments/assets/17d7bcd4-1173-4e75-88df-0ba5d86a8a8d)
After creating the app, note down your Client ID and Client Secret

![Screenshot (8)](https://github.com/user-attachments/assets/da66eb2d-cb73-4036-a32d-1a95e4826e02)
![Screenshot (10)](https://github.com/user-
![Screenshot (11)](https://github.com/user-attachments/assets/a41dad21-5d16-4b5d-868a-f1b8e677c087)
attachments/assets/e048f739-f3b3-4453-91e2-8948720802a7)
###n5. Store Your API Credentials
Create a .env file to store your Spotify credentials securely:
```bash
SPOTIFY_CLIENT_ID=your-client-id
SPOTIFY_CLIENT_SECRET=your-client-secret

