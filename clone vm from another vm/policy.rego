package play

import future.keywords

resource_name = input.type


    
default allow = false

allow {
    root_module_resources_values_disk_size := input.planned_values.root_module.resources[0].values.disk[0].size
    root_module_resources_values_memory := input.planned_values.root_module.resources[0].values.memory
    root_module_resources_values_disk_size == 30
    root_module_resources_values_memory == 4096
}

