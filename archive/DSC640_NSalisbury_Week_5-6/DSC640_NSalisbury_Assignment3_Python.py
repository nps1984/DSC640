""" This file will output 2 charts:
    line chart
    step chart

"""
import sys
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

if __name__ == '__main__':
    expenditures = pd.read_csv('expenditures.txt', sep='\t', lineterminator='\r')
    print(expenditures.head())
