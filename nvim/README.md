### **nvim**
my nvim config

#### plugins

```text
" 主题
Plug 'crusoexia/vim-monokai'
" 状态栏与标签栏插件，以及状态栏主题插件
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline-themes'
" 多行注释
Plug 'scrooloose/nerdcommenter'
" 嵌套括号的高亮
Plug 'luochen1990/rainbow'
" 树状目录管理
Plug 'preservim/nerdtree'
" 可视化缩进
Plug 'Yggdroot/indentLine'
" python及其他自动提示插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}
```

- crusoexia/vim-monokai

- crusoexia/vim-monokai

- vim-airline/vim-airline-themes

- scrooloose/nerdcommenter

- luochen1990/rainbow

- preservim/nerdtree

- Yggdroot/indentLine

- neoclide/coc.nvim


#### plugins

国内下载github.com的资源比较慢，可以修改plug.vim来使用镜像加速

- Step 1

  ```text
  let fmt = get(g:, 'plug_url_format', 'https://git::@github.com/%s.git')
  
  ->
  
  let fmt = get(g:, 'plug_url_format', 'https://git::@hub.fastgit.org/%s.git')
  ```

- Step 2

  ```text
  let plug.uri = substitute(plug.uri,
      \ '^https://git::@github\.com', 'https://github.com', '')
      
  ->
  
  let plug.uri = substitute(plug.uri,
      \ '^https://git::@hub.fastgit\.org', 'https://hub.fastgit.org', '')
  ```

- Step 3

  ```bash
  # 删除plugged下的文件，重新执行PlugInstall安装插件
  PlugInstall
  ```

  

### nodejs、npm安装配置

```bash
# 下载nodejs
wget https://npm.taobao.org/mirrors/node/v14.16.1/node-v14.16.1-linux-x64.tar.xz
# 创建文件夹
sudo mkdir /usr/local/lib/nodejs
# 解压
sudo tar -xvf node-v14.16.1-linux-x64.tar.xz -C /usr/local/lib/nodejs
# 配置环境变量, 添加到zshrc中
export PATH=$PATH:/usr/local/lib/nodejs/node-v14.16.1-linux-x64/bin
# or
# 或者使用如下的软连接
sudo ln -s /usr/local/lib/nodejs/node-v14.16.1-linux-x64/bin/node /usr/bin/node
sudo ln -s /usr/local/lib/nodejs/node-v14.16.1-linux-x64/bin/npm /usr/bin/npm
sudo ln -s /usr/local/lib/nodejs/node-v14.16.1-linux-x64/bin/npx /usr/bin/npx 

```

