全部安装

```bash
git clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
cd nerd-fonts 
./install.sh
cd ..
rm -rf nerd-fonts
```

### 手动安装
#### 1、从https://github.com/ryanoasis/nerd-fonts.git下载字体文件

#### 2、解压

#### 3、拷贝字体文件到~/.local/share/fonts下

#### 4、运行命令，安装字体

- 生成核心字体信息

  ```bash
  sudo mkfontscale
  ```

- 生成字体文件夹

  ```bash
  sudo mkfontdir
  ```

- 刷新系统字体缓存

  ```bash
  sudo fc-cache -vf ~/.local/share/fonts/
  ```