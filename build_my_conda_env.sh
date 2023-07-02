# 创建 conda python3.10.6环境
conda create -n newEnv python=3.10.6 -y
# 激活新环境
conda activate newEnv
# 查看 python 是否安装成功
python3.10 --version | grep "Python" && echo "Install OK" || echo "Install Failed"
# 安装依赖
python3.10 -m pip install -U xformers --root-user-action=ignore
# 安装 pytorch1.13.1+cu117
!python3.10 -m pip install /kaggle/input/torch1131-cu117/torch-1.13.1%2Bcu117-cp310-cp310-linux_x86_64.whl --root-user-action=ignore -q > /dev/null 2>&1
# 清理缓存垃圾
!python3.10 -m pip cache purge -q > /dev/null 2>&1
# 克隆项目
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui /root/autodl-tmp/sd-webui
# 克隆插件
git clone https://github.com/hako-mikan/sd-webui-supermerger                   # superMerger
git clone https://github.com/AlUlkesh/stable-diffusion-webui-images-browser    # image browser
git clone https://github.com/kohya-ss/sd-webui-additional-networks             # Lora network
git clone https://github.com/dtlnor/stable-diffusion-webui-localization-zh_CN  # localization
git clone https://github.com/DominikDoom/a1111-sd-webui-tagcomplete            # tag compelete
git clone https://github.com/a2569875/lora-prompt-tool                         # Lora prompt tool
