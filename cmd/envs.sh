#!/bin/bash
# Author: zhoutao
# Date: 2021/6/17 15:33
# Description: My Custom Virtual Environments Manage Script

# 获取 Shell的类型
SHELL_TYPE="${SHELL##*/}"
RCFILE="$HOME/.${SHELL_TYPE}rc"
# 配置环境
ENV_PATH="$HOME/.virtualenvs"
ENV_LIST=$(ls -l $ENV_PATH | awk '/^d/ {print $NF}')


# 重新生成环境变量
refreshEnvs() {
    sed -i '/bin\/activate/d' $RCFILE
    # 获取所有的文件夹
    echo "Total Environments: $(ls -l $ENV_PATH | grep '^d'| wc -l)"
    for name in $(ls -l $ENV_PATH | awk '/^d/ {print $NF}')
    do
        echo "Environments: $name"
        echo "alias $name='source $ENV_PATH/$name/bin/activate'" >> $RCFILE
    done
    source $RCFILE
}


lsEnvs() {
    # 获取所有的文件夹
    echo "Total Environments: $(ls -l $ENV_PATH | grep '^d'| wc -l)"
    for name in $(ls -l $ENV_PATH | awk '/^d/ {print $NF}')
    do
        echo "Environments: $name"
    done
}


contains() {
    array=$1
    var=$2
    echo "${array[@]}" | grep -wq "$var" &&  echo "Yes" && return 1 || (echo "No" && return 0)
}

showTips() {
  echo "Usage: bash envs.sh [args]
    -l/ --list:                         List all virtual environments
    -f/ --fresh:                        Fresh virtual environments
    -a/ --add [environment name]:       Add virtual environment
    -r/ --remove [environment name]:    Delete virtual environment"
}


# 单命令参数
if [[ $# -eq 1 ]]; then
    if [[ $1 == "-f" ]] || [[ $1 == "--fresh" ]]; then
        echo "Fresh Virtual Environments"
        refreshEnvs
    elif [[ $1 == "-l" ]] || [[ $1 == "--list" ]]; then
        lsEnvs
    else
        showTips
    fi
# 两命令参数
elif [[ $# -eq 2 ]]; then
    if [[ $1 == "-r" ]] || [[ $1 == "--remove" ]]; then
        if [[ $(contains "$ENV_LIST" "$2") == "Yes" ]]; then
            echo "Remove Virtual Environment: $2"
            rm -rf "$ENV_PATH/$2"
            refreshEnvs
        else
            echo "$2 Environments is not exist"
        fi
    elif [[ $1 == "-a" ]] || [[ $1 == "--add" ]]; then
        if [[ $(contains "$ENV_LIST" "$2") == "No" ]]; then
            virtualenv $ENV_PATH/$2
            refreshEnvs
        else
            echo "$2 Environments is exists"
        fi
    else
        showTips
    fi
    ENV_LIST=()
else
    showTips
fi
