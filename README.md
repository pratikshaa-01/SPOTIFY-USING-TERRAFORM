# Creating Multiple Spotify Playlists Using Terraform

## Project Overview
This project involves using Terraform to create multiple Spotify playlists for different occasions like morning, evening, party night, etc. Terraform will be used to automate the creation and management of these playlists on your Spotify account. This version uses AWS EC2 instances to handle the Spotify authorization instead of Docker.

## Prerequisites
Before you begin, ensure you have the following installed and set up:

- **Terraform**: Make sure Terraform is installed on your machine. You can install it from [Terraform's official site](https://www.terraform.io/downloads).
- **AWS Account**: Ensure you have an AWS account and appropriate permissions to create EC2 instances.
- **Spotify Account**: You need a Spotify account (a free account will work).
- **Spotify Developer Account**: Register and create an application at [Spotify Developer Dashboard](https://developer.spotify.com/dashboard/applications) to obtain the Client ID and Client Secret.
- **Spotify Provider for Terraform**: The provider for Terraform will help you manage your Spotify resources. Make sure to configure it correctly.

## Steps to Complete the Project

### 1. Create a Terraform Project
- Create a new directory for your Terraform project and navigate to it in your terminal:
  ```bash
  mkdir spotify-playlists
  cd spotify-playlists
