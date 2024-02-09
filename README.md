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
        `git push` or `git push origin master`

## Step 5: Terraform Backend
Terraform remote backend is designed to store the state of your infrastructure in a remote datastore  such as Amazon S3, with optional state locking through services like AWS DynamoDB .
This setup ensures your backed up, versioned and protected against concurrent modifications.
The dilemma arises when you consider the following 
To initialize a remote backend like AWS S3 you might ideally used terraform to create the necessary resources like an S3 bucket. Howevre to run terraform and create any resources you require a backend to store at state.
Thus you need a backend to create a backend. This circular dependency is the essense of Chicken and egg problem in this context.
There are many methods available to address this challenge.
1. You can manually create the necessary resources using a managemet concole.
2. Use the AWS Command Line Interface (CLI) to set up the required resources 
        
        aws s3api create-bucket --bucket myterraform-state-bucket
    
        {
            "Location":"/myterraform-state-bucket"
        }

        aws s3api put-bucket-versioning --bucket myterraform-state-bucket --versioning-configuration Status=Enabled

3. Alterbatively could you Bash Script that automates the creation og necessary backend resources.
4. Use terraform itself and create a remote-backend module, a module dedicated  to the backend setupkeeps the related logic separate from your primary infrastructure code.
This separation ensures cleaner and more maintaibanle and reusable code.
In the first task you will begin by creating a remote backend module.
    terraform
     |-- modules
         |-- 

You will create a necessary resources like S3 bucket for storing state and a DynamoDB table for state locking.
After setting up the backend resources you will initialize your terraform project and configure it to use the remote backend pointing to the spawned by the module.
With the backend inplace you can continue with your regular terraform workflows.

### Step 5.1: Creating a Remote Backend Module
In here we will focus on setting up the necessary AWS resources required for a Terraform Remote Backend.
You will create a reusable remote backend module that compromises of the following resources - 
* IAM -- An IAM user for terraform, this user will have necessary permissions to manage your infrastructure. 
Its a good practice to have a specific IAM user for Terraform to limit the permissions and scope of actions that Terraform can perform, ensuing that terraform has only the permissions it needs and no more. 
* S3 Bucket for Terraform State -- this S3 bucket will be used to store your terraform State file allowing for easy access and versioning of your infrastructure State.
* S3 Bucket Policy --  This policy will specify the permissions for the S3 bucket allowing the terraform user to list the bucket and to retrieve as well as deposit the objects within it.
* DynamoDB -- A DynamoDB table for State Locking, this DynamoDB table will be used to lock the state file when a team member is applying changes to the infrastructure, preventing conflits.

Lets setup this.

