# 推流服务设置指南

本指南将详细介绍如何通过 `systemd` 服务设置，使两个推流脚本 (`one.sh` 和 `two.sh`) 在系统启动时自动运行。该服务确保脚本在 `livenvr` 服务和网络完全启动后执行。

## 前提条件

- **脚本**：您需要准备好两个推流脚本 (`one.sh` 和 `two.sh`)和两个systemd服务文件（`livenvr.service` 和 `start.service`）。
- **权限**：确保您拥有 `sudo` 权限，以便能够创建和启用系统服务。

---

## 步骤 1：准备脚本
**安装必要工具**
   
   确保安装了 `ffmpeg` 和 `curl`：
   ```bash
   sudo apt update
   sudo apt install ffmpeg curl -y
   ```

**下载脚本文件**  
   
   下载所有文件（这里我是下载到了/home/pc/...下）在保存one.sh和two.sh的文件目录下用终端中运行以下命令：
    ```bash
   sudo./one.sh
   sudo./two.sh
    ```
   在确认可以推流后，用终端中运行以下命令，确保 `one.sh` 和 `two.sh` 具有可执行权限：
   ```bash
   chmod +x /home/pc/one.sh /home/pc/two.sh
   ```

## 步骤2：配置 systemd 服务
   
   创建 start.service 和livenvr.service 文件：
   ```bash
   sudo cp livenvr.service /etc/systemd/system/start.service
   sudo cp start.service /etc/systemd/system/start.service
   ```

   刷新 systemd 配置：
    ```bash
    sudo systemctl daemon-reload
    ```
    
   启用服务
    ```bash
    sudo systemctl enable livenvr.service
    sudo systemctl enable start.service
    ```
    
## 步骤3：验证推流

   **检查日志文件**
   
   做完步骤2后，重启工控机，过一会后，相机会开始推流，推流进度会记录在一下日志文件中：
    -/home/pc/progress1.log
    -/home/pc/progress2.log
    
   您可以使用以下命令查看日志：
   ```bash
   tail -f progress1.log
   tail -f progress2.log
   ```

## 步骤5：管理服务

**停止服务**
    ```bash
    sudo systemctl stop streaming.service
    sudo systemctl stop livenvr.service
    ```
    
**禁用服务**
    ```bash
    sudo systemctl disable streaming.service
    sudo systemctl disable livenvr.service
    ```
    
**重启服务**
    ```bash
    sudo systemctl restart streaming.service
    sudo systemctl restart livenvr.service
    ```
    
**查看服务日志**
    ```bash
    journalctl -u start.service
    journalctl -u livenvr.service
    ```
