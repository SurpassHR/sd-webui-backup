# 执行前将id_rsa.pub添加到huggingface仓库公钥
set SD_WEBUI_ROOT=/root/autodl-tmp/sd-webui
# 克隆项目
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui ${SD_WEBUI_ROOT}
# 配置变量
set VENV_ROOT=${SD_WEBUI_ROOT}/venv
set MODEL_ROOT=${SD_WEBUI_ROOT}/models
set MODEL_DIR=${MODEL_ROOT}/Stable-diffusion
set LORA_DIR=${MODEL_ROOT}/Lora
set VAE_DIR=${MODEL_ROOT}/VAE
set SWINIR_DIR=${MODEL_ROOT}/SwinIR
set CODEFORMER_GIT_DIR=${SD_WEBUI_ROOT}/repositories/CodeFormer
set FACELIB_WEIGHT_DIR=${CODEFORMER_GIT_DIR}/weights/facelib
set CODEFORMER_WEIGHT_DIR=${CODEFORMER_GIT_DIR}/weights/CodeFormer
set FACELIB_DIR=${MODEL_ROOT}/facelib
set TURBO=/etc/network_turbo

set LORA_HF_STORE_GIT=git@hf.co:SurpassHR/LoraBackup

# 安装venv
apt install venv
# 安装git-lfs
apt install git-lfs
# 写入命令行参数
set FIRST_START_ARGS="--exit --xformers"
set DEFAULT_START_ARGS="--share --xformers --enable-insecure-extension-access --lora-dir ${LORA_DIR}"
# 第一次启动自动执行安装虚拟环境并退出
source ${TURBO} && ${SD_WEBUI_ROOT}/launch.py ${FIRST_START_ARGS}
# 下载必要插件
git clone https://github.com/hako-mikan/sd-webui-supermerger
git clone https://github.com/AlUlkesh/stable-diffusion-webui-images-browser
git clone https://github.com/kohya-ss/sd-webui-additional-networks
git clone https://github.com/dtlnor/stable-diffusion-webui-localization-zh_CN
git clone https://github.com/DominikDoom/a1111-sd-webui-tagcomplete
git clone https://github.com/a2569875/lora-prompt-tool
# 下载必要模型
source ${TURBO} && wget https://huggingface.co/SurpassHR/ModelBackup/resolve/FantasticMix/FantasticMix.safetensors -O ${MODEL_DIR}/FantasticMix.safetensors
source ${TURBO} && wget https://huggingface.co/SurpassHR/ModelBackup/resolve/Gape/Gape60.safetensors -O ${MODEL_DIR}/Gape60.safetensors
# 下载必要Lora
git clone ${LORA_HF_STORE_GIT} ${LORA_DIR} && cd ${LORA_DIR} && git lfs pull && rm -rf .git && cd -
# 下载必要VAE
wget https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.ckpt -O ${VAE_DIR}/vae-ft-mse-840000-ema-pruned.ckpt
# 下载SwinIR
wget https://github.com/JingyunLiang/SwinIR/releases/download/v0.0/003_realSR_BSRGAN_DFOWMFC_s64w8_SwinIR-L_x4_GAN.pth -O ${SWINIR_DIR}/SwinIR_4x.pth
# 下载脸部修复Coderformer/facelib
wget "https://github.com/sczhou/CodeFormer/releases/download/v0.1.0/detection_Resnet50_Final.pth" -O ${FACELIB_WEIGHT_DIR}/detection_Resnet50_Final.pth
wget "https://github.com/sczhou/CodeFormer/releases/download/v0.1.0/parsing_parsenet.pth" -O ${FACELIB_WEIGHT_DIR}/parsing_parsenet.pth
wget "https://github.com/sczhou/CodeFormer/releases/download/v0.1.0/codeformer.pth" -O ${CODEFORMER_WEIGHT_DIR}/codeformer.pth
