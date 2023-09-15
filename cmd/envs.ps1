# Author: zhoutao
# Date: 2021/6/17 15:33
# Description: My Custom Virtual Environments Manage Script

[string] $ROOT_ENV_PATH="D:\devTools\Python\envs"


function showTips($scriptName) {
    "Usage: {0} [args]" -f $scriptName
    "   -l/ --list:                         List all virtual environments"
    "   -f/ --fresh:                        Fresh all virtual environments"
    "   -a/ --add [environment name]:       ADD a virtual environment"
    "   -r/ --remove [environment name]:    Remove a virtual environment"
    "   -e/ --enter [environment name]:     Enter a virtual environment"
    "To Manage Virtual Environments"
}

function showEnvironments([string]$root){
    # 虚拟环境的根路径是否存在，不存在则输出不存在的提�?
    if (!(Test-Path $root -pathType container)){
        "Virtual Environments Root Dir is not exists: {0}" -f $root
    } else {
        # 只获取文件夹的列�? ?{$_.PsIsContainer -eq $true} 判断是否为文件夹，Select-Object -ExpandProperty Name 只提取文件夹的名�?
        $ENV_LIST = @(Get-ChildItem $root | ?{$_.PsIsContainer -eq $true} | Select-Object -ExpandProperty Name)
        "Total Environments: {0}" -f $ENV_LIST.length
        foreach ($venvs in $ENV_LIST) {
           "Environments: {0}" -f $venvs
        }
    }
}

function addEnvironment([string]$root, [string]$name){
    # 虚拟环境的根路径是否存在，不存在则输出不存在的提�?
    if (!(Test-Path $root -pathType container)){
        "Virtual Environments Root Dir is not exists: {0}" -f $root
    } else {
        $ENV_LIST = @(Get-ChildItem $root | ?{$_.PsIsContainer -eq $true} | Select-Object -ExpandProperty Name)
        # 需要创建的虚拟环境名称是否为空
        if ([String]::IsNullOrEmpty($name)){
            "Create Virtual Environments Name is Null, Please Check the Virtual Environments Name"
        # 需要创建的虚拟环境是否存在
        } elseif ($ENV_LIST -contains $name) {
            "Create Virtual Environments Name is exists, Please Check the Virtual Environments Name"
        } else {
            virtualenv $root\$name
            "Create {0} Virtual Environment success" -f $name
        }
    }
}

function removeEnvironment($root, $name){
    # 虚拟环境的根路径是否存在，不存在则输出不存在的提�?
    if (!(Test-Path $root -pathType container)){
        "Virtual Environments Root Dir is not exists: {0}" -f $root
    } else {
        $ENV_LIST = @(Get-ChildItem $root | ?{$_.PsIsContainer -eq $true} | Select-Object -ExpandProperty Name)
        # 需要删除的虚拟环境名称是否为空
        if ([String]::IsNullOrEmpty($name)){
            "Delete Virtual Environments Name is Null, Please Check the Virtual Environments Name"
        # 需要删除的虚拟环境是否不存�?
        } elseif (!($ENV_LIST -contains $name)) {
            "Delete Virtual Environments Name is not exists, Please Check the Virtual Environments Name"
        } else {
            Remove-Item -Path $root\$name -Recurse
            "Delete {0} Virtual Environment success" -f $name
        }
    }
}

function enterEnvironment($root, $name){
    # 虚拟环境的根路径是否存在，不存在则输出不存在的提�?
    if (!(Test-Path $root -pathType container)){
        "Virtual Environments Root Dir is not exists: {0}" -f $root
    } else {
        $ENV_LIST = @(Get-ChildItem $root | ?{$_.PsIsContainer -eq $true} | Select-Object -ExpandProperty Name)
        # 需要删除的虚拟环境名称是否为空
        if ([String]::IsNullOrEmpty($name)){
            "Delete Virtual Environments Name is Null, Please Check the Virtual Environments Name"
        # 需要删除的虚拟环境是否不存�?
        } elseif (!($ENV_LIST -contains $name)) {
            "Delete Virtual Environments Name is not exists, Please Check the Virtual Environments Name"
        } else {
            # 保留当前的环境路�?
            $local = Get-Location
            # 生成需要进入虚拟环境的路径
            $dest = "{0}\{1}" -f $root, $name
            # 进入虚拟环境�?
            Set-Location $dest
            .\Scripts\activate
            # 返回先前的路�?
            Set-Location $local
        }
    }
}

if ([String]::IsNullOrEmpty($args[0])){
    showTips($MyInvocation.MyCommand.Definition)
} elseif ($args[0] -eq "-l" -or $args[0] -eq "--list"){
    showEnvironments($ROOT_ENV_PATH)
} elseif ($args[0] -eq "-f" -or $args[0] -eq "--fresh"){
    "Fresh Virtual Environments Not Completed"
} elseif ($args[0] -eq "-a" -or $args[0] -eq "--add"){
    addEnvironment($ROOT_ENV_PATH) ($args[1])
    showEnvironments($ROOT_ENV_PATH)
} elseif ($args[0] -eq "-r" -or $args[0] -eq "--remove"){
    removeEnvironment($ROOT_ENV_PATH) ($args[1])
    showEnvironments($ROOT_ENV_PATH)
} elseif ($args[0] -eq "-e" -or $args[0] -eq "--enter"){
    enterEnvironment($ROOT_ENV_PATH) ($args[1])
} else {
    showTips($MyInvocation.MyCommand.Definition)
}
