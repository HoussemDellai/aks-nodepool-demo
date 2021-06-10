az aks nodepool add `
    --resource-group aks-cluster `
    --cluster-name aks-cluster `
    --name appsnodepool `
    --node-count 5 `
    --node-vm-size Standard_B2ms `
    --kubernetes-version 1.20.7 `
    --max-pods 30 `
    --priority Regular `
    --zones 3 `
    --mode User

az aks nodepool add `
    --resource-group aks-cluster `
    --cluster-name aks-cluster `
    --name systempool `
    --node-count 3 `
    --node-vm-size Standard_D2s_v4 `
    --kubernetes-version 1.20.7 `
    --max-pods 30 `
    --priority Regular `
    --zones {1, 2, 3}
    --node-taints CriticalAddonsOnly=true:NoSchedule `
    --mode System

# Notes:
# There are multiple options for Nodepool:
# https://docs.microsoft.com/en-us/cli/azure/aks/nodepool?view=azure-cli-latest#az_aks_nodepool_add
#
# --priority { Regular, Spot }    
# --mode { System, User }
# --zones {1, 2, 3}
# --labels 

az aks nodepool add `
    --resource-group aks-cluster `
    --cluster-name aks-cluster `
    --name app2nodepool `
    --node-count 3 `
    --node-vm-size Standard_B2s `
    --node-taints sku=gpu:NoSchedule `
    --no-wait

# Notes:
# Taints (applied on NodePools) is used to deny scheduling Pods without Toleration for this Taint.
# Only Pods with Toleration could be scheduled on this NodePool.
# A taint can only be set for node pools during node pool creation.
#
# Labels could be applied on NodePools during or after creation.
# Pods could use 'nodeSelector' to be scheduled on specific Nodes or NodePools.