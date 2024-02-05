# AWS and Terraform Project and CICD Pipeline.
Hosting a Static Website on AWS and maintaining the infrastructure using Terraform, also making it automated using CICD.

## Step 1: Creating and Cloning a GIT Repo.
    Create a Repo in GIT browser.
        say "aws_terraform_cicd"

    Next will clone it to our working directory.
    Using `git clone <http path from browser>`

    Open the Editor (VS Code)

## Step 2: Setting up the working Environment.
    Installing aws cli; terraform cli and ensuring git is setup.

    After install configure aws credentials using 
    `aws configure`

    Verify if all installed properly
        `aws --version`
        `terraform --version`
        `git --version`

    Create a directory say "website".
        Add or create code in the website folder for using your choice of programming language.
        May be say Flask App.

    Will work on this soon.

## Step 3: Creating essential Terraform files and folders.
    Create a directory at root folder for Terraform say "terraform"
    Inside "terraform" create another subfolder as "modules" and below files inside "terraform" folder.
        main.tf
        backend.tf
        variables.tf
        terraform.tfvars

    Will work on this soon.

## Step 4: Commiting the Terraform and Website files and pushing changes to GitHub.
    Adding .DS_Store file into .gitignore file as this is MacOS specific and is of no use in other than MacOS.
    Also add any other custom files if like to ignore.

    Next stage all the changes to Git.
        `git add .`
        `git commit -m 'adding website and terraform folder structure'
