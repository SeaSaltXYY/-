# 推流服务设置指南

本指南将详细介绍如何通过 `systemd` 服务设置，使两个推流脚本 (`one.sh` 和 `two.sh`) 在系统启动时自动运行。该服务确保脚本在 `livenvr` 服务和网络完全启动后执行。

## 前提条件

- **脚本**：您需要准备好两个推流脚本 (`one.sh` 和 `two.sh`)。
- **权限**：确保您拥有 `sudo` 权限，以便能够创建和启用系统服务。

---

## 步骤 1：准备脚本

1. **确保脚本可执行**  
   在保存one.sh和two.sh的文件目录下用终端中运行以下命令：
    ```bash
   sudo./one.sh
   sudo./two.sh
   在确认可以推流后，用终端中运行以下命令，确保 `one.sh` 和 `two.sh` 具有可执行权限：
   ```bash
   chmod +x /path/to/one.sh
   chmod +x /path/to/two.sh
