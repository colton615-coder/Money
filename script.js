function getData(key) {
  return JSON.parse(localStorage.getItem(key) || "[]");
}
function saveData(key, data) {
  localStorage.setItem(key, JSON.stringify(data));
}

// Dashboard
function renderDashboard() {
  const expenses = getData("expenses");
  const budgets = getData("budgets");
  const spent = expenses.reduce((s, e) => s + e.amount, 0);
  const total = budgets.reduce((s, b) => s + b.limit, 0);
  document.getElementById("dashboard").innerHTML = `
    <p class="text-xl font-semibold">Total Budget: <span class="text-green-600">$${total}</span></p>
    <p class="text-xl font-semibold">Total Spent: <span class="text-red-600">$${spent}</span></p>
    <p class="text-xl font-semibold">Remaining: <span class="text-blue-600">$${total - spent}</span></p>`;
}

// Expenses
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
  document.getElementById("expenseList").innerHTML = expenses.map(e => `
    <li class="flex justify-between items-center p-3 bg-white shadow rounded-lg transition hover:scale-[1.01]">
      <div>
        <p class="font-medium">${e.desc} - $${e.amount}</p>
        <span class="text-sm text-gray-500">${e.category}</span>
      </div>
      <button onclick="deleteExpense(${e.id})" class="text-red-500 hover:bg-red-100 p-2 rounded-full">🗑️</button>
    </li>`).join("");
}
function deleteExpense(id) {
  let expenses = getData("expenses");
  expenses = expenses.filter(e => e.id !== id);
  saveData("expenses", expenses);
  renderExpenses();
}

// Budgets
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
  document.getElementById("budgetList").innerHTML = budgets.map(b => `
    <li class="flex justify-between items-center p-3 bg-white shadow rounded-lg transition hover:scale-[1.01]">
      <div>
        <p class="font-medium">${b.name}</p>
        <span class="text-sm text-gray-500">$${b.limit}</span>
      </div>
      <button onclick="deleteBudget(${b.id})" class="text-red-500 hover:bg-red-100 p-2 rounded-full">🗑️</button>
    </li>`).join("");
}
function deleteBudget(id) {
  let budgets = getData("budgets");
  budgets = budgets.filter(b => b.id !== id);
  saveData("budgets", budgets);
  renderBudgets();
}

// Reports
function renderReports() {
  const expenses = getData("expenses");
  const byCat = {};
  expenses.forEach(e => byCat[e.category] = (byCat[e.category] || 0) + e.amount);
  new Chart(document.getElementById("pieChart"), {
    type: "pie",
    data: { labels: Object.keys(byCat), datasets: [{ data: Object.values(byCat), backgroundColor:["#60a5fa","#f87171","#34d399","#fbbf24"] }] }
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

// Calendar
function renderCalendar() {
  const expenses = getData("expenses");
  document.getElementById("calendarList").innerHTML = expenses.map(e => `
    <li class="p-3 bg-white shadow rounded-lg">
      <p class="font-medium">${new Date(e.id).toLocaleDateString()}</p>
      <span class="text-sm text-gray-500">${e.desc} - $${e.amount}</span>
    </li>`).join("");
}