# rEX: Ransomware Expert System
rEX was developed as part of the coursework for WID2001 - Knowledge Representation and Reasoning taught by Dr Rohana Mahmud at Universiti Malaya.

rEX is a question answering system that aims to improve user's cyber hygiene and knowledge of the threat of ransomware.

On top of providing user's with information about ransomware, it also contains dialog flows to take the user's through hardening their system.
rEX is able to provide user's with advice when creating passwords, guide them on how to check the legitimacy of their software installations as well as
take the user's though a checklist of tasks they need to perform in the unfortunate event that they are hit by ransomware.

## Deployment
A packaged image of the application is available on dockerhub: https://hub.docker.com/repository/docker/jackmin801/rex.

Prerequisites:
1. Docker (You can install docker at https://docs.docker.com/get-docker/)

You can deploy the app using the command below:
```
docker run --name rex --rm -p 8080:80 -d jackmin801/rex
```

The application will then be available at: http://localhost:8080

To stop the application use the command:
```
docker stop rex
```
