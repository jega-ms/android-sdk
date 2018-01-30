# Docker android-sdk

This repository is used to build the latest Android SDK docker image for docker based deployments.



#Gitlab Android CI & CD example 

##Steps 


* Create a new file .gitlab-ci.yml
* Add the below example 
* Run the pipelines 

```
image: jega/android-sdk:26
 
stages:   
  - build 

build_apk:
	stage: build   
	script:     
		- ./gradlew -p app clean assembleDebug   
	artifacts:     
		paths:     
			- app/build/outputs/

```

# Images List

|  Android SDK  | Tag Name | Link |
----------------|----------|-------
| Android SDK 27 | jega/android-sdk:latest | [latest](https://hub.docker.com/r/jega/android-sdk/tags/)
| Android SDK 26 | jega/android-sdk:26 | [26](https://hub.docker.com/r/jega/android-sdk/tags/)

# Docker Repository 

 [jega/android-sdk](https://hub.docker.com/r/jega/android-sdk/).


