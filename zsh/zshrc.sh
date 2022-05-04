# :zh_CN
export LANGUAGE=en_US
export XDG_CONFIG_HOME=$HOME/.config
export ZSHDIR=$XDG_CONFIG_HOME/zsh

# ===== zinit初始化 =====
typeset -A ZINIT=(
    BIN_DIR         $ZSHDIR/zinit/bin
    HOME_DIR        $ZSHDIR/zinit
    COMPINIT_OPTS   -C
)

source $ZSHDIR/zinit/bin/zinit.zsh


# ===== 加载插件 =====
zinit wait="1" lucid from="gitee.com" for \
    ztzztztt/zsh-z

# 自动建议
# zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
# zinit light zsh-users/zsh-autosuggestions
zinit ice lucid wait="0" atload='_zsh_autosuggest_start' from="gitee.com"
zinit light ztzztztt/zsh-autosuggestions

# 语法高亮
# zinit light zdharma/fast-syntax-highlighting 
zinit ice from="gitee.com"
zinit light lomot/fast-syntax-highlighting

# 补全
# zinit ice lucid wait="0"
# zinit light zsh-users/zsh-completions 
zinit ice lucid wait="0" from="gitee.com"
zinit light who7708/zsh-completions

# 加载 OMZ 框架的插件
# 长命令在命令前部添加上sudo，按两次esc
# zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh
zinit snippet 'https://gitee.com/ztzztztt/ohmyzsh/raw/master/plugins/sudo/sudo.plugin.zsh'
    
# ===== (可选)加载了一堆二进制程序 =====
# 加载这些插件，需要使用apt install安装过这些命令
zinit ice from="gitee.com"
zinit light ztzztztt/z-a-bin-gem-node
# 加载exa插件，现代化的ls命令
zinit as="null" wait="1" lucid from="gitee.com" for \
    mv="exa* -> exa" sbin ztzztztt/exa \
    
# 加载exa的补全
zinit ice mv="* -> _exa" as="completion"
zinit snippet 'https://gitee.com/mirrors/exa/raw/master/completions/zsh/_exa'

# 不需要花里胡哨的 ls，我们有更花里胡哨的 exa
DISABLE_LS_COLORS=true
alias ls=exa

# 初始化补全
autoload -Uz compinit; compinit
# zinit 出于效率考虑会截获 compdef 调用，放到最后再统一应用，可以节省不少时间
zinit cdreplay -q


# ===== 加载主题 =====
# 设置主题为p10k
: ${THEME:=agnoster}

case $THEME in
    pure)
		PROMPT=$'\n%F{cyan}❯ %f'
        RPROMPT=""
        zstyle ':prompt:pure:prompt:success' color cyan
        zinit ice lucid wait="!0" pick="async.zsh" src="pure.zsh" atload="prompt_pure_precmd"
        zinit light Aloxaf/pure
        ;;
    p10k)
		# 表示可选参数
        source $XDG_CONFIG_HOME/zsh/p10k.zsh
        zinit ice depth=1
        zinit light romkatv/powerlevel10k
       ;;
    agnoster)
        # 加载Git库文件
        # zinit snippet OMZL::git.zsh
        zinit snippet 'https://gitee.com/ztzztztt/ohmyzsh/raw/master/lib/git.zsh'
        # 加载Git插件文件
        # zinit snippet OMZP::git无法加载，故使用gitee进行下载
        zinit snippet 'https://gitee.com/ztzztztt/ohmyzsh/raw/master/plugins/git/git.plugin.zsh'
        # forget completions provided up to this moment
        zinit cdclear -q 
        setopt promptsubst
        zinit snippet 'https://gitee.com/djdjhdhdjue/agnoster-zsh-theme/raw/master/agnoster.zsh-theme'
        ;;
esac


# local bin
export PATH=$PATH:$HOME/.local/bin

# neovim
alias nv="nvim"




