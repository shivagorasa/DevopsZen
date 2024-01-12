# _Create a simple script file , with some data present it and push it to repo. Now Create a project in Jenkins connected to your GitHub repository. When a commit is made to your repo, automatically build must get triggered from Jenkins and the output must be shared to me via email._


## Installed Jenkins in Ec2 Instance and made necessary Installations

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/b8df533f-dd66-405e-a999-f62e1b91d707)



### Added following project to my github Repository : _https://github.com/shivagorasa/Jenkins_Demo_

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/e5b4adc2-40a3-46f6-be27-8f86808a9220)

### Added a github webhook url to Payload URL
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/29312696-a814-4e4b-9a97-641327b4c716)

### Configured Jenkins FreeSyle Project with following URL : _https://github.com/shivagorasa/Jenkins_Demo_
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/bd6c8552-a2c4-4983-ad77-508c3e4027bf)



### Go to ‘Build Triggers’ tab and then on the ‘GitHub hook trigger for GITScm polling’. Or, choose the trigger of your choice.
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/21792954-bc4c-4e54-9a2e-47ea79766278)

### Click on the ‘Build Steps’ tab, then click on ‘Add build step’ and choose ‘Execute shell’ and provide required shell commands to be executed.
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/25f09a25-16a3-4667-9f57-7d12c23a9cc8)

### Add Post-build Actions to your project , Here When a commit is made to my repo, automatically build must get triggered from Jenkins and the output is shared to me via email in my email.
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/d30f44ea-774a-43e4-bed8-f76cbb1fe8ce)


In editable email notification added my email under recipient list
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/129ad973-cca6-46e7-b326-365b76373b33)

Under Advanced Select following and click on apply
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/de919135-4c84-4402-b78a-050cdd968b33)


## Before Commit this is following script.sh
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/23dc98e9-c25d-4413-b377-a46143e7563d)

### Go back to your GitHub repository, edit the  script.sh and commit the changes. We will now see how Jenkins ran the script after the commit.
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/a8ebe1a5-eeaf-4aa9-b3f7-c2de0307ba73)
### Click on commit changes
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/0f891f89-2f7c-4085-934f-6cba1620312d)

### Go back to your Jenkins project and you'll see that a new job was triggered automatically from the commit we made at the previous step. Click on the little arrow next to the job and choose ‘Console Output’.
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/64c0d72e-ce88-4ca3-bfa3-668fab5dc465)

_Console Output_:
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/b9d9c76b-6d19-46cb-b36b-0b2f4aaf5d7b)

_E-mailOutput_:
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/2910b5b4-4686-4d66-8767-a42b014e1fce)


# Submitted By Shiva Kumar Gorasa




