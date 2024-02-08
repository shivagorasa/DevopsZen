# Create Repo in CodeCommit & practice CodeBuild & Pipelines.

### To Create a Repo in AWS CodeCommit :
1. Go to Aws console
2. search for AWS CodeCommit in search bar
3. Choose Create Repository on Getting started page
4. Create a repository with name MyDemoRepo as follows and click on create , A new Repository will be created

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/ff8b45b2-3799-48e1-b633-e838f4011db0)

Clone repo to local repository using following with git

```
git clone https://git-codecommit.us-east-1.amazonaws.com/v1/repos/MyDemoRepo
```
A new repo will be created in local system , add sample project application to this repo 
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/e60e255d-f3f2-488f-9e39-403878384418)

use following commands to push changes to aws repo
To add all the changes to repo
```
git add -A
```
To commit changes
```
git commit -m "Added all files to repo"
```
then do
```
git push
```
We can verify uploaded files in repo on aws 

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/781473cf-d540-40fa-b70a-f255865cd4b7)

### Now let's Create an Amazon EC2 Linux instance and install the CodeDeploy agent here in this instance we'll deploy sample application.
As part of this process, create an instance role that allows install and management of the CodeDeploy agent on the instance. The CodeDeploy agent is a software package that enables an instance to be used in CodeDeploy deployments. 
We also attach policies that allow the instance to fetch files that the CodeDeploy agent uses to deploy our application and to allow the instance to be managed by SSM.

Create a instance and for this we enable logging without keypair
Create a instance role with following policies and name that role as _EC2InstanceRole_
```
AmazonEC2RoleforAWSCodeDeploy
AmazonSSMManagedInstanceCore
```
Expand Advanced details. In IAM instance profile, choose the IAM role we created in the previous step (_EC2InstanceRole_)
Launch an Instance , Here I have named instance _Webserver_
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/a25a765d-63b3-48d6-889e-1bc999dac9f7)


## Now let's deploy our application in CodeDeploy 

Create a role named as CodeDeployRole with _AWSCodeDeployRole_ policy attached

### To Create a application in CodeDeploy

Open the CodeDeploy console at https://console.aws.amazon.com/codedeploy

If the Applications page does not appear, on the menu, choose Applications.

Choose Create application.

In Application name, enter MyDemoApplication.

In Compute Platform, choose EC2/On-premises.

Choose Create application.

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/2f055562-47d2-46a8-9876-cbdea3201b1b)


### Now create a deployment group

On the page that displays our application, choose Create deployment group.

In Deployment group name, enter MyDemoDeploymentGroup.

In Service role, choose the ARN of the service role we created earlier (for example, arn:aws:iam::account_ID:role/CodeDeployRole).

Under Deployment type, choose In-place.

Under Environment configuration, choose Amazon EC2 Instances. In the Key field, enter Name. In the Value field, enter the name we used to tag the instance (for example, MyCodePipelineDemo).

Under Agent configuration with AWS Systems Manager, choose Now and schedule updates. This installs the agent on the instance. The Linux instance is already configured with the SSM agent and will now be updated with the CodeDeploy agent.

Under Deployment configuration, choose CodeDeployDefault.OneAtaTime.

Under Load Balancer, make sure Enable load balancing is not selected. we do not need to set up a load balancer or choose a target group for this example.

Choose Create deployment group

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/3a1d99d1-cf18-4ef9-a580-829aa63aa698)

## Now let's create our first Pipeline in CodePipeline


Open the CodePipeline console at https://console.aws.amazon.com/codepipeline/.

Choose Create pipeline.

In Step 1: Choose pipeline settings, in Pipeline name, enter MyFirstPipeline.

In Pipeline type, choose V2

In Service role, choose New service role to allow CodePipeline to create a service role in IAM.

Leave the settings under Advanced settings at their defaults, and then choose Next.

In Step 2: Add source stage, in Source provider, choose CodeCommit. In Repository name, choose the name of the CodeCommit repository we created in Step 1: Create a CodeCommit repository. In Branch name, choose main, and then choose Next step.

After we select the repository name and branch, a message displays the Amazon CloudWatch Events rule to be created for this pipeline.

Under Change detection options, leave the defaults. This allows CodePipeline to use Amazon CloudWatch Events to detect changes in our source repository.

Choose Next.

In Step 3: Add build stage, choose Skip build stage, and then accept the warning message by choosing Skip again. Choose Next.

In Step 4: Add deploy stage, in Deploy provider, choose CodeDeploy. In Application name, choose MyDemoApplication. In Deployment group, choose MyDemoDeploymentGroup, and then choose Next step.

In Step 5: Review, review the information, and then choose Create pipeline.

The pipeline starts running after it is created. It downloads the code from our CodeCommit repository and creates a CodeDeploy deployment to our EC2 instance. we can view progress and success and failure messages as the CodePipeline sample deploys the webpage to the Amazon EC2 instance in the CodeDeploy deployment.
Deployment success:

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/a9558076-3d92-44dc-82a0-a94caa028453)

Pipeline Success:

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/a6ab4b84-e6f4-448b-b4c7-81bdcedc9dbc)

We Can verify app deployed to our ec2 instance using instance public dns
Here I also updated and made 2nd deployment which changed some text in index.html

This is second deployment:
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/b4ccb09f-aec7-40d7-b526-5658e3840223)

This is output confirmed with our app being deployed on our webserver Instance
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/82fe5571-73b2-4074-aa81-8f450a8939c1)


_Submitted By Shiva Kumar Gorasa_






