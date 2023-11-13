# 使用 Node.js 的官方映像作為基礎
FROM node:18.18.0

# 設置工作目錄
WORKDIR /usr/src/app

# 複製 package.json 與 package-lock.json 以先安装套件
COPY package*.json ./

# 安装 npm 套件
RUN npm install

# 複製所有項目到工作目錄
COPY . .

# 建構 Vite 項目
RUN npm run build

# 暴露應用程式運行的 port
EXPOSE 4173

# 定義啟動命令
CMD [ "npm", "run", "preview" ]
