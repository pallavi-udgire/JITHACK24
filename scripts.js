document.addEventListener('DOMContentLoaded', function () {
    // Load expenses and budget on page load
    loadExpensesAndBudget();

    // Handle budget form submission
    document.getElementById('budget-form').addEventListener('submit', function (event) {
        event.preventDefault();
        const formData = new FormData(this);
        fetch('/api/budget', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                loadExpensesAndBudget();
            }
        });
    });

    // Handle expense form submission
    document.getElementById('expense-form').addEventListener('submit', function (event) {
        event.preventDefault();
        const formData = new FormData(this);
        fetch('/api/expenses', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                loadExpensesAndBudget();
                this.reset();
            }
        });
    });
});

function loadExpensesAndBudget() {
    fetch('/api/expenses')
    .then(response => response.json())
    .then(data => {
        document.getElementById('budget').innerText = data.budget.toFixed(2);
        document.getElementById('total_expenses').innerText = data.total_expenses.toFixed(2);
        document.getElementById('remaining_budget').innerText = data.remaining_budget.toFixed(2);

        const tableBody = document.getElementById('expenses-table-body');
        tableBody.innerHTML = '';
        data.expenses.forEach(expense => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${expense[0]}</td>
                <td>${expense[1]}</td>
                <td>${expense[2]}</td>
                <td>$${parseFloat(expense[3]).toFixed(2)}</td>
            `;
            tableBody.appendChild(row);
        });
    });
}
