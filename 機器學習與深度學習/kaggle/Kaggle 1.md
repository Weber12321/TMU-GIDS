### 機器學習與深度學習期中報告 : TMU ML Course Team Battle 1

###### 組別 : 鎮瀾宮的骰子(Feat. 標太郎水餃)

###### 組員 : 黃彥鈞(m947108006)、石家宜(m946108003)、趙上涵(m946108004)

---

1. **資料集**

   IMDb電影評論資料

   | Data     | Label                 |
   | -------- | --------------------- |
   | 影評內文 | 正面(Pos) / 反面(Neg) |

   

2. **競賽結果**

   Public : 0.87298 (Rank 3)

   Private : 0.86924 (Rank 6)

3. **基礎分類模型**

   + 前處理函數

   ```python
   from sklearn.feature_extraction.text import TfidfVectorizer
   from sklearn.model_selection import cross_val_score
   
   tfidf_vectorizer = TfidfVectorizer()
   
   def baseline_model(model, vector, mrdataset, test , sub):
       performance = cross_val_score(model, tfidf_vectorizer.fit_transform(mrdataset.data), mrdataset.target, 
                                    cv=10, scoring='accuracy')
       print("avg-accuracy: {0}".format(performance.mean()))
   
       # test.head()
       x_train = tfidf_vectorizer.fit_transform(mrdataset.data)
       y_train = mrdataset.target
       x_test = tfidf_vectorizer.transform(test.iloc[:,1].values.astype('U'))
   
       model.fit(x_train,y_train)
       y_test = model.predict(x_test)
   
       sub['Label'] = y_test
       sub['Label'].replace([0,1],['neg','pos'], inplace=True)
       
       return sub
   ```

   

   + 模型得分 : 

   | Models                | Cross_validation | Private_scores | Public_scores |
   | --------------------- | ---------------- | -------------- | ------------- |
   | Multinomial NB        | 0.865            | 0.740          | 0.761         |
   | kNN                   | 0.775            | 0.663          | 0.672         |
   | Decision Tree         | 0.704            | -              | -             |
   | Linear Regression     | 0.890            | 0.838          | 0.846         |
   | Random Forest         | 0.739            | 0.706          | 0.691         |
   | SVM (kernel = linear) | 0.896            | 0.846          | 0.859         |
   | SVM ()                |                  |                |               |
   | XGBoost               | 0.808            | 0.874          | 0.864         |

   + 最好的基礎模型 : XGBoost

4. **Dnn & Bert**

   + Dnn

   + Bert

     ![](C:\Users\Weber\Documents\GitHub\TMU-GIDS\機器學習與深度學習\kaggle\Bert_Abstract\Bert_Abstract\0.PNG)

     ![](C:\Users\Weber\Documents\GitHub\TMU-GIDS\機器學習與深度學習\kaggle\Bert_Abstract\Bert_Abstract\1.PNG)

     ![](C:\Users\Weber\Documents\GitHub\TMU-GIDS\機器學習與深度學習\kaggle\Bert_Abstract\Bert_Abstract\2.PNG)

     Bert 結果 : 

     | Model                                 | Private_scores | Public_scores |
     | ------------------------------------- | -------------- | ------------- |
     | bert binary classification (3 epochs) | 0.869          | 0.873         |
     | bert binary classification            | 0.860          | 0.867         |

     

5. **Conclusion**

