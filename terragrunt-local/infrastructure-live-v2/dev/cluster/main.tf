module "gcp-clusters" {
    source                        = "../../../infrastructure-modules/gcp-clusters"
    env                           = "prod"
    region                        = "us-east4"
    #kubernetes
    cluster_name                  = "pink-team-prod4"
    zone                          = "us-east4-a"
    networking_mode               = "VPC_NATIVE"



    #node-pools 
    kubernetes_cluster_id         = "google_container_cluster.pink-team-prod1.id"
    node_pool_node_count          = 3
    node_config_disk_size_gb      = 30
}



module "instances" {
    source                              = "../../../infrastructure-modules/instances"
    env                                 = "prod"
    region                              = "us-east4"
    zone                                = "us-east4-a"
    mongo_machine_type                  = "n2-standard-2"
    mongo_image                         = "debian-cloud/debian-11"
    mongo_boot_disk_size_gb             =  15

    postgres_machine_type               = "n2-standard-2"
    postgres_image                      = "debian-cloud/debian-11"
    postgres_boot_disk_size_gb          =  20    
}