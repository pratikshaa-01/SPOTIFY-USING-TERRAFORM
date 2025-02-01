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

### 1. Create an EC2 Instance on AWS
1. **Log in to AWS Console**  
   Go to [AWS Management Console](https://aws.amazon.com/console/) and log in.
   
   **Launch a New EC2 Instance**  
   Click on **Launch Instance**.

   **Configure Security Group**  
   Add inbound rules to the security group:
   - **HTTP**: Port 80 (for web access to the authorization page).
   - **SSH**: Port 22 (for SSH access to the instance).
   - **Custom TCP Rule**: Port `27228` (this is used by the authorization proxy server).

### 2. Create a Terraform Project
Create a new directory for your Terraform project and navigate to it in your terminal:
  ```bash
  mkdir SPOTIFY
  cd SPOTIFY
```
### 3. Define the Spotify Provider in provider.tf
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
  ```

### 4. Get Spotify API Credentials
To interact with Spotify’s API, you need a Client ID and Client Secret. These are obtained when you create an application on the Spotify Developer Dashboard.

### 5. Create Spotify Application
Go to the Spotify Developer Dashboard and log in.
Click on "Create an App".
Fill in the required details such as:
App Name: Pratiksha-Playlist
App Description: Create multiple Spotify playlists using Terraform.
Redirect URI: http://localhost:27228/spotify_callback

![Screenshot (6)](https://github.com/user-attachments/assets/cd39a813-d0a0-4e2d-93c9-211279afda4d)

![Screenshot (7)](https://github.com/user-attachments/assets/d938dd7a-b6d9-4ad7-945b-fd76f8f05a1c)

![Screenshot (8)](https://github.com/user-attachments/assets/544ed269-8645-4ce1-8865-9e639732b8e1)

After creating the app, note down your Client ID and Client Secret

![Screenshot (11)](https://github.com/user-attachments/assets/fd050caa-b7d1-4682-8a9c-1bf9582da285)


### 6. Store Your API Credentials
Create a .env file to store your Spotify credentials securely:
```bash
SPOTIFY_CLIENT_ID=your-client-id
SPOTIFY_CLIENT_SECRET=your-client-secret
 ```

### 7. Start the Authorization Proxy
Ensure Docker is running on your machine.

Start the authorization proxy server by running:

![Screenshot (12)](https://github.com/user-attachments/assets/0fd020da-071b-407d-8600-0d0f1e0a2d2a)

This will generate a URL for authorization. Open the URL in your browser and log in to Spotify to authorize the app.

![Screenshot (13)](https://github.com/user-attachments/assets/b17c9524-db08-476b-a5a7-d8850ff9d39e)


After successful authorization, you should see a confirmation message, such as “Authorization Successful”.

![Screenshot (14)](https://github.com/user-attachments/assets/57d3ad7a-d570-4e8d-9b5a-74936c3cb87d)

### 8. Define Playlist Resources in playlist.tf
Create a playlist.tf file to define your Spotify playlists.
``` bash
resource "spotify_playlist" "Bollywood" {
  name   = "Bollywood"
  tracks = ["5QW9K4A1gMnIi94YUxtsfM"]
}

data "spotify_search_track" "emi" {
  artist = "Eminem"
}

resource "spotify_playlist" "slimShady" {
  name   = "Slim Shady"
  tracks = [
    data.spotify_search_track.emi.tracks[0].id,
    data.spotify_search_track.emi.tracks[1].id,
    data.spotify_search_track.emi.tracks[2].id
  ]
}
```

### 8. Initialize and Apply Terraform Configuration
Run the following commands to initialize and apply the Terraform configuration:
``` bash
terraform init
```
``` bash
terraform apply
```


###  9. Verify Playlists on Spotify
After applying the Terraform configuration, log in to your Spotify account.
Verify that the playlists have been created and populated with the tracks you specified in your Terraform code.

![Screenshot (22)](https://github.com/user-attachments/assets/ca1c1931-8536-4903-aa21-1585966b44f1)

### Conclusion:
By completing this project, you can efficiently automate the creation and management of Spotify playlists using Terraform and AWS EC2 instances. This method not only streamlines the process but also maintains consistency across your playlists. Feel free to adjust and personalize the playlists with different tracks to match any occasion or mood.

## You can copy and paste the required files from:
```
https://github.com/pratikshaa-01/SPOTIFY-USING-TERRAFORM
```








