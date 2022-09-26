# Digdag

***
#### Definition :
```markdown

在得到一個資料集，由於是從各個來源的DB的，常常不完整或是髒亂，EX:空值、NULL或重複資料等，
這時候就需要進行的清理與處理，讓資料集更符合所需，進而能夠精確的分析。

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

   [01.Pandas基礎語法統整](https://github.com/Wiwi-Creator/Data_Cleaning/blob/main/Pandas_Basic.ipynb)
   
   [02.Pnadas基礎檔案操作](https://github.com/Wiwi-Creator/Data_Cleaning/blob/main/Read_Csv.ipynb)
   
   [03.Lambda/Apply語法練習](https://github.com/Wiwi-Creator/Data_Cleaning/blob/main/Lambda%E5%92%8CApply.ipynb)
   
