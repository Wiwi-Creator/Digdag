# Digdag

***
#### Definition :
```markdown

Digdag 是一個用來構建、運行、調度和監控複雜的排程管理工具，並可透過其規劃並設計PipeLine。

```
#### Prepare :
```markdown

因為Digdag是透過Java執行，故須先確認是否已安裝JDK8或JDK11。

```
***

#### Building  :
```markdown
On MAC 

```
下載最新版本的Digdag

``curl -o ~/bin/digdag --create-dirs -L "https://dl.digdag.io/digdag-latest"``

調整環境變數

``chmod +x ~/bin/digdag``

``echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc``

試run範例的dig檔

``$ digdag init mydag``

``$ cd mydag``

``$ digdag run mydag.dig``

   [01.設計WorkFlow](https://github.com/Wiwi-Creator/Data_Cleaning/blob/main/Pandas_Basic.ipynb)
   
   [02.操作及特殊指令](https://github.com/Wiwi-Creator/Data_Cleaning/blob/main/Read_Csv.ipynb)
   
   [03.Lambda/Apply語法練習](https://github.com/Wiwi-Creator/Data_Cleaning/blob/main/Lambda%E5%92%8CApply.ipynb)
   
