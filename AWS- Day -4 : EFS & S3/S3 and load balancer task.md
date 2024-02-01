# 1. Create a S3 bucket, with no public access and upload files to the bucket 

To Create S3 bucket:

Go to the AWS Management Console and sign in.

Navigate to the S3 service by clicking on "Services" in the top left corner and selecting "S3" under "Storage".

Click the "Create bucket" button.
<img width="946" alt="image" src="https://github.com/shivagorasa/DevopsZen/assets/97184376/249867c5-df9b-4d82-b35a-876f81f15d98">

Enter a unique and meaningful bucket name. Bucket names must be globally unique. Choose a region for your bucket.

Uncheck the "Block all public access" option to ensure the bucket has no public access.
<img width="631" alt="image" src="https://github.com/shivagorasa/DevopsZen/assets/97184376/ea0e390d-1a5e-4d69-88f7-36913262b2a5">


Click through the remaining settings or adjust them as needed, and finally click the "Create bucket" button.
<img width="718" alt="image" src="https://github.com/shivagorasa/DevopsZen/assets/97184376/7a84315c-d9f4-49da-b2b6-8a0512a1a986">




Upload Files to the Bucket:
After creating the bucket, click on its name to open it.
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/9351bdd8-c729-49af-8183-0c16af32bfff)


Navigate to the "Overview" tab, and click on the "Upload" button.

Click on "Add files" and select the files you want to upload from your local machine. Here uploaded index.html file from local machine
<img width="852" alt="image" src="https://github.com/shivagorasa/DevopsZen/assets/97184376/b8829618-acee-4992-af89-0c9e6c2f6702">


Review the settings and configure them as needed.

Click the "Upload" button to upload your files.

Verify the Upload:
After the upload is complete, you can go back to the "Overview" tab of your bucket.

We should see the uploaded files(index.html) listed in the "Objects" section.
<img width="929" alt="image" src="https://github.com/shivagorasa/DevopsZen/assets/97184376/54aeff17-3966-4c27-82fd-fed0326da170">









