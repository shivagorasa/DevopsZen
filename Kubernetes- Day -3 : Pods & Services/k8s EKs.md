## Create the K8s EKS,further you have to do the deployment of Nginx application

1. Lauch an Ec2 instance with AWS instance Ami and t2.micro with following config
   ![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/745583c7-af2e-4d15-8c42-d8c206265396)

   ![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/950f9b64-2084-45b2-b433-93233a23e3ee)

2. We will connect to our instance using the EC2 Connect Instance instead of SSH into our personal Terminal.

   ![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/df4d5a9b-d6ab-42e8-9f0a-fbd584e3ec4a)

3. We will first make sure we have the updated version of our AWS CLI. We can check by using :

   Run these commands to update our version of AWS CLI:

   ```
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip -u awscliv2.zip
    sudo ./aws/install
    /usr/local/bin/aws --version
   ```
  This should have updated the AWS CLI
  
  ![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/fc07cca3-2417-4e5a-9d6b-6aed1ba15152)


4. Login using IAM user credentials :
Using the command:
```
aws configure
```
We will enter your access key and secret access key. We will also pick a region and format we want. I chose region us-east-1 and format is Json.

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/a395c83c-4099-4202-af03-6d1efffc8053)

5. Install kubectl & eksctl:
  We will need to start with kubectl first before we install eksctl. We can reference this documentation here

  Run these commands on the terminal
```
  curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/kubectl
  chmod +x ./kubectl
  mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
  kubectl version --short --client
```
  By following these commands in order, the output should look like this:
  ![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/d764c07c-430d-4bc9-9075-713836c2c542)

6. To install eksctl, we will be referencing this documentation here .

  We will run these commands to accomplish this install:
  
  ```
  curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
  sudo mv /tmp/eksctl /usr/local/bin
  eksctl version
  ```
  ![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/ca468e1d-3822-4e82-b280-aaf7418ffc2e)

7. Create a EKS cluster
  We will now start to create our cluster by running this command:
```
eksctl create cluster --name my-eks --region us-east-1 --nodegroup-name pro-19 --node-type t2.micro --nodes 2 --nodes-min 1 --nodes-max 3 --managed 

```
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/ca66b34a-b080-44dd-82e8-a9d19b594110)

We can go into our AWS console and go to Cloudformation to see how everything is being created.
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/9eade58e-a61b-44b8-8060-2c0ac0a48c5c)

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/78fdb377-aef3-40b1-8744-33b0e690c156)

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/a3d66255-c8cf-4fa0-ae8a-4c4af32988dd)

Deploy Nginx :
In the CLI, lets get into our cluster and check out our nodes:

```
eksctl get cluster
aws eks update-kubeconfig --name my-eks --region us-east-1
kubectl get nodes
```

Create Deployment YAML:
Create a YAML file for your nginx deployment. For example, nginx-deployment.yaml:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
```
Deploy nginx:
Apply the deployment YAML to deploy nginx:
```
kubectl apply -f nginx-deployment.yaml
```

Expose the Deployment :
We can expose the deployment using a service of type LoadBalancer or NodePort. Here's an example using Loadbalancer:

```
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  type: NodePort
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: LoadBalancer
    
```
Save this as nginx-service.yaml and apply it:
```
kubectl apply -f nginx-service.yaml
```

get services runnning on nginx
```
kubecl get svc nginx-service
```
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/f1dd2bf0-0a2d-4c2b-ad27-8044442ca853)

Using external Ip addres access using following command
```
curl -k a4ab46111afbe4a5db51afced1f44b8a-1157613377.us-east-1.elb.amazonaws.com
```
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/eb5d235b-3502-4fb2-80b3-8e9a561995e0)

Successfully deployed nginx with EKS 

* Do remember to clean up after successful deployment

## _Submitted by Shiva Kumar Gorasa_






