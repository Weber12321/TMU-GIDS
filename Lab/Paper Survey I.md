## PAWS-X: A Cross-lingual Adversarial Dataset for Paraphrase Identiﬁcation

###### 黃彥鈞(Weber Huang)



> 這是一篇關於評估模型之跨語言同意識別技術的文獻探討
>
> 論文原址 : https://arxiv.org/pdf/1908.11828.pdf



## 研究背景

###### 為何 PAWS-X ?

+ **Google 資料科學研究團隊**認為更多元、更龐大的語料庫將有助於解決NLP於現今應用之難題，於2019年1月提出用於英語語料庫**PAWS(Paraphrase Adversaries from Word Scrambling)**，自**維基百科**和**Quora**具挑戰性的英語複述識別(Paraphrase Identification)語料對所組成。

+ PAWS特色，包含字詞重疊性高、語意相近的**對立式複述識別語料(Adversarial Paraphrase Identification)**。

+ 對立式複述識別語料例子 :  _flights from New York to Florida_  vs  _flights from Florida to New York_

+ 對立式語料引入訓練資料集，調出自然語言處理模型截至目前之不足，以應用層面來說，例如 : 問答(QA)、文字蘊含(TE)以及文本分類等。許多關於對立式語料的研究指出，在資料集中加入對立式語料，將使建模更為清楚並為模型提供更多優化的空間。 

	

  以往研究多著眼於英語，對於現行模型，對立式語料所強調它們的問題普遍存於多個語言。截至目前的多語言語料訓練集，比如 [Multi30K](https://arxiv.org/abs/1605.00459) 與 [Opusparcus](https://arxiv.org/abs/1809.06142) 外語資料均缺乏「對立式語料」，此將限縮了更進一步衡量模型之優化基準。

  
  
  > #### 缺乏高品質之跨語言對立式複述識別語料，將限縮自然語言處理建模再優化之基準。




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
  
+ 獲得各個語言人工翻譯語料資料(共約48,000筆) 。隨機取樣的樣本集由另外的工作人員(非原始翻譯人員)執行並驗證，最終語料資料被保證字級錯誤率低於 5%。這些資料被拆為開發和測試集各2000對語料資料。(基於研究時間與經費限制，無法人工翻譯所有 PAWS 原來的開發與測試資料)

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

    > #### 研究目標 : PAWS-X 的目標是探究模型在多語言環境中捕獲語意結構和上下文的能力。

## 研究

###### 評估模型
+ 模型選擇上，研究團隊選擇三個目前具有不同表現能力的模型 -- BOW, ESIM, BERT
  + **BOW(Bag-of-words) with COS similarity** : 使用unigram到bigram 切詞編碼作為輸入特徵，並以大於 0.5 餘弦值做為同義。
  
    > unigram 為單字元單位 bigram 為雙字元單位 trigram 為三字元單位
  
  + **ESIM(Enhanced Sequential Inference Model)** : 使用 BiLSTM(Bi-directional Long Short-Term Memory) 對每一個句子進行編碼，將編碼的訊息透過前饋層(feed-forward layer)進行分類傳遞，多的layer讓ESIM可以比餘弦相似(COS similarity) 捕捉更多句子間的交互關係。
  
    > BiLSTM : 雙向Long Short-Term Memory(LSTM)，由前向與後向LSTM模型併接而成。LSTM屬於RNN模型的其中一種，由於其設計的特點，非常適合用於對時序數據的建模，如文本數據。
    >
    > Feed-forward NN : 前饋神經網絡是一個人工神經網絡，並且是沒有循環的單向傳播，是最簡單的人工神經網絡。
  
  + **BERT(Bidirectional Encoder Representations from Transformers)** 
  
    > 最近在十一種語言自然語言處理任務取得最新的成果。
  
+ 評估所有模型的策略有

  + Translate Train : 將英語訓練資料翻譯為每一種目標語言作為訓練之資料集。
  
  + Translate Test : 使用英語資料訓練模型，然後將所有測試資料機器翻譯為英語進行評估。
  
+ 多語言BERT是受104種語言所訓練出的單一模型，因此可以進行跨語言訓練。 
  
  + Zero shot : 該模型在PAWS資料集上進行訓練，並直接應用於評估多語言資料，此策略不進行任何機器翻譯。
  
  +   Merged : 在所有語言上訓練多語言模型，包括英語以及其餘機器翻譯語言資料。

+ 表三，說明關於三個模型在 Non-local context 與 support cross-sentential word interaction上之表現結果，且些策略被用於評估哪些模型。

  ![表三](C:\Users\doudi\OneDrive\Documents\TMU-GIDS\Lab\Capture3.PNG)
###### 流程設計與結果
+ 研究團隊使用12層、預設32 size、learning rate 1e-5 的多語言BERT。關於BOW 與 ESIM ，團隊使用[fasttext.cc](https://fasttext.cc/) 之下 300維度詞彙向量實作，並允許訓練中對詞向量做 fine-tuning。

+ 評估指標有 Accuracy 與 AUC-PR(area-under-curve scores of precision-recall curves)

  + 對BERT來說，陽性類別的機率分數用於計算AUC-PR
  + BOW 與 ESIM，餘弦臨界值 0.5 用來計算 Accuracy

  > AUC-PR : PR 曲線下面積指標。
  >
  > AUC is equal to the probability that a classifier will rank a randomly chosen positive instance higher than a randomly chosen negative one。
  >
  > 在比較不同的分類模型時，可以將每個模型的曲線都畫出來，比較曲線下面積做為模型優劣的指標。

+ 對所有實驗來說，根據開發集的準確性選擇最佳的模型檢查點，並根據測試集報告結果。表四、表五，分別為各個語言和每個語言平均之三模型實驗結果 Accuracy 與 AUC-PR 分數 : 

  + 根據 Translate Train 與 Trainslate Test，BERT 每種語言準確性始終高於 BOW 與 ESIM (>15% accuracy)
  + BERT 的 Translate Train 平均 Accuracy 高20%
  + 結果表明，PAWS-X有效地測量了模型對單詞順序和句法結構的敏感度(sensitivity)。

![表四](C:\Users\doudi\OneDrive\Documents\TMU-GIDS\Lab\Capture4.PNG)

![表五](C:\Users\doudi\OneDrive\Documents\TMU-GIDS\Lab\Capture5.PNG)

+ 根據表四、表五，從 BERT 中我們可以看出，Zero-shot 表現最差，可見機器翻譯資料在多語言情境下有幫助的。而 Merged 綜合表現最好。

+ BERT 與 ESIM 在 Translate Train 與 Translate Test 結果模式不同 (Translate Train 在 BERT 上表現較好；而 ESIM 相反)，這可能因為 BERT 針對一百多種語言的預訓練，因此 BERT，相較於 ESIM，為非英語語言提供比較好的出發點。

  > Which relies on fastText embeddings

+ BERT  針對英語訓練和多語訓練結果上差異上，相比 ESIM 較小。

+ 語言差異上，印歐語系語言(德語、西班牙語、法語)表現相較於東亞語言(華語、日語、韓語)來的好，此結果於 Zero-shot 最為明顯。造成差異可能在於 :

  + 團隊使用的機器翻譯系統於印歐語系語言表現比較好。
  + 相較於印歐語系，東亞語言語英語關係較遠。例如，英語的單詞 _Slovak_，德語翻譯為 _Slovake_，與華語_斯洛伐克_相比，相差比較遠。這現象也解釋為何 Zero-shot 差異最為明顯。


+ 錯誤分析 : 
	
	+ 為了評估每個案例最佳模型(BERT merged)難度，表六顯示基於在測試集中為同一對資料，多少種語言分配了正確標籤的數量。61.7% 資料在所有語言中均正確，有 32 個案例在每種語言都錯誤，其中大部分艱澀且模冷兩可的資料，有些有不正確的標記，或於原始 PAWS 錯誤產出。其中一些可能由實體翻譯造成。
	
	  ![表六](C:\Users\doudi\OneDrive\Documents\TMU-GIDS\Lab\Capture6.PNG)

## 結論

Google 團隊介紹了挑戰性的同判別資料集 PAWS-X，其中含括 23,659 筆人工翻譯評估資料 。實驗結果表明，PAWS-X有效地測量了模型對單詞順序的敏感性以及跨語言學習方法的有效性。 作為具挑戰性的判別基準，PAWS-X 為推展多語言同義判別問題研究上，留下了很大的發展空間。



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

https://www.jiqizhixin.com/articles/2018-10-24-13

https://blog.csdn.net/jk981811667/article/details/78891827

https://fasttext.cc/

https://zhuanlan.zhihu.com/p/33445105

[https://zh.wikipedia.org/wiki/ROC%E6%9B%B2%E7%BA%BF#%E6%9B%B2%E7%B7%9A%E4%B8%8B%E9%9D%A2%E7%A9%8D%EF%BC%88AUC%EF%BC%89](https://zh.wikipedia.org/wiki/ROC曲线#曲線下面積（AUC）)



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
+ Non-local context? support cross-sentential word interaction? 
