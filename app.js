const express = require('express');
const app = express();
const port = 3001;

app.use(express.static('public'));

let transactions = [];

function addTransaction() {
  const desc = document.getElementById("desc").value;
  const amount = parseFloat(document.getElementById("amount").value);

  if (!desc || isNaN(amount)) {
    alert("Please enter valid description and amount.");
    return;
  }

  transactions.push({ desc, amount });
  document.getElementById("desc").value = "";
  document.getElementById("amount").value = "";
  renderTransactions();
}

function renderTransactions() {
  const list = document.getElementById("transaction-list");
  list.innerHTML = "";

  let income = 0;
  let expense = 0;

  transactions.forEach((tx) => {
    const li = document.createElement("li");
    li.className = tx.amount >= 0 ? "income" : "expense";
    li.innerHTML = `${tx.desc} <span>₹${tx.amount}</span>`;
    list.appendChild(li);

    if (tx.amount >= 0) {
      income += tx.amount;
    } else {
      expense += Math.abs(tx.amount);
    }
  });

  const balance = income - expense;
  document.getElementById("balance").textContent = balance;
  document.getElementById("income").textContent = income;
  document.getElementById("expense").textContent = expense;
}

app.listen(port, () => {
  console.log(`App running at http://localhost:${port}`);
});
