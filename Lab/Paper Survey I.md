## PAWS-X: A Cross-lingual Adversarial Dataset for Paraphrase Identiﬁcation

###### 黃彥鈞(Weber Huang)



> 這是一篇關於評估模型之跨語言同意識別技術的文獻探討
>
> 論文原址 : https://arxiv.org/pdf/1908.11828.pdf



## 研究背景

###### 為何 PAWS-X ?

+ **Google 資料科學研究團隊**認為更多元、更龐大的語料庫將有助於解決NLP於現今應用之難題，於2019年1月提出用於英語語料庫**PAWS(Paraphrase Adversaries from Word Scrambling)**，自**維基百科**和**Quora**具挑戰性的英語同義識別(Paraphrase Identification)語料對所組成。

+ PAWS特色，包含字詞重疊性高、語意相近的**對立式同義識別語料(Adversarial Paraphrase Identification)**。

+ 對立式同義識別語料例子 :  _flights from New York to Florida_  vs  _flights from Florida to New York_

+ 對立式語料引入訓練資料集，調出自然語言處理模型截至目前之不足，以應用層面來說，例如 : 問答(QA)、文字蘊含(TE)以及文本分類等。許多關於對立式語料的研究指出，在資料集中加入對立式語料，將使建模更為清楚並為模型提供更多優化的空間。 

	

  以往研究多著眼於英語，對於現行模型，對立式語料所強調它們的問題普遍存於多個語言。截至目前的多語言語料訓練集，比如 [Multi30K](https://arxiv.org/abs/1605.00459) 與 [Opusparcus](https://arxiv.org/abs/1809.06142) 外語資料均缺乏「對立式語料」，此將限縮了更進一步衡量模型之優化基準。

  
  
  > #### 缺乏高品質之跨語言對立式同義識別語料，將限縮自然語言處理建模再優化之基準。




## 資料
###### 何謂 PAWS-X ?

+ 要補足目前所面臨不足，Google資料科學團隊提出一個基於PAWS上維基百科的語料，所衍生的跨六種語言(英、法、西、德、中、日、韓)之新語料資料 **PAWS-X(Cross-lingual Adversarial Dataset for Paraphrase Identification)**。這個語料庫包含各個語言 **23,659 ** 對的人工翻譯之範例對立式語料，以及其複述判斷資料。
+ 如以往的多語言資料集，Google資料科學團機器翻譯PAWS維基百科裡 **49,401** 對資料，翻譯資料仍有對立式資料高度重疊與相似語意標籤之特性，所以保留了偵測模型上下文結構之敏感能力。並且，團隊將這些多語言資料機器翻譯回英文，進一步評估這種「先翻譯後預測」策略之基準性能。
+ PAW-X 語料資料集，包含人工翻譯與機器翻譯語料對資料，目前都能能在 https://github.com/google-research-datasets/paws. 免費下載。
+ Google資料科學團隊的研究顯示，PAW-X 能有效的檢測出模型的多語言適應性，以及它們抓出上下文與單詞順序的能力如何。例如 : 
	+ 最新的多語言模型BERT，比詞袋模型BOW的準確性高了32％。
	+ 團隊指出機器翻譯相較 **零樣本策略(zero-shot strategy)** 來的更好。
	+ 模型運行德語、法語、西班牙語所得出的結果優於華語、日語、韓語。

###### PAW-X 語料庫
+ PAW-X 語料庫創造之主要流程，在於將原始 PAWS 語料庫的維基百科語料對資料，由英語翻譯為其他六種語言(英、法、西、德、中、日、韓)。

+ 因此，研究團隊聘請專家來翻譯開發和測試集，並使用神經機器翻譯（NMT）來翻譯訓練集。團隊選擇翻譯，而不是對其他語言重複使用 PAWS 資料生成方法。有三個優點在 : 
  + 人工翻譯不需要高質量的多語言詞性標註器(POS)或命名實體識別器(Named Entity Recognizer)。
  + 翻譯專家較能在產出目標句子同時保留原意，從而確保資料高品質。
  + 由於所有語言語料都是從相同的來源翻譯的，因此所得資料可以為跨語言翻譯提供新的測試平台。例如，PAWS-X 可用於評估德語或法語句子是中文還是日語的同義詞。
  
  ###### 翻譯評估資料
  
+ 研究團隊從各個人工翻譯語料資料(每個語言約48,000筆) 中產出各4000對隨機樣本。隨機取樣的樣本集由另外的工作人員(非原始翻譯人員)執行並驗證，最終語料資料被保證字級錯誤率低於 5%。這些資料被拆為開發和測試集各2000對語料資料。(基於研究時間與經費限制，無法人工翻譯所有 PAWS 原來的開發與測試資料)

+ 資料集裡，每一條成對句子都是各自獨立，並不會受上下文影響，不過在初步研究中，研究團隊發現有時內文實體提及方式(Entity mention)很難被翻譯(見表一)，每一位翻譯專家翻譯時都會受各自背景知識與見解所影響。
  + 實體提及方式例子 : 台大 乃 國立臺灣大學 的實體提及方式  

  ![表一](C:\Users\doudi\OneDrive\Documents\TMU-GIDS\Lab\Capture.PNG)

  ###### 語料庫結論

+ 由於資料不完整或語意模稜兩可，少數資料無法被翻譯(人工翻譯結果，見表二)，這些資料可能在 PAWS 資料對之產出時被創造出來，比例上不超過2%，所以直接排除。

  + 無法翻譯句子，如 : It said that Easipower was, 和 Park Green took over No.

    ![表二](C:\Users\doudi\OneDrive\Documents\TMU-GIDS\Lab\Capture2.PNG)
  
+ 研究團隊進一步對開發集與測試集分別給每一種語言做抽樣(各語言10對資料)，驗證其翻譯品質。

+ 最後，再將 PAWS 原始的標籤 (同義或不同義) 帶入翻譯語料資料集裡面。開發集共有 44.0% 同義資料，測試集有 45.4% 同義資料，此結果與 PAWS 標籤分布情況相近。

+ 翻譯資料為同義驗證任務帶來新的挑戰，一個資料實體可能被翻譯為不同的詞，如 Slovak 與 Slowake (見表一)，模型必須辨識出這些實體提及所屬相同。

	
	
	> #### PAWS-X 資料翻譯為同義驗證任務帶來新的挑戰，一個資料實體可能被翻譯為不同的詞，模型必須辨識出這些實體提及所屬相同。






## 研究

###### 評估模型
+ 
###### 實驗流程與結果
+ 


+ BOW (Bag of the word)
+ ESIM (Enhanced Sequential Inference Model)
+ BERT (Bidirectional Encoder Representations)

## 結論



## 後記





## 參考資源

https://ai.googleblog.com/2019/10/releasing-paws-and-paws-x-two-new.html

[https://medium.com/@cyeninesky3/attention-is-all-you-need-%E5%9F%BA%E6%96%BC%E6%B3%A8%E6%84%8F%E5%8A%9B%E6%A9%9F%E5%88%B6%E7%9A%84%E6%A9%9F%E5%99%A8%E7%BF%BB%E8%AD%AF%E6%A8%A1%E5%9E%8B-dcc12d251449](https://medium.com/@cyeninesky3/attention-is-all-you-need-基於注意力機制的機器翻譯模型-dcc12d251449)

http://www.atyun.com/45343.html

https://zhuanlan.zhihu.com/p/47580077

https://ckip.iis.sinica.edu.tw/project/coreference/

https://leemeng.tw/attack_on_bert_transfer_learning_in_nlp.html

https://www.jishuwen.com/d/2C3l/zh-hk

https://kknews.cc/zh-tw/science/bakyzj6.html

http://terms.naer.edu.tw/detail/1678982/

[https://1fly2sky.wordpress.com/2016/04/02/%E5%91%BD%E5%90%8D%E5%AF%A6%E9%AB%94%E8%AD%98%E5%88%A5%E6%8A%80%E8%A1%93named-entity-recognition/](https://1fly2sky.wordpress.com/2016/04/02/命名實體識別技術named-entity-recognition/)

http://terms.naer.edu.tw/detail/1678982/





---

###### 以下問題待釐清 :

+ 零樣本學習(ZSL)
  + https://www.jishuwen.com/d/2C3l/zh-hk
  + https://kknews.cc/zh-tw/science/bakyzj6.html
+ PAWS 資料生成方法?
+ 詞性標註器(POS)
  + http://terms.naer.edu.tw/detail/1678982/
+ 實體識別器
	+ [https://1fly2sky.wordpress.com/2016/04/02/%E5%91%BD%E5%90%8D%E5%AF%A6%E9%AB%94%E8%AD%98%E5%88%A5%E6%8A%80%E8%A1%93named-entity-recognition/](https://1fly2sky.wordpress.com/2016/04/02/命名實體識別技術named-entity-recognition/)
	+ 實體提及(entity mention)
	  + 例如，台大、公館公園、杜鵑花大學 之於 國立臺灣大學
+ BERT
	+ Merges
+ Accuracy vs Area-under-curve scores of precision-recall curves (AUC-PR)
