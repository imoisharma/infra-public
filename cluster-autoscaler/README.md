## Cluster Autoscaler on AWS EKS
On AWS, Cluster Autoscaler utilizes Amazon EC2 Auto Scaling Groups to manage node groups. Cluster Autoscaler typically runs as a Deployment in your cluster.

## Permissions
Cluster Autoscaler requires the ability to examine and modify EC2 Auto Scaling Groups. It is recommended to use [IAM roles for service accounts](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html).

 IAM roles for service accounts provide the ability to manage credentials for your applications, similar to the way that Amazon EC2 instance profiles provide credentials to Amazon EC2 instances. Instead of creating and distributing your AWS credentials to the containers or using the Amazon EC2 instance's role, you associate an IAM role with a Kubernetes service account and configure your Pods to use the service account.

- Enabling IAM roles for service accounts on your cluster
```sh 
eksctl utils associate-iam-oidc-provider \
    --cluster eksworkshop-eksctl \
    --approve
 ```   

 Creating an IAM policy for your service account that will allow your CA pod to interact with the autoscaling groups.

 ```sh
 {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "autoscaling:DescribeAutoScalingGroups",
                "autoscaling:DescribeAutoScalingInstances",
                "autoscaling:DescribeLaunchConfigurations",
                "autoscaling:DescribeTags",
                "autoscaling:SetDesiredCapacity",
                "autoscaling:TerminateInstanceInAutoScalingGroup",
                "ec2:DescribeLaunchTemplateVersions"
            ],
            "Resource": "*",
            "Effect": "Allow"
        }
    ]
}
 ```

 ```sh
  aws iam create-policy   \
    --policy-name k8s-cluster-autoscaler-asg-policy \
    --policy-document file://~/Development/sharmio/eks-youtube-demo/environment/cluster-autoscaler/ca-iam-policy.json
  ```

## IAM Role
Create an IAM role for the cluster-autoscaler Service Account in the kube-system namespace.

```sh
export AWS_ACCOUNT_ID=""
eksctl create iamserviceaccount \
    --name cluster-autoscaler \
    --namespace kube-system \
    --cluster eksworkshop-eksctl \
    --attach-policy-arn "arn:aws:iam::${AWS_ACCOUNT_ID}:policy/k8s-asg-policy" \
    --approve \
    --override-existing-serviceaccounts
```

Make sure your service account with the ARN of the IAM role is annotated

```sh
kubectl -n kube-system describe sa cluster-autoscaler
```
## Deploy Cluster Autoscaler

Deploy the Cluster Autoscaler to your cluster with the following command:

```sh
kubectl apply -f cluster-autoscaler/cluster-autoscaler-auto-discovery.yaml
```

