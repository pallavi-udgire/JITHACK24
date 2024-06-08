from flask import Flask, render_template, request, redirect, url_for, jsonify
import csv
import os
from datetime import datetime
import matplotlib.pyplot as plt
import seaborn as sns

app = Flask(__name__)

# Function to add an expense
def add_expense(category, description, amount):
    date = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    with open('expenses.csv', 'a', newline='') as file:
        writer = csv.writer(file)
        writer.writerow([date, category, description, amount])

# Function to get all expenses
def get_expenses():
    expenses = []
    if os.path.exists('expenses.csv'):
        with open('expenses.csv', 'r') as file:
            reader = csv.reader(file)
            for row in reader:
                expenses.append(row)
    return expenses

# Function to set the budget
def set_budget(amount):
    with open('budget.csv', 'w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow([amount])

# Function to get the budget
def get_budget():
    if not os.path.exists('budget.csv'):
        return 0.0
    with open('budget.csv', 'r') as file:
        reader = csv.reader(file)
        for row in reader:
            return float(row[0])

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/api/expenses', methods=['GET', 'POST'])
def api_expenses():
    if request.method == 'POST':
        category = request.form['category']
        description = request.form['description']
        amount = request.form['amount']
        add_expense(category, description, amount)
        return jsonify({'status': 'success'})
    else:
        expenses = get_expenses()
        total_expenses = sum(float(expense[3]) for expense in expenses)
        budget = get_budget()
        remaining_budget = budget - total_expenses
        return jsonify({
            'expenses': expenses,
            'total_expenses': total_expenses,
            'budget': budget,
            'remaining_budget': remaining_budget
        })

@app.route('/api/budget', methods=['POST'])
def api_budget():
    budget = request.form['budget']
    set_budget(budget)
    return jsonify({'status': 'success'})

@app.route('/visualize')
def visualize():
    expenses = get_expenses()
    dates = [datetime.strptime(expense[0], "%Y-%m-%d %H:%M:%S") for expense in expenses]
    categories = [expense[1] for expense in expenses]
    amounts = [float(expense[3]) for expense in expenses]

    plt.figure(figsize=(10, 6))
    sns.lineplot(x=dates, y=amounts, hue=categories, marker='o')
    plt.title("Expenses Over Time")
    plt.xlabel("Date")
    plt.ylabel("Amount")
    plt.xticks(rotation=45)
    plt.tight_layout()

    image_path = os.path.join('static', 'expense_plot.png')
    plt.savefig(image_path)
    plt.close()

    return render_template('visualize.html', image_url=url_for('static', filename='expense_plot.png'))

if __name__ == '__main__':
    app.run(debug=True)