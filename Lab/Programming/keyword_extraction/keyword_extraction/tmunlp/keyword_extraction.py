#!/usr/bin/env python
# coding: utf-8


import tmunlp as nlp
import jieba


def get_label_term_weighting(data_filepath, label_list):
    labels = {} # label : freq
    label_wordlist = {}
    dataset = [] # label : text
    jieba.set_dictionary('./dict.txt.big')

    for l in label_list:
        labels[l] = 0
        label_wordlist[l] = dict()


    for data in open(data_filepath).readlines():
        items = data.strip('\n').split("\t")

        if len(items) == 2:
            label = items[0]
            text = items[1]
            seg_content = list(jieba.cut(text, cut_all = False))

            distinct_text = list(set(seg_content)) #distinct the list, but revert the order
            dataset.append([label, distinct_text]) 

            labels[label] += 1

            for word in distinct_text:
                for l in label_list:
                    if word in label_wordlist[l]:
                        label_wordlist[l][word].count_freq()
                    else:
                        label_wordlist[l][word] = nlp.Feature(word)


    label_term_weighting = {}
    for label, num_data_label in labels.items():
        for word in label_wordlist[label]:
            label_wordlist[label][word].reset_info()

        label_term_weighting[label] = nlp.get_term_weighting(label, num_data_label, label_wordlist[label], dataset)  
    
    return label_term_weighting 



def get_keyword(label, label_term_weighting, topN=10):
    keyword_list = {}
    for i in range(len(label_term_weighting[label])):
        if label_term_weighting[label][i][1]._present_on_topic > label_term_weighting[label][i][1]._present_off_topic:
            keyword_list[label_term_weighting[label][i][0]] = label_term_weighting[label][i][1]._llr
        if len(keyword_list) >= topN:
            return keyword_list


