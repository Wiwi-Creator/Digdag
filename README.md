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

```
docker build 
```

試run範例的dig檔

``$ digdag init mydag``

``$ cd mydag``

``$ digdag run mydag.dig``
