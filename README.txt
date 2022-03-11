kubernetes cluster Tf files are written with Industry standards and security in mind
This is a regional cluster, which means it will create a node in each zone, by default it will have 3 nodes per Region
This is a private cluster, hence this cluster will not have internet by default, hence need to create ingress(GLB,Nginx ingress or Istio) and egress(NAT) points
there are two node pools in this configuration, make changes as per your requirements
VPC subnets will be created with t
he specified subnets, please change the subnets as needed
NAT gateway tf also exists


IAM Permissions :
  Ensure that the relevant API's are enabled on Google Cloud, before applying the code
  Use service account recommended
  Grant I AM Permissions like GKE Administrator, Network manager, and etc., to create the desired resources
