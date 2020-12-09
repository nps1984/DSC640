""" This file will output 2 charts:
    line chart
    step chart

"""
import sys
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

if __name__ == '__main__':
    world_pop = pd.read_excel('world-population.xlsm')
    sns.set(style="white")

    f, ax = plt.subplots(figsize=(6, 15))
    sns.set_color_codes("pastel")
    ax = sns.lineplot(x=world_pop['Year'], y=round(world_pop['Population']/1000000000,2), color='b')
    ax.set_xlabel("Year")
    ax.set_ylabel("World Population (in billions)")
    ax.set_title("World Population By Year")

    f2, ax2 = plt.subplots(figsize=(6, 15))
    sns.set_color_codes("pastel")
    #ax2 = sns.lineplot(x=world_pop[world_pop['Year'] % 5 == 0]['Year'],
    #                   y=round(world_pop[world_pop['Year'] % 5 == 0]['Population'] / 1000000000, 2),
    #                   color='b', drawstyle='steps-pre')

    ax2 = sns.lineplot(x=world_pop['Year'],
                       y=round(world_pop['Population'] / 1000000000, 2),
                       color='b', drawstyle='steps-pre')
    ax2.set_xlabel("Year")
    ax2.set_ylabel("World Population (in billions)")
    ax2.set_title("World Population By Year")

    plt.show()