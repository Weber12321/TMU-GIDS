## How to setup R in Jupyter notebook

1. In R studio : 

   ```r
   install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'devtools', 'uuid', 'digest')) 
   devtools::install_github('IRkernel/IRkernel')
   ```

   

2. Anaconda Prompt : 

   ```
   > cd "C:\Program Files\R\R-3.4.1\bin"
   > R.exe
   > IRkernel::installspec()
   > q()
   ```

   

3. That's it !!

4. Open Jupyter notebook and select R.

   ![](C:\Users\Weber\Documents\GitHub\TMU-GIDS\大數據統計與預測\Capture.PNG)