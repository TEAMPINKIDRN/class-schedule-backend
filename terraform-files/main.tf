        
module "gcp-clusters" {
    source                        = "git::git@github.com:IaKoval/terraform-modules.git//modules/gcp-clusters"
    env                           = "prod"
    region                        = "us-central1"
    #kubernetes
    cluster_name                  = "pink-team-prod6"
    zone                          = "us-central1-c"
    networking_mode               = "VPC_NATIVE"
    cluster_secondary_range_name  = "k8s-pod-range"
    services_secondary_range_name = "k8s-service-range"

    #subnets
    enable_private_nodes          = true
    enable_private_endpoint       = false
    master_ipv4_cidr_block        = "172.16.0.0/28"
    k8s_pod_range_cidr            = "10.48.0.0/14"
    k8s_service_range_cidr        = "10.52.0.0/20"
    subnet_ip_cidr_range          = "10.0.0.0/24"

    #vpc
    network_name                  = "main"

    #node-pools 
    kubernetes_cluster_id         = "google_container_cluster.pink-team-prod1.id"
    node_pool_node_count          = 3
    node_config_disk_size_gb      = 30
}

module "gcp-clusters-stage" {
    source                        = "git::git@github.com:IaKoval/terraform-modules.git//modules/gcp-clusters"
    env                           = "stage"
    region                        = "us-east4"
    #kubernetes
    cluster_name                  = "pink-team-stage"
    zone                          = "us-east4-a"
    networking_mode               = "VPC_NATIVE"
    cluster_secondary_range_name  = "k8s-pod-range"
    services_secondary_range_name = "k8s-service-range"

    #subnets
    enable_private_nodes          = true
    enable_private_endpoint       = false
    master_ipv4_cidr_block        = "172.50.0.0/28"
    k8s_pod_range_cidr            = "10.100.0.0/14"
    k8s_service_range_cidr        = "10.80.0.0/20"
    subnet_ip_cidr_range          = "10.5.0.0/24"

    #vpc
    network_name                  = "main"

    #node-pools 
    kubernetes_cluster_id         = "google_container_cluster.pink-team-prod1.id"
    node_pool_node_count          = 2
    node_config_disk_size_gb      = 30
}
