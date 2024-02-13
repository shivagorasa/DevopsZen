# Setup minikube at your local and explore creating namespaces (Go through official documentation)

Firstly to Install Minikube on local machine:

3 Steps to Install Minikube on Windows 10
by wing

Minikube helps to create the Kubernetes environment on a personal computer. This post aims to show you a few simple steps to install Minikube on Windows Machine. Before installing minikube, make sure you have installed kubectl.

Step 1: Install kubectl

Go to https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-windows and following the link under “Install Kubectl on Windows”.

Create a folder called Kube or anything and then copy and paste the minikube .exe file in that folder.

Next, click on “This PC” then properties and then advance and then click on environmental variables.

Next, click on path and then click on edit  and add the path as shown below:

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/12585741-6670-4ab2-9346-6890b76a2cbc)

Step 2: Install Hypervisor

Here I have Installed virtualbox

Step 3: Install Minikube

Go to https://kubernetes.io/docs/tasks/tools/install-minikube/#install-minikube and download the .exe file from the link below.

download minikube-windows-amd64.exe.

Next, copy and paste the minikube-windows-amd64.exe file to the directory where you stored the kuebctl. Next, rename the

minkube-installer.exe to minikube.exe.

To start Minikube, type “minikube start” in the command prompt.

We get following output:

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/69286dcc-bf6c-4442-963c-b7531b244093)

To get all pods _kubectl get pods -A_

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/3d677936-cd23-47d9-a42e-570ac0957077)

Thus we can verify that kubectl is configured and Minikube is successfully installed on our local machine

# Now let's explore creating namespaces

Before we begin we need to have existing kubernetes cluster and must have some basic understanding of Pods, Services and Deployments

## What are Kubernetes Namespace?

Namespaces are a way to organize clusters into virtual sub-clusters — they can be helpful when different teams or projects share a Kubernetes cluster. Any number of namespaces are supported within a cluster, each logically separated from others but with the ability to communicate with each other.

Kubernetes starts with four initial namespaces:

1. default The default namespace for objects with no other namespace
2. kube-node-lease This namespace holds Lease objects associated with each node. Node leases allow the kubelet to send heartbeats so that the control plane can detect node failure.
3. kube-public This namespace is created automatically and is readable by all users (including those not authenticated). This namespace is mostly reserved for cluster usage, in case that some resources should be visible and readable publicly throughout the whole cluster. The public aspect of this namespace is only a convention, not a requirement.
4. kube-system The namespace for objects created by the Kubernetes system

# To view namespaces use :
```
kubectl get namespaces
```
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/15df7278-676d-4e3e-9b40-512cb24920b7)

we can also get the summary of a specific namespace using:

```
kubectl get namespaces <name>
```
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/4c273511-f594-4cbf-b1d4-546779166a2e)

Or we can get detailed information with:
```
kubectl describe namespaces <name>
```

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/6e1c7f7b-a276-49d4-841b-72dd1f8b3afd)


# To create New Namespace

Note: Avoid creating namespace with prefix kube-, since it is reserved for Kubernetes system namespaces.

create a new YAML file

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/ebda3df8-962c-428f-81eb-6ca51743613d)

with following contents

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/7b8568ee-51ed-4d08-bf05-fe380d33c99c)

then run ```kubectl create -f <file name>``` to create a new namespace

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/bfc266a7-a814-4307-be6c-e00658178b40)

Let's try to create two additional Kubernetes namespaces to hold our content

Create the development namespace using kubectl:
```
kubectl create -f https://k8s.io/examples/admin/namespace-dev.json
```

And then let's create the production namespace using kubectl:
```
kubectl create -f https://k8s.io/examples/admin/namespace-prod.json
```

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/8b302e73-6479-4923-863b-e405f90aefb1)

Now to create pods in each namespace :

A Kubernetes namespace provides the scope for Pods, Services, and Deployments in the cluster. Users interacting with one namespace do not see the content in another namespace.

let's spin up a simple Deployment and Pods in the development namespace.
```
kubectl create deployment snowflake \
  --image=registry.k8s.io/serve_hostname \
  -n=development --replicas=2
```

We have created a deployment whose replica size is 2 that is running the pod called snowflake with a basic container that serves the hostname.
```
kubectl get deployment -n=development
```

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/0204b145-721f-4b80-805b-7cdcfb85213e)

![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/1de8a1df-33a5-46c7-82a4-b553aa20b5c5)

And this is great, developers are able to do what they want, and they do not have to worry about affecting content in the production namespace.

Let's do same for production namespace as well

The production namespace should be empty, and the following commands should return nothing.
```
kubectl get deployment -n=production
kubectl get pods -n=production
```
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/decceeec-a272-43e1-aa24-47fd1ddddbd3)

Production likes to run cattle, so let's create some cattle pods.
```
kubectl create deployment cattle --image=registry.k8s.io/serve_hostname -n=production
kubectl scale deployment cattle --replicas=3 -n=production
```
```
kubectl get deployment -n=production
```
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/2c432301-4268-4617-ad74-882fc975193b)

```
kubectl get pods -l app=cattle -n=production
```
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/4f235458-796c-4d44-ab6c-ccdb0745b08e)

At this point, it should be clear that the resources users create in one namespace are hidden from the other namespace.


### _Kubernetes namespaces provide a powerful mechanism for logically dividing cluster resources and isolating workloads. They enable teams to manage applications, access control, and resource utilization more effectively within a shared Kubernetes cluster. By segregating resources, namespaces promote better organization, security, and scalability, making them a fundamental component for multi-tenant environments and complex application deployments._

_Submitted by Shiva Kumar Gorasa_






