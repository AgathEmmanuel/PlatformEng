

# Rancher Desktop 



https://stackoverflow.com/questions/42564058/how-to-use-local-docker-images-with-minikube


# Steps  



```

nerdctl -n k8s.io build -t rentit/post:1.0 .		# this make the image available from rancher cluster  



```



---------- kim is not shiped anymore  
kim  	# Kubernetes Image manager


kim --version
kim image ls
kim image build --tag your/image:tag .



# Links  
[Should We Replace Docker Desktop With Rancher Desktop?](https://youtu.be/bYVfCp9dRTE)
[Rancher Online Meetup - March 2021 - Rancher KIM](https://youtu.be/QsV2IBAGEyY)
[All about Rancher Desktop and Kim](https://youtu.be/NMBzJtSuqDQ)  
[Using Rancher Desktop and Skaffold for Kubernetes Development Workflows](https://youtu.be/0-g0UJ11wt4)  
[https://skaffold.dev/docs/tutorials/custom-builder/](https://skaffold.dev/docs/tutorials/custom-builder/)  
[https://skaffold.dev/docs/pipeline-stages/builders/custom/#dependencies-from-a-command](https://skaffold.dev/docs/pipeline-stages/builders/custom/#dependencies-from-a-command)  
[https://stackoverflow.com/questions/42564058/how-to-use-local-docker-images-with-minikube](https://stackoverflow.com/questions/42564058/how-to-use-local-docker-images-with-minikube)  
[https://www.infracloud.io/blogs/skaffold-usecases/](https://www.infracloud.io/blogs/skaffold-usecases/)  

