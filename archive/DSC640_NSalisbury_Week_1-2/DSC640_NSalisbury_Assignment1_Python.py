""" This file will output 4 charts:
    bar chart
    stacked bar chart
    pie chart
    donut chart

"""
import sys
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

if __name__ == '__main__':
    hotdog_winners = pd.read_excel('hotdog-contest-winners.xlsm')
    hotdog_winners.rename(columns={'Dogs eaten':'dogs_eaten','New record':'new_record'},inplace=True)

    sns.set(style="whitegrid")

    f, ax = plt.subplots(figsize=(6, 15))
    sns.set_color_codes("pastel")
    ax = sns.barplot(x='dogs_eaten', y='Year', data=hotdog_winners, color='b', orient='h')
    ax.set_xlabel("Hot Dogs Eaten")
    ax.set_ylabel("Contest Year")
    ax.set_title("Hot Dog Eating Contest Winning Numbers")

    hotdog_places = pd.read_excel('hotdog-places.xlsm')
    hotdog_places.rename(index={0: "first", 1: "second", 2: "third"}, inplace=True)
    hotdog_places = hotdog_places.T
    hotdog_places.reset_index(inplace=True)
    hotdog_places.rename(columns={"index": "year"}, inplace=True)

    f2, ax2 = plt.subplots(figsize=(6, 15))
    ax2 = sns.barplot(x='year',y='first',data=hotdog_places, color='b',orient='v', label='First')
    ax2 = sns.barplot(x='year', y='second', data=hotdog_places, color='g',orient='v', label='Second')
    ax2 = sns.barplot(x='year', y='third', data=hotdog_places, color='c', orient='v', label='Third')

    ax2.set_xlabel('Contest Year')
    ax2.set_ylabel('Total Hotdogs Eaten')
    ax2.set_title("Hot Dog Eating Contest Placements")
    ax2.legend(ncol=3, loc="lower right", frameon=True)

    obama_approval = pd.read_excel('obama-approval-ratings.xls')
    avg_approval = obama_approval['Approve'].mean()
    avg_disapproval = obama_approval['Disapprove'].mean()
    avg_none = obama_approval['None'].mean()
    labels = ['Approve','Disapprove','None']
    values = [avg_approval,avg_disapproval,avg_none]

    f3, ax3 = plt.subplots(figsize=(6, 15))
    ax3.pie(values,labels=labels, autopct='%1.1f%%')
    ax3.set_title("Avg Approval Ratings for President Obama")

    f4, ax4 = plt.subplots(figsize=(6, 15))
    my_circle = plt.Circle((0, 0), 0.7, color='white')
    ax4.pie(values, labels=labels, autopct='%1.1f%%')
    p = plt.gcf()
    p.gca().add_artist(my_circle)
    ax4.set_title("Avg Approval Ratings for President Obama")





    plt.show()