# cyderesCI-CD
Project: Containerized Web App Deployment Using AWS ECS Fargate & CodePipeline
This project sets up a fully automated CI/CD pipeline that builds and deploys a simple web application using AWS services. The application consists of a static index.html file served through a Dockerized container. The source code is managed in a public GitHub repository and includes a Dockerfile and a buildspec.yml for the build process.

**Tech Stack**
AWS CodePipeline – Orchestrates the CI/CD flow

AWS CodeBuild – Builds and pushes the Docker image

Amazon ECR – Stores the Docker images

Amazon ECS (Fargate) – Deploys and runs the container

**GitHub** – Source control (public repo)

** CI/CD Workflow Overview**
**Source**  CI/CD Integration with the git repository to deploy resources - used GITHUB REPO INSTEAD OF CODECOMMIT TO GET BONUS POINTS..
The pipeline is triggered whenever changes are pushed to the GitHub repository.

**Build**
AWS CodeBuild uses the buildspec.yml to:

Authenticate with Amazon ECR

Build the Docker image using the Dockerfile

Push the image to the ECR repository aws-ecs-docker

**Deploy**
CodePipeline detects the new image in ECR and deploys it to Amazon ECS, specifically to the service cyderes-project-service running on the ECS cluster cyderes-cluster2.

I chose to use AWS Fargate for this deployment, which means I didn’t need to provision or manage any EC2 instances—Fargate handles all the server infrastructure behind the scenes. It simplifies deployment and scales automatically based on traffic, which is ideal for lightweight, containerized applications like this one.

**Why I Chose ECS with Fargate over EKS**
While EKS (Elastic Kubernetes Service) is a powerful and flexible option for running containers, I deliberately chose ECS with Fargate for this project because:

**Ease of Use:** ECS with Fargate removes the need to manage servers or cluster components. Unlike EKS, there’s no control plane to configure or maintain.

**Faster Setup:** ECS and Fargate are quicker to set up and deploy when compared to spinning up a Kubernetes cluster.

**Cost Efficiency:** For small projects and low-to-medium workloads, Fargate is often more cost-effective, especially since you're only billed for the resources your containers actually use.

Tight AWS Integration: Since all components—ECS, ECR, CodeBuild, and CodePipeline—are AWS-native, the integration is smooth, secure, and doesn’t require custom plugins or tools.

EKS is great for complex use cases that require advanced orchestration, but for this project, ECS + Fargate was more than enough and significantly reduced operational overhead.

** Why I Went with AWS Native CI/CD Tools Instead of Open Source**
There are plenty of great open-source CI/CD tools like Jenkins, GitLab CI, or ArgoCD. But for this setup, I chose AWS CodePipeline and CodeBuild because:

**No Infrastructure to Manage:** These services are fully managed. I didn’t have to worry about setting up Jenkins servers or CI runners.

**Quick to Implement:** The integration with GitHub, ECR, and ECS is seamless and took less time to wire up compared to setting up open-source tools.

**Secure by Default:** IAM roles and built-in encryption made it easier to manage security without writing custom scripts.

**Scalable and Reliable:** CodeBuild automatically scales depending on the workload, and CodePipeline provides a clear, visual representation of the CI/CD flow.

Best for AWS Workloads: Since this project was fully hosted on AWS, using AWS-native tools was the natural fit and allowed everything to stay in the same ecosystem.

**Final Thoughts**
This project demonstrates how to build a simple, yet powerful CI/CD pipeline using fully managed AWS services. By using ECS with Fargate, I avoided the overhead of managing infrastructure while ensuring high availability and scalability. Leveraging CodeBuild and CodePipeline simplified the deployment flow and allowed me to focus more on the application logic and less on setup.

I will be attaching screenshots of all the CI/CD pipeline stages in seperate folder and build executions, along with the corresponding AWS CLI commands screenshots used to retrieve details of ECS resources such as tasks, services, and cluster information after a successful deployment. Since this setup uses Amazon ECS (not Kubernetes-native), I’ve used AWS CLI instead of kubectl to meet the expected output requirements of the coding assignment.


