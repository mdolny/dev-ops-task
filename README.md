# General
Here are 3 simple tasks that helps You to understand basic scope of daily routines of our Team. Hope you will enjoy.

# Tasks
## Powershell scripting
In this task you are asked to test a bunch of endpoints for a developer. Response should contain list of strings in the format "endpoint_url: (is not) reachable"
Please find the input datasource with endpoints [here](./tasks/powershell/websites.json)

### Answer: 

Powershell versions:
$PSVersionTable.PSVersion.ToString()
5.1.17134.858
$PSVersionTable.PSVersion.ToString()
7.0.3

Please find script [here](./tasks/powershell/endpoint_check.ps1)

## Kubernetes manifests review
In this task you are asked to review the manifgest written by a developer and provide feedback, is it ready for deployment up to Production, if not, what should be corrected.
Please find the deployment manifest [here](./tasks/k8s_manifest/deployment.yml)

### My review: 

Assumptions: 
K8S version 1.17.x
Image changed to nginx:latest

I've run that manifest on test new cluster on spot instances. Manifest work like a charm after change of image and cut of "alpha5" from "apiVersion". As I recall production ready deploymnets should have more than one replica, should use https instead of http, "imagePullPolicy" should be defined. Image url looks like it is from GCR private registry but there is no project test that one I'm sure.


## Faild build review
In this task you are asked to review the failed build screenshot, sent by a developer. Please write an explanation as a feedback why build is failed
Please find the deployment manifest [here](./tasks/failed_build/screenshot.jpg)

### My review: 

You're probably missing some dependencies.

Locate the dependencies you're missing with mvn dependency:tree, then install them manually, and build your project with the -o (offline) option.