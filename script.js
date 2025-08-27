function getData(key) {
  return JSON.parse(localStorage.getItem(key) || "[]");
}
function saveData(key, data) {
  localStorage.setItem(key, JSON.stringify(data));
}

function renderDashboard() {
  const expenses = getData("expenses");
  const budgets = getData("budgets");
  const spent = expenses.reduce((s, e) => s + e.amount, 0);
  const total = budgets.reduce((s, b) => s + b.limit, 0);
  document.getElementById("dashboard").innerHTML = `
    <p>Total Budget: $${total}</p>
    <p>Total Spent: $${spent}</p>
    <p>Remaining: $${total - spent}</p>`;
}

function addExpense() {
  const desc = document.getElementById("desc").value;
  const amount = parseFloat(document.getElementById("amount").value);
  const category = document.getElementById("category").value;
  if (!desc || !amount) return;
  const expenses = getData("expenses");
  expenses.push({ id: Date.now(), desc, amount, category });
  saveData("expenses", expenses);
  renderExpenses();
}
function renderExpenses() {
  const expenses = getData("expenses");
  document.getElementById("expenseList").innerHTML =
    expenses.map(e => `<li>${e.desc} - $${e.amount} [${e.category}]</li>`).join("");
}

function addBudget() {
  const name = document.getElementById("bname").value;
  const limit = parseFloat(document.getElementById("blimit").value);
  if (!name || !limit) return;
  const budgets = getData("budgets");
  budgets.push({ id: Date.now(), name, limit });
  saveData("budgets", budgets);
  renderBudgets();
}
function renderBudgets() {
  const budgets = getData("budgets");
  document.getElementById("budgetList").innerHTML =
    budgets.map(b => `<li>${b.name} - $${b.limit}</li>`).join("");
}

function renderReports() {
  const expenses = getData("expenses");
  const byCat = {};
  expenses.forEach(e => byCat[e.category] = (byCat[e.category] || 0) + e.amount);

  new Chart(document.getElementById("pieChart"), {
    type: "pie",
    data: { labels: Object.keys(byCat), datasets: [{ data: Object.values(byCat) }] }
  });
}
function exportCSV() {
  const expenses = getData("expenses");
  const csv = Papa.unparse(expenses);
  const blob = new Blob([csv], { type: "text/csv;charset=utf-8;" });
  const link = document.createElement("a");
  link.href = URL.createObjectURL(blob);
  link.download = "report.csv";
  link.click();
}
function exportPDF() {
  const { jsPDF } = window.jspdf;
  const doc = new jsPDF();
  doc.text("Expense Report", 20, 20);
  let y = 40;
  getData("expenses").forEach(e => { doc.text(`${e.desc} - $${e.amount}`, 20, y); y += 10; });
  doc.save("report.pdf");
}

function renderCalendar() {
  const expenses = getData("expenses");
  document.getElementById("calendarList").innerHTML =
    expenses.map(e => `<li>${new Date(e.id).toLocaleDateString()} - ${e.desc} - $${e.amount}</li>`).join("");
}